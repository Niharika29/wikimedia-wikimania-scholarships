<?php
/**
 * @section LICENSE
 * This file is part of Wikimania Scholarship Application.
 *
 * Wikimania Scholarship Application is free software: you can redistribute it
 * and/or modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * Wikimania Scholarship Application is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with Wikimania Scholarship Application.  If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * @file
 */

namespace Wikimania\Scholarship;

/**
 * Wikimania scholarships.
 *
 * @author Bryan Davis <bd808@wikimedia.org>
 * @copyright © 2013 Bryan Davis and Wikimedia Foundation.
 */
class App {

	/**
	 * @var string $deployDir
	 */
	protected $deployDir;

	/**
	 * @var \Slim\Slim $slim
	 */
	protected $slim;

	/**
	 * @param string $deployDir Full path to code deployment
	 */
	public function __construct( $deployDir ) {
		$this->deployDir = $deployDir;

		// Common configuration
		$this->slim = new \Slim\Slim( array(
			'mode' => 'production',
			'debug' => false,
			'log.level' => Config::getStr( 'LOG_LEVEL', \Psr\Log\LogLevel::NOTICE ),
			'log.file' => Config::getStr( 'LOG_FILE', 'php://stderr' ),
			'view' => new \Slim\Views\Twig(),
			'view.cache' => Config::getStr( 'CACHE_DIR', "{$this->deployDir}/data/cache" ),
			'smtp.host' => Config::getStr( 'SMTP_HOST', 'localhost' ),
			'templates.path' => "{$this->deployDir}/data/templates",
			'i18n.path' => "{$this->deployDir}/data/i18n",
			'i18n.default' => 'en',
			'db.dsn' => Config::getStr( 'DB_DSN' ),
			'db.user' => Config::getStr( 'DB_USER' ),
			'db.pass' => Config::getStr( 'DB_PASS' ),
		));

		$slim = $this->slim;

		// Production configuration that should not be shared with development
		// Enabled by default or SLIM_MODE=production in environment
		$this->slim->configureMode( 'production', function () use ( $slim ) {
			// Install a custom error handler
			$slim->error( function ( \Exception $e ) use ( $slim ) {
				$errorId = substr( session_id(), 0, 8 ) . '-' . substr( uniqid(), -8 );
				$slim->log->critical( $e->getMessage(), array(
					'exception' => $e,
					'ua' => $slim->request->getUserAgent(),
					'errorId' => $errorId,
				) );
				$slim->view->set( 'errorId', $errorId );
				$slim->render( 'error.html' );
			} );
		});

		// Development configuration
		// Enable by setting SLIM_MODE=development in environment
		$this->slim->configureMode( 'development', function () use ( $slim ) {
			$slim->config( array(
				'debug' => true,
				'log.level' => Config::getStr( 'LOG_LEVEL', \Psr\Log\LogLevel::DEBUG ),
				'view.cache' => false,
			) );
		});

		// Slim does not natively understand being behind a proxy
		// If not corrected template links created via siteUrl() may use the wrong
		// protocol (http instead of https).
		if ( getenv( 'HTTP_X_FORWARDED_PROTO' ) ) {
			$proto = getenv( 'HTTP_X_FORWARDED_PROTO' );
			$this->slim->environment['slim.url_scheme'] = $proto;

			$port = getenv( 'HTTP_X_FORWARDED_PORT' );
			if ( $port === false ) {
				$port = ( $proto == 'https' ) ? '443' : '80';
			}
			$this->slim->environment['SERVER_PORT'] = $port;
		}

		$this->configureIoc();
		$this->configureView();
		$this->configureRoutes();
	}


	/**
	 * Main entry point for all requests.
	 */
	public function run () {

		session_name( '_s' );
		session_cache_limiter(false);
		session_start();

		$this->slim->mock = Config::getBool( 'MOCK' );

		// run the app
		$this->slim->run();
	}


