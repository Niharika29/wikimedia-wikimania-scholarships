SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL auto_increment,
  `country_name` varchar(30) NOT NULL,
  `country_rank` int(11) NOT NULL,
  `region` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=197 ;

INSERT INTO `countries` (`id`, `country_name`, `country_rank`, `region`) VALUES
(1,    'Afghanistan',                 0, 'region'),
(2,    'Albania',                     0, 'region'),
(3,    'Algeria',                     0, 'region'),
(4,    'Andorra',                     0, 'region'),
(5,    'Angola',                      0, 'region'),
(6,    'Antigua and Barbuda',         0, 'region'),
(7,    'Argentina',                   0, 'region'),
(8,    'Armenia',                     0, 'region'),
(9,    'Australia',                   0, 'region'),
(10,   'Austria',                     0, 'region'),
(11,   'Azerbaijan',                  0, 'region'),
(12,   'Bahamas',                     0, 'region'),
(13,   'Bahrain',                     0, 'region'),
(14,   'Bangladesh',                  0, 'region'),
(15,   'Barbados',                    0, 'region'),
(16,   'Belgium',                     0, 'region'),
(17,   'Belize',                      0, 'region'),
(18,   'Belorus',                     0, 'region'),
(19,   'Benin',                       0, 'region'),
(20,   'Bhutan',                      0, 'region'),
(21,   'Bolivia',                     0, 'region'),
(22,   'Bosnia and Herzegovi',        0, 'region'),
(23,   'Botswana',                    0, 'region'),
(24,   'Brazil',                      0, 'region'),
(25,   'Brunei',                      0, 'region'),
(26,   'Bulgaria',                    0, 'region'),
(27,   'Burkina Faso',                0, 'region'),
(28,   'Burma',                       0, 'region'),
(29,   'Burundi',                     0, 'region'),
(30,   'Cambodia',                    0, 'region'),
(31,   'Cameroon',                    0, 'region'),
(32,   'Canada',                      0, 'region'),
(33,   'Cape Verde',                  0, 'region'),
(34,   'Central African Repu',        0, 'region'),
(35,   'Chad',                        0, 'region'),
(36,   'Chile',                       0, 'region'),
(37,   'China (People''s Repu',       0, 'region'),
(38,   'Colombia',                    0, 'region'),
(39,   'Comoros',                     0, 'region'),
(40,   'Costa Rica',                  0, 'region'),
(41,   'Côte d''Ivoire',              0, 'region'),
(42,   'Croatia',                     0, 'region'),
(43,   'Cuba',                        0, 'region'),
(44,   'Cyprus',                      0, 'region'),
(45,   'Czech Republic',              0, 'region'),
(46,   'Democratic Republic ',        0, 'region'),
(47,   'Denmark',                     0, 'region'),
(48,   'Djibouti',                    0, 'region'),
(49,   'Dominica',                    0, 'region'),
(50,   'Dominican Republic',          0, 'region'),
(51,   'East Timor',                  0, 'region'),
(52,   'Ecuador',                     0, 'region'),
(53,   'Egypt',                       0, 'region'),
(54,   'El Salvador',                 0, 'region'),
(55,   'Equatorial Guinea',           0, 'region'),
(56,   'Eritrea',                     0, 'region'),
(57,   'Estonia',                     0, 'region'),
(58,   'Ethiopia',                    0, 'region'),
(59,   'Federated States of ',        0, 'region'),
(60,   'Fiji',                        0, 'region'),
(61,   'Finland',                     0, 'region'),
(62,   'France',                      0, 'region'),
(63,   'Gabon',                       0, 'region'),
(64,   'Gambia',                      0, 'region'),
(65,   'Georgia',                     0, 'region'),
(66,   'Germany',                     0, 'region'),
(67,   'Ghana',                       0, 'region'),
(68,   'Greece',                      0, 'region'),
(69,   'Grenada',                     0, 'region'),
(70,   'Guatemala',                   0, 'region'),
(71,   'Guinea',                      0, 'region'),
(72,   'Guinea-Bissau',               0, 'region'),
(73,   'Guyana',                      0, 'region'),
(74,   'Haiti',                       0, 'region'),
(75,   'Honduras',                    0, 'region'),
(76,   'Hungary',                     0, 'region'),
(77,   'Iceland',                     0, 'region'),
(78,   'India',                       0, 'region'),
(79,   'Indonesia',                   0, 'region'),
(80,   'Iran',                        0, 'region'),
(81,   'Iraq',                        0, 'region'),
(82,   'Ireland',                     0, 'region'),
(83,   'Israel',                      0, 'region'),
(84,   'Italy',                       0, 'region'),
(85,   'Jamaica',                     0, 'region'),
(86,   'Japan',                       0, 'region'),
(87,   'Jordan',                      0, 'region'),
(88,   'Kazakhstan',                  0, 'region'),
(89,   'Kenya',                       0, 'region'),
(90,   'Kiribati',                    0, 'region'),
(91,   'Kuwait',                      0, 'region'),
(92,   'Kyrgyzstan',                  0, 'region'),
(93,   'Laos',                        0, 'region'),
(94,   'Latvia',                      0, 'region'),
(95,   'Lebanon',                     0, 'region'),
(96,   'Lesotho',                     0, 'region'),
(97,   'Liberia',                     0, 'region'),
(98,   'Libya',                       0, 'region'),
(99,   'Liechtenstein',               0, 'region'),
(100,  'Lithuania',                   0, 'region'),
(101,  'Luxembourg',                  0, 'region'),
(102,  'Macedonia',                   0, 'region'),
(103,  'Madagascar',                  0, 'region'),
(104,  'Malawi',                      0, 'region'),
(105,  'Malaysia',                    0, 'region'),
(106,  'Maldives',                    0, 'region'),
(107,  'Mali',                        0, 'region'),
(108,  'Malta',                       0, 'region'),
(109,  'Marshall Islands',            0, 'region'),
(110,  'Mauritania',                  0, 'region'),
(111,  'Mauritius',                   0, 'region'),
(112,  'Mexico',                      0, 'region'),
(113,  'Moldova',                     0, 'region'),
(114,  'Monaco',                      0, 'region'),
(115,  'Mongolia',                    0, 'region'),
(116,  'Montenegro',                  0, 'region'),
(117,  'Morocco',                     0, 'region'),
(118,  'Mozambique',                  0, 'region'),
(119,  'Namibia',                     0, 'region'),
(120,  'Nauru',                       0, 'region'),
(121,  'Nepal',                       0, 'region'),
(122,  'Netherlands',                 0, 'region'),
(123,  'New Zealand',                 0, 'region'),
(124,  'Nicaragua',                   0, 'region'),
(125,  'Niger',                       0, 'region'),
(126,  'Nigeria',                     0, 'region'),
(127,  'North Korea',                 0, 'region'),
(128,  'Norway',                      0, 'region'),
(129,  'Oman',                        0, 'region'),
(130,  'Pakistan',                    0, 'region'),
(131,  'Palau',                       0, 'region'),
(132,  'Panama',                      0, 'region'),
(133,  'Papua New Guinea',            0, 'region'),
(134,  'Paraguay',                    0, 'region'),
(135,  'Peru',                        0, 'region'),
(136,  'Philippines',                 0, 'region'),
(137,  'Poland',                      0, 'region'),
(138,  'Portugal',                    0, 'region'),
(139,  'Qatar',                       0, 'region'),
(140,  'Republic of Congo',           0, 'region'),
(141,  'Romania',                     0, 'region'),
(142,  'Russia',                      0, 'region'),
(143,  'Rwanda',                      0, 'region'),
(144,  'Saint Kitts and Nevi',        0, 'region'),
(145,  'Saint Lucia',                 0, 'region'),
(146,  'Saint Vincent and th',        0, 'region'),
(147,  'Samoa',                       0, 'region'),
(148,  'San Marino',                  0, 'region'),
(149,  'São Tomé and Príncip',        0, 'region'),
(150,  'Saudi Arabia',                0, 'region'),
(151,  'Senegal',                     0, 'region'),
(152,  'Serbia',                      0, 'region'),
(153,  'Seychelles',                  0, 'region'),
(154,  'Sierra Leone',                0, 'region'),
(155,  'Singapore',                   0, 'region'),
(156,  'Slovakia',                    0, 'region'),
(157,  'Slovenia',                    0, 'region'),
(158,  'Solomon Islands',             0, 'region'),
(159,  'Somalia',                     0, 'region'),
(160,  'South Africa',                0, 'region'),
(161,  'South Korea',                 0, 'region'),
(162,  'Spain',                       0, 'region'),
(163,  'Sri Lanka',                   0, 'region'),
(164,  'Sudan',                       0, 'region'),
(165,  'Suriname',                    0, 'region'),
(166,  'Swaziland',                   0, 'region'),
(167,  'Sweden',                      0, 'region'),
(168,  'Switzerland',                 0, 'region'),
(169,  'Syria',                       0, 'region'),
(170,  'Thailand',                    0, 'region'),
(171,  'Tajikistan',                  0, 'region'),
(172,  'Tanzania',                    0, 'region'),
(173,  'Togo',                        0, 'region'),
(174,  'Tonga',                       0, 'region'),
(175,  'Trinidad and Tobago',         0, 'region'),
(176,  'Tunisia',                     0, 'region'),
(177,  'Turkey',                      0, 'region'),
(178,  'Turkmenistan',                0, 'region'),
(179,  'Tuvalu',                      0, 'region'),
(180,  'Uganda',                      0, 'region'),
(181,  'Ukraine',                     0, 'region'),
(182,  'United Arab Emirates',        0, 'region'),
(183,  'United Kingdom',              0, 'region'),
(184,  'United States of America',    0, 'region'),
(185,  'Uruguay',                     0, 'region'),
(186,  'Uzbekistan',                  0, 'region'),
(187,  'Vanuatu',                     0, 'region'),
(188,  'Vatican',                     0, 'region'),
(189,  'Venezuela',                   0, 'region'),
(190,  'Vietnam',                     0, 'region'),
(191,  'Yemen',                       0, 'region'),
(192,  'Zambia',                      0, 'region'),
(193,  'Zimbabwe',                    0, 'region'),
(194,  'Taiwan (Republic of China)',  0, 'region'),
(195,  'Hong Kong',                   0, 'region'),
(196,  'Macao',                       0, 'region');

