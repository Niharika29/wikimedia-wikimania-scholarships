CREATE TABLE IF NOT EXISTS `admins` (
  `user_id` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL auto_increment,
  `country_name` varchar(30) NOT NULL,
  `country_rank` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  UNIQUE KEY `id_3` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=197 ;

INSERT INTO `countries` (`id`, `country_name`, `country_rank`) VALUES
(1, 'Afghanistan', 0),
(2, 'Albania', 0),
(3, 'Algeria', 0),
(4, 'Andorra', 0),
(5, 'Angola', 0),
(6, 'Antigua and Barbuda', 0),
(7, 'Argentina', 0),
(8, 'Armenia', 0),
(9, 'Australia', 0),
(10, 'Austria', 0),
(11, 'Azerbaijan', 0),
(12, 'Bahamas', 0),
(13, 'Bahrain', 0),
(14, 'Bangladesh', 0),
(15, 'Barbados', 0),
(16, 'Belgium', 0),
(17, 'Belize', 0),
(18, 'Belorus', 0),
(19, 'Benin', 0),
(20, 'Bhutan', 0),
(21, 'Bolivia', 0),
(22, 'Bosnia and Herzegovi', 0),
(23, 'Botswana', 0),
(24, 'Brazil', 0),
(25, 'Brunei', 0),
(26, 'Bulgaria', 0),
(27, 'Burkina Faso', 0),
(28, 'Burma', 0),
(29, 'Burundi', 0),
(30, 'Cambodia', 0),
(31, 'Cameroon', 0),
(32, 'Canada', 0),
(33, 'Cape Verde', 0),
(34, 'Central African Repu', 0),
(35, 'Chad', 0),
(36, 'Chile', 0),
(37, 'China (People''s Repu', 0),
(38, 'Colombia', 0),
(39, 'Comoros', 0),
(40, 'Costa Rica', 0),
(41, 'Côte d''Ivoire', 0),
(42, 'Croatia', 0),
(43, 'Cuba', 0),
(44, 'Cyprus', 0),
(45, 'Czech Republic', 0),
(46, 'Democratic Republic ', 0),
(47, 'Denmark', 0),
(48, 'Djibouti', 0),
(49, 'Dominica', 0),
(50, 'Dominican Republic', 0),
(51, 'East Timor', 0),
(52, 'Ecuador', 0),
(53, 'Egypt', 0),
(54, 'El Salvador', 0),
(55, 'Equatorial Guinea', 0),
(56, 'Eritrea', 0),
(57, 'Estonia', 0),
(58, 'Ethiopia', 0),
(59, 'Federated States of ', 0),
(60, 'Fiji', 0),
(61, 'Finland', 0),
(62, 'France', 0),
(63, 'Gabon', 0),
(64, 'Gambia', 0),
(65, 'Georgia', 0),
(66, 'Germany', 0),
(67, 'Ghana', 0),
(68, 'Greece', 0),
(69, 'Grenada', 0),
(70, 'Guatemala', 0),
(71, 'Guinea', 0),
(72, 'Guinea-Bissau', 0),
(73, 'Guyana', 0),
(74, 'Haiti', 0),
(75, 'Honduras', 0),
(76, 'Hungary', 0),
(77, 'Iceland', 0),
(78, 'India', 0),
(79, 'Indonesia', 0),
(80, 'Iran', 0),
(81, 'Iraq', 0),
(82, 'Ireland', 0),
(83, 'Israel', 0),
(84, 'Italy', 0),
(85, 'Jamaica', 0),
(86, 'Japan', 0),
(87, 'Jordan', 0),
(88, 'Kazakhstan', 0),
(89, 'Kenya', 0),
(90, 'Kiribati', 0),
(91, 'Kuwait', 0),
(92, 'Kyrgyzstan', 0),
(93, 'Laos', 0),
(94, 'Latvia', 0),
(95, 'Lebanon', 0),
(96, 'Lesotho', 0),
(97, 'Liberia', 0),
(98, 'Libya', 0),
(99, 'Liechtenstein', 0),
(100, 'Lithuania', 0),
(101, 'Luxembourg', 0),
(102, 'Macedonia', 0),
(103, 'Madagascar', 0),
(104, 'Malawi', 0),
(105, 'Malaysia', 0),
(106, 'Maldives', 0),
(107, 'Mali', 0),
(108, 'Malta', 0),
(109, 'Marshall Islands', 0),
(110, 'Mauritania', 0),
(111, 'Mauritius', 0),
(112, 'Mexico', 0),
(113, 'Moldova', 0),
(114, 'Monaco', 0),
(115, 'Mongolia', 0),
(116, 'Montenegro', 0),
(117, 'Morocco', 0),
(118, 'Mozambique', 0),
(119, 'Namibia', 0),
(120, 'Nauru', 0),
(121, 'Nepal', 0),
(122, 'Netherlands', 0),
(123, 'New Zealand', 0),
(124, 'Nicaragua', 0),
(125, 'Niger', 0),
(126, 'Nigeria', 0),
(127, 'North Korea', 0),
(128, 'Norway', 0),
(129, 'Oman', 0),
(130, 'Pakistan', 0),
(131, 'Palau', 0),
(132, 'Panama', 0),
(133, 'Papua New Guinea', 0),
(134, 'Paraguay', 0),
(135, 'Peru', 0),
(136, 'Philippines', 0),
(137, 'Poland', 0),
(138, 'Portugal', 0),
(139, 'Qatar', 0),
(140, 'Republic of Congo', 0),
(141, 'Romania', 0),
(142, 'Russia', 0),
(143, 'Rwanda', 0),
(144, 'Saint Kitts and Nevi', 0),
(145, 'Saint Lucia', 0),
(146, 'Saint Vincent and th', 0),
(147, 'Samoa', 0),
(148, 'San Marino', 0),
(149, 'São Tomé and Príncip', 0),
(150, 'Saudi Arabia', 0),
(151, 'Senegal', 0),
(152, 'Serbia', 0),
(153, 'Seychelles', 0),
(154, 'Sierra Leone', 0),
(155, 'Singapore', 0),
(156, 'Slovakia', 0),
(157, 'Slovenia', 0),
(158, 'Solomon Islands', 0),
(159, 'Somalia', 0),
(160, 'South Africa', 0),
(161, 'South Korea', 0),
(162, 'Spain', 0),
(163, 'Sri Lanka', 0),
(164, 'Sudan', 0),
(165, 'Suriname', 0),
(166, 'Swaziland', 0),
(167, 'Sweden', 0),
(168, 'Switzerland', 0),
(169, 'Syria', 0),
(170, 'Thailand', 0),
(171, 'Tajikistan', 0),
(172, 'Tanzania', 0),
(173, 'Togo', 0),
(174, 'Tonga', 0),
(175, 'Trinidad and Tobago', 0),
(176, 'Tunisia', 0),
(177, 'Turkey', 0),
(178, 'Turkmenistan', 0),
(179, 'Tuvalu', 0),
(180, 'Uganda', 0),
(181, 'Ukraine', 0),
(182, 'United Arab Emirates', 0),
(183, 'United Kingdom', 0),
(184, 'United States of America', 0),
(185, 'Uruguay', 0),
(186, 'Uzbekistan', 0),
(187, 'Vanuatu', 0),
(188, 'Vatican', 0),
(189, 'Venezuela', 0),
(190, 'Vietnam', 0),
(191, 'Yemen', 0),
(192, 'Zambia', 0),
(193, 'Zimbabwe', 0),
(194, 'Taiwan (Republic of ', 0),
(195, 'Hong Kong', 0),
(196, 'Macao', 0);

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `rankings` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `scholarship_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL default '0',
  `criterion` enum('valid','onwiki','offwiki','nationality','representation','special','future') default NULL,
  `entered_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `scholarship_id` (`scholarship_id`),
  KEY `user_id` (`user_id`,`scholarship_id`),
  KEY `user_id_2` (`user_id`,`scholarship_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35029 ;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `registration` (
  `unique_code` varchar(8) NOT NULL,
  `given_name` varchar(24) character set utf8 NOT NULL,
  `surname` varchar(24) character set utf8 NOT NULL,
  `sex` enum('m','f','d') NOT NULL,
  `country` varchar(4) NOT NULL,
  `langn` varchar(4) NOT NULL,
  `lang1` varchar(4) NOT NULL,
  `lang1-level` enum('1','2','3','4') NOT NULL,
  `lang2` varchar(4) NOT NULL,
  `lang2-level` enum('1','2','3','4') NOT NULL,
  `lang3` varchar(4) NOT NULL,
  `lang3-level` enum('1','2','3','4') NOT NULL,
  `wiki_id` varchar(100) character set utf8 NOT NULL,
  `wiki_language` varchar(12) NOT NULL,
  `wiki_project` varchar(12) NOT NULL,
  `email` varchar(48) character set utf8 NOT NULL,
  `join_date` set('1','2','3','4','5','6','7') NOT NULL,
  `tours` enum('','1','2','3','4','5') NOT NULL,
  `showname` set('1','2','3') NOT NULL,
  `custom_showname` varchar(30) character set utf8 NOT NULL,
  `size` enum('XXS','XS','S','M','L','XL','XXL','XXXL') NOT NULL,
  `color` enum('W','B') default NULL,
  `food` enum('','1','2','3') NOT NULL,
  `food_other` varchar(64) character set utf8 NOT NULL,
  `visa_assistance` tinyint(1) NOT NULL,
  `nationality` varchar(4) NOT NULL,
  `passport` varchar(30) character set utf8 NOT NULL,
  `passport_valid` date default NULL,
  `passport_issued` varchar(30) character set utf8 NOT NULL,
  `birthday` date default NULL,
  `countryofbirth` varchar(4) NOT NULL,
  `homeaddress` text character set utf8 NOT NULL,
  `visa_assistance_description` text character set utf8 NOT NULL,
  `nights` set('1','2','3','4','5','6','7','8') NOT NULL,
  `room` enum('','1','2','3') NOT NULL,
  `room_partner` varchar(64) character set utf8 NOT NULL,
  `room_number` varchar(5) character set utf8 default NULL,
  `room_requests` text character set utf8 NOT NULL,
  `hotels` enum('','1','2','3','4','5','6','7','8','9') NOT NULL,
  `discount_code` varchar(16) character set utf8 NOT NULL,
  `signuptime` datetime NOT NULL,
  `attendance_cost` decimal(10,2) NOT NULL,
  `accommodation_cost` decimal(10,2) NOT NULL,
  `vat_cost` decimal(10,2) NOT NULL,
  `cost_total` decimal(10,2) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `paypal` tinyint(1) NOT NULL,
  `cost_paid` decimal(10,2) NOT NULL,
  `status` smallint(6) NOT NULL,
  UNIQUE KEY `unique_code` (`unique_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `scholarships` (
  `id` int(11) NOT NULL auto_increment,
  `fname` varchar(32) character set utf8 default NULL,
  `lname` varchar(32) character set utf8 default NULL,
  `email` varchar(64) default NULL,
  `telephone` varchar(16) default NULL,
  `address` text character set utf8,
  `nationality` varchar(64) default NULL,
  `residence` varchar(64) default NULL,
  `haspassport` tinyint(1) default NULL,
  `airport` varchar(64) character set utf8 default NULL,
  `languages` varchar(64) character set utf8 default NULL,
  `dob` date default NULL,
  `sex` enum('m','f','d') default NULL,
  `occupation` varchar(64) character set utf8 default NULL,
  `areaofstudy` varchar(64) character set utf8 default NULL,
  `wm05` tinyint(1) default NULL,
  `wm06` tinyint(1) default NULL,
  `wm07` tinyint(1) default NULL,
  `wm08` tinyint(1) default NULL,
  `wm09` tinyint(1) default NULL,
  `wm10` tinyint(1) default NULL,
  `wm11` tinyint(1) default NULL,
  `wm12` tinyint(1) default NULL,
  `wm13` tinyint(1) default NULL,
  `presentation` tinyint(1) default NULL,
  `howheard` text character set utf8,
  `why` text character set utf8,
  `future` text character set utf8,
  `englistAbility` text character set utf8,
  `username` varchar(64) character set utf8 default NULL,
  `presentationTopic` text,
  `project` text,
  `projectlangs` text,
  `involvement` text character set utf8,
  `contribution` text character set utf8,
  `wantspartial` tinyint(1) NOT NULL default '0',
  `canpaydiff` tinyint(1) NOT NULL default '0',
  `sincere` tinyint(1) NOT NULL default '0',
  `agreestotravelconditions` tinyint(1) NOT NULL default '0',
  `willgetvisa` tinyint(1) NOT NULL default '0',
  `willpayincidentals` tinyint(1) NOT NULL default '0',
  `chapteragree` tinyint(1) NOT NULL default '0',
  `wmfAgreeName` text character set utf8,
  `rank` int(11) NOT NULL default '0',
  `notes` text character set utf8,
  `exclude` tinyint(1) NOT NULL default '0',
  `confirmed` tinyint(1) NOT NULL default '0',
  `confhash` varchar(8) default NULL,
  `entered_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ipaddr` varbinary(15) default '127.0.0.1',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(20) default NULL,
  `password` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `reviewer` tinyint(1) default NULL,
  `isvalid` tinyint(1) default NULL,
  `isadmin` tinyint(1) default NULL,
  `blocked` tinyint(1) default 0,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;