	/**
	 * Configure inversion of control/dependency injection container.
	 */
	protected function configureIoc() {
		$container = $this->slim->container;

		$container->singleton( 'userDao', function ( $c ) {
			return new \Wikimania\Scholarship\Dao\User(
				$c->settings['db.dsn'],
				$c->settings['db.user'], $c->settings['db.pass'],
				$c->log );
		});

		$container->singleton( 'settingsDao', function ( $c ) {
			return new \Wikimania\Scholarship\Dao\Settings(
				$c->settings['db.dsn'],
				$c->settings['db.user'], $c->settings['db.pass'],
				$c->log );
		});

		$container->singleton( 'authManager', function ( $c ) {
			return new \Wikimania\Scholarship\AuthManager( $c->userDao );
		});

		$container->singleton( 'i18nCache', function ( $c ) {
			return new \Wikimedia\SimpleI18n\JsonCache(
				$c->settings['i18n.path'], $c->log
			);
		} );

		$container->singleton( 'i18nContext', function ( $c ) {
			$i18n = new \Wikimedia\SimpleI18n\I18nContext(
				$c->i18nCache, $c->settings['i18n.default'], $c->log
			);
			$i18n->setCurrentLanguage( 'en' );
			return $i18n;
		} );

		$container->singleton( 'applyDao', function ( $c ) {
			$uid = $c->authManager->getUserId();
			$settings = $c->settingsDao->getSettings();
			return new \Wikimania\Scholarship\Dao\Apply(
				$c->settings['db.dsn'],
				$c->settings['db.user'], $c->settings['db.pass'],
				$uid, $settings, $c->log );
		});

		$container->singleton( 'applyForm', function ( $c ) {
			$dao = $c->applyDao;
			return new \Wikimania\Scholarship\Forms\Apply( $dao );
		});

		$container->singleton( 'mailer',  function ( $c ) {
			return new \Wikimania\Scholarship\Mailer(
				array(
					'Host' => $c->settings['smtp.host'],
				),
				$c->log
			);
		});

		// replace default logger with monolog
		$container->singleton( 'log', function ( $c ) {
			// Convert string level to Monolog integer value
			$level = strtoupper( $c->settings['log.level'] );
			$level = constant( "\Monolog\Logger::{$level}" );

			$log = new \Monolog\Logger( 'scholarships' );
			$handler = new \Monolog\Handler\Udp2logHandler(
				$c->settings['log.file'],
				$level
			);
			$handler->setFormatter( new \Monolog\Formatter\LogstashFormatter(
				'scholarships', null, null, '',
				\Monolog\Formatter\LogstashFormatter::V1
			) );
			$handler->pushProcessor( new \Monolog\Processor\PsrLogMessageProcessor() );
			$handler->pushProcessor( new \Monolog\Processor\ProcessIdProcessor() );
			$handler->pushProcessor( new \Monolog\Processor\UidProcessor() );
			$handler->pushProcessor( new \Monolog\Processor\WebProcessor() );
			$log->pushHandler( $handler );
			return $log;
		} );
	}


	/**
	 * Configure view behavior.
	 */
	protected function configureView() {
		// configure twig views
		$view = $this->slim->view;

		$view->parserOptions = array(
			'charset' => 'utf-8',
			'cache' => $this->slim->config( 'view.cache' ),
			'debug' => $this->slim->config( 'debug' ),
			'auto_reload' => true,
			'strict_variables' => !$this->slim->config( 'debug' ),
			'autoescape' => true,
		);

		// install twig parser extensions
		$view->parserExtensions = array(
			new \Slim\Views\TwigExtension(),
			new TwigExtension(),
			new \Wikimedia\SimpleI18n\TwigExtension( $this->slim->i18nContext ),
		);

		// set default view data
		$view->replace( array(
			'app' => $this->slim,
			'i18nCtx' => $this->slim->i18nContext,
		) );
	}