CREATE TABLE IF NOT EXISTS `rankings` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `scholarship_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL default '0',
  `criterion` enum('valid','onwiki','offwiki','nationality','representation','special','future') default NULL,
  `entered_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `scholarship_id` (`scholarship_id`),
  KEY `user_id` (`user_id`,`scholarship_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `registration` (
  `unique_code` varchar(8) NOT NULL,
  `given_name` varchar(24)  NOT NULL,
  `surname` varchar(24)  NOT NULL,
  `sex` enum('m','f','d') NOT NULL,
  `country` varchar(4) NOT NULL,
  `langn` varchar(4) NOT NULL,
  `lang1` varchar(4) NOT NULL,
  `lang1-level` enum('1','2','3','4') NOT NULL,
  `lang2` varchar(4) NOT NULL,
  `lang2-level` enum('1','2','3','4') NOT NULL,
  `lang3` varchar(4) NOT NULL,
  `lang3-level` enum('1','2','3','4') NOT NULL,
  `wiki_id` varchar(100)  NOT NULL,
  `wiki_language` varchar(12) NOT NULL,
  `wiki_project` varchar(12) NOT NULL,
  `email` varchar(48)  NOT NULL,
  `join_date` set('1','2','3','4','5','6','7') NOT NULL,
  `tours` enum('','1','2','3','4','5') NOT NULL,
  `showname` set('1','2','3') NOT NULL,
  `custom_showname` varchar(30)  NOT NULL,
  `size` enum('XXS','XS','S','M','L','XL','XXL','XXXL') NOT NULL,
  `color` enum('W','B') default NULL,
  `food` enum('','1','2','3') NOT NULL,
  `food_other` varchar(64)  NOT NULL,
  `visa_assistance` tinyint(1) NOT NULL,
  `nationality` varchar(4) NOT NULL,
  `passport` varchar(30)  NOT NULL,
  `passport_valid` date default NULL,
  `passport_issued` varchar(30)  NOT NULL,
  `birthday` date default NULL,
  `countryofbirth` varchar(4) NOT NULL,
  `homeaddress` text  NOT NULL,
  `visa_assistance_description` text  NOT NULL,
  `nights` set('1','2','3','4','5','6','7','8') NOT NULL,
  `room` enum('','1','2','3') NOT NULL,
  `room_partner` varchar(64)  NOT NULL,
  `room_number` varchar(5)  default NULL,
  `room_requests` text  NOT NULL,
  `hotels` enum('','1','2','3','4','5','6','7','8','9') NOT NULL,
  `discount_code` varchar(16)  NOT NULL,
  `signuptime` datetime NOT NULL,
  `attendance_cost` decimal(10,2) NOT NULL,
  `accommodation_cost` decimal(10,2) NOT NULL,
  `vat_cost` decimal(10,2) NOT NULL,
  `cost_total` decimal(10,2) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `paypal` tinyint(1) NOT NULL,
  `cost_paid` decimal(10,2) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY  (`unique_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `scholarships` (
  `id` int(11) NOT NULL auto_increment,
  `fname` varchar(32)  default NULL,
  `lname` varchar(32)  default NULL,
  `email` varchar(64) default NULL,
  `telephone` varchar(16) default NULL,
  `address` text,
  `nationality` varchar(64) default NULL,
  `residence` varchar(64) default NULL,
  `haspassport` tinyint(1) default NULL,
  `airport` varchar(64)  default NULL,
  `languages` varchar(64)  default NULL,
  `dob` date default NULL,
  `sex` enum('m','f','d') default NULL,
  `occupation` varchar(64)  default NULL,
  `areaofstudy` varchar(64)  default NULL,
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
  `presentationTopic` text,
  `howheard` text,
  `why` text,
  `future` text,
  `englistAbility` text,
  `username` varchar(64)  default NULL,
  `project` text,
  `projectlangs` text,
  `involvement` text,
  `contribution` text,
  `wantspartial` tinyint(1) NOT NULL default '0',
  `canpaydiff` tinyint(1) NOT NULL default '0',
  `sincere` tinyint(1) NOT NULL default '0',
  `agreestotravelconditions` tinyint(1) NOT NULL default '0',
  `willgetvisa` tinyint(1) NOT NULL default '0',
  `willpayincidentals` tinyint(1) NOT NULL default '0',
  `chapteragree` tinyint(1) NOT NULL default '0',
  `wmfAgreeName` text,
  `rank` int(11) NOT NULL default '0',
  `notes` text,
  `exclude` tinyint(1) NOT NULL default '0',
  `confirmed` tinyint(1) NOT NULL default '0',
  `confhash` varchar(8) default NULL,
  `entered_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ipaddr` varbinary(16) default 2130706433, -- default is 127.0.0.1
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(20) default NULL,
  `password` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `reviewer` tinyint(1) default NULL,
  `isvalid` tinyint(1) default NULL,
  `isadmin` tinyint(1) default NULL,
  `blocked` tinyint(1) default 0,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000 ;