	/**
	 * Configure routes to be handled by application.
	 */
	protected function configureRoutes() {
		$slim = $this->slim;

		// Add a Vary: Cookie header to all responses
		$headerMiddleware = new HeaderMiddleware( array(
			'Vary' => 'Cookie',
		) );
		$slim->add( $headerMiddleware );
		// Add CSRF protection
		$slim->add( new CsrfMiddleware() );

		$middleware = array(

			'must-revalidate' => function () use ( $slim ) {
				// We want clients to cache if they can, but force them to check for
				// updates on subsequent hits
				$slim->response->headers->set(
					'Cache-Control', 'private, must-revalidate, max-age=0' );
				$slim->response->headers->set(
					'Expires', 'Thu, 01 Jan 1970 00:00:00 GMT' );
			},

			'require-user' => function () use ( $slim ) {
				if ( $slim->authManager->isAnonymous() ) {
					// redirect to login form if not authenticated
					if ( $slim->request->isGet() ) {
						$uri = $slim->request->getUrl() . $slim->request->getPath();
						$qs = \Wikimania\Scholarship\Form::qsMerge();
						if ( $qs ) {
							$uri = "{$uri}?{$qs}";
						}
						$_SESSION[AuthManager::NEXTPAGE_SESSION_KEY] = $uri;
					}
					$slim->flash( 'error', 'Login required' );
					$slim->flashKeep();
					$slim->redirect( $slim->urlFor( 'login' ) );
				}

				$user = $slim->authManager->getUser();
				$slim->view->set( 'user', $user );
				$slim->view->set( 'isadmin', $slim->authManager->isAdmin() );
			},

			'require-admin' => function () use ( $slim ) {
				if ( !$slim->authManager->isAdmin() ) {
					// redirect to login form if not an admin user
					if ( $slim->request->isGet() ) {
						$uri = $slim->request->getUrl() . $slim->request->getPath();
						$qs = \Wikimania\Scholarship\Form::qsMerge();
						if ( $qs ) {
							$uri = "{$uri}?{$qs}";
						}
						$_SESSION[AuthManager::NEXTPAGE_SESSION_KEY] = $uri;
					}
					$slim->flash( 'error', 'Admin rights required' );
					$slim->flashKeep();
					$slim->redirect( $slim->urlFor( 'login' ) );
				}
			},

		);

		// "Root" routes for non-autenticated users
		$slim->group( '/', function () use ( $slim, $middleware ) {

			$slim->get( '', function () use ( $slim ) {
				$slim->flashKeep();
				$slim->redirect( $slim->urlFor( 'apply' ) );
			})->name( 'home' );

			$slim->get( 'apply', $middleware['must-revalidate'], function () use ( $slim ) {
				$page = new Controllers\ScholarshipApplication( $slim );
				$page->setDao( $slim->settingsDao );
				$page->setForm( $slim->applyForm );
				$page();
			})->name( 'apply' );

			$slim->post( 'apply', $middleware['must-revalidate'], function () use ( $slim ) {
				$page = new Controllers\ScholarshipApplication( $slim );
				$page->setDao( $slim->settingsDao );
				$page->setForm( $slim->applyForm );
				$page->setMailer( $slim->mailer );
				$page();
			})->name( 'apply_post' );

			$slim->get( 'apply/revalidatecsrf', function () use ( $slim ) {
				$page = new Controllers\RevalidateCsrf( $slim );
				$page();
			})->name( 'revalidatecsrf' );

			App::template( $slim, 'contact' );
			App::template( $slim, 'credits' );
			App::template( $slim, 'privacy' );
			App::template( $slim, 'translate' );

			$slim->get( 'login', $middleware['must-revalidate'], function () use ( $slim ) {
				$page = new Controllers\Login( $slim );
				$page();
			})->name( 'login' );

			$slim->post( 'login.post', $middleware['must-revalidate'], function () use ( $slim ) {
				$page = new Controllers\Login( $slim );
				$page();
			})->name( 'login_post' );

			$slim->get( 'logout', $middleware['must-revalidate'], function () use ( $slim ) {
				$slim->authManager->logout();
				$slim->redirect( $slim->urlFor( 'home' ) );
			})->name( 'logout' );

		});

		// routes for authenticated users
		$slim->group( '/user/',
			$middleware['must-revalidate'], $middleware['require-user'],
			function () use ( $slim, $middleware ) {

			$slim->get( '', function () use ( $slim ) {
				$slim->flashKeep();
				$slim->redirect( $slim->urlFor( 'user_changepassword' ) );
			})->name( 'user_home' );

			$slim->get( 'changePassword', function () use ( $slim ) {
				$page = new Controllers\User\ChangePassword( $slim );
				$page();
			})->name( 'user_changepassword' );

			$slim->post( 'changePassword.post', function () use ( $slim ) {
				$page = new Controllers\User\ChangePassword( $slim );
				$page->setDao( $slim->userDao );
				$page();
			})->name( 'user_changepassword_post' );

		});

		// routes for reviewers
		$slim->group( '/review/',
			$middleware['must-revalidate'], $middleware['require-user'],
			function () use ( $slim, $middleware ) {

			$slim->get( '', function () use ( $slim ) {
				$slim->flashKeep();
				$slim->redirect( $slim->urlFor( 'review_phase1' ) );
			})->name( 'review_home' );

			$slim->get( 'view', function () use ( $slim ) {
				$page = new Controllers\Review\Application( $slim );
				$page->setDao( $slim->applyDao );
				$page();
			})->name( 'review_view' );

			$slim->post( 'view.post', function () use ( $slim ) {
				$page = new Controllers\Review\Application( $slim );
				$page->setDao( $slim->applyDao );
				$page();
			})->name( 'review_view_post' );

			$slim->get( 'phase1', function () use ( $slim ) {
				$page = new Controllers\Review\PhaseGrid( $slim );
				$page->setDao( $slim->applyDao );
				$page->setPhase( 1 );
				$page();
			})->name( 'review_phase1' );

			$slim->get( 'phase2', function () use ( $slim ) {
				$page = new Controllers\Review\PhaseGrid( $slim );
				$page->setDao( $slim->applyDao );
				$page->setPhase( 2 );
				$page();
			})->name( 'review_phase2' );

			$slim->get( 'p1/successList', function () use ( $slim ) {
				$page = new Controllers\Review\Phase1List( $slim );
				$page->setDao( $slim->applyDao );
				$page->setType( Controllers\Review\Phase1List::TYPE_SUCCESS );
				$page();
			})->name( 'review_p1_success' );

			$slim->get( 'p1/failList', function () use ( $slim ) {
				$page = new Controllers\Review\Phase1List( $slim );
				$page->setDao( $slim->applyDao );
				$page->setType( Controllers\Review\Phase1List::TYPE_FAIL );
				$page();
			})->name( 'review_p1_fail' );

			$slim->get( 'p2/list', function () use ( $slim ) {
				$page = new Controllers\Review\Phase2List( $slim );
				$page->setDao( $slim->applyDao );
				$page();
			})->name( 'review_p2_list' );

			$slim->get( 'search', function () use ( $slim ) {
				$page = new Controllers\Review\Search( $slim );
				$page->setDao( $slim->applyDao );
				$page();
			})->name( 'review_search' );

			$slim->get( 'countries', function () use ( $slim ) {
				$page = new Controllers\Review\Countries( $slim );
				$page->setDao( $slim->applyDao );
				$page();
			})->name( 'review_countries' );

			$slim->get( 'scores', function () use ( $slim ) {
				$page = new Controllers\Review\Scores( $slim );
				$page->setDao( $slim->applyDao );
				$page();
			})->name( 'review_scores' );

			$slim->get( 'regions', function () use ( $slim ) {
				$page = new Controllers\Review\Regions( $slim );
				$page->setDao( $slim->applyDao );
				$page();
			})->name( 'review_regions' );

			$slim->get( 'communities', function () use ( $slim ) {
				$page = new Controllers\Review\Communities( $slim );
				$page->setDao( $slim->applyDao );
				$page();
			})->name( 'review_communities' );

		});

		$slim->group( '/admin/',
			$middleware['must-revalidate'], $middleware['require-user'], $middleware['require-admin'],
			function () use ( $slim ) {

			$slim->get( 'users', function () use ( $slim ) {
				$page = new Controllers\Admin\Users( $slim );
				$page->setDao( $slim->userDao );
				$page();
			})->name( 'admin_users' );

			$slim->get( 'user/:id', function ( $id ) use ( $slim ) {
				$page = new Controllers\Admin\User( $slim );
				$page->setDao( $slim->userDao );
				$page( $id );
			})->name( 'admin_user' );

			$slim->get( 'settings', function () use ( $slim ) {
				$page = new Controllers\Admin\Settings( $slim );
				$page->setDao( $slim->settingsDao );
				$page();
			})->name( 'admin_settings' );

			$slim->post( 'settings.post', function () use ( $slim ) {
				$page = new Controllers\Admin\Settings( $slim );
				$page->setDao( $slim->settingsDao );
				$page();
			})->name( 'admin_settings_post' );

			$slim->post( 'user.post', function () use ( $slim ) {
				$page = new Controllers\Admin\User( $slim );
				$page->setDao( $slim->userDao );
				$page->setMailer( $slim->mailer );
				$page();
			})->name( 'admin_user_post' );

		});

		$slim->notFound( function () use ( $slim, $middleware ) {
			$slim->render( '404.html' );
		});
	}


	/**
	 * Add a static template route to the app.
	 * @param \Slim\Slim $slim App
	 * @param string $name Page name
	 * @param string $routeName Name for the route
	 */
	public static function template( $slim, $name, $routeName = null ) {
		$routeName = $routeName ?: $name;

		$slim->get( $name, function () use ( $slim, $name ) {
			$slim->render( "{$name}.html" );
		})->name( $routeName );
	}

} //end App
