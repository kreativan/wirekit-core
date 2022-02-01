# --- WireDatabaseBackup {"time":"2022-02-01 15:53:52","user":"","dbName":"wirekit_core","description":"","tables":[],"excludeTables":["pages_drafts","pages_roles","permissions","roles","roles_permissions","users","users_roles","user","role","permission"],"excludeCreateTables":[],"excludeExportTables":["field_roles","field_permissions","field_email","field_pass","caches","session_login_throttle","page_path_history"]}

DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(250) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_acp_scripts_and_styles`;
CREATE TABLE `field_acp_scripts_and_styles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_acp_template`;
CREATE TABLE `field_acp_template` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_acp_template` (`pages_id`, `data`) VALUES('1075', 'site/templates/vendor/admin/system.php');

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_admin_theme` (`pages_id`, `data`) VALUES('41', '159');

DROP TABLE IF EXISTS `field_bg`;
CREATE TABLE `field_bg` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_body`;
CREATE TABLE `field_body` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1047', '<p>Proident quas sagittis, ullamcorper aliquip sed! Labore consectetuer, hymenaeos esse asperiores dolorum sollicitudin quos cillum, cubilia inceptos mollis tellus bibendum. Volutpat eaque veniam rhoncus, quisque reiciendis. Fames hac, dictumst voluptatem, leo, dignissim, iaculis accusamus? Nam dolorem dolore laudantium cillum. Parturient, ultrices excepturi! Nihil consequatur accusamus maecenas rerum tincidunt, aspernatur possimus. Nisi officia aliquid dui? Earum, platea suspendisse minus diam parturient, elit class et? Commodo! Natoque magni perspiciatis earum malesuada! Aliquet. Nostrud nostra? Potenti ut, exercitation, duis sodales nulla fugiat necessitatibus leo, molestie venenatis felis, ipsa ut? Faucibus dis, maxime mattis, tempus quia! Eos minima eveniet velit, maecenas iusto! Repudiandae eleifend.</p>\n\n<p>Suscipit blanditiis ullam laboris distinctio scelerisque commodi mattis. Hymenaeos maxime aliquid sodales maxime nibh. Semper, quis proident interdum. Orci perspiciatis? Nostrud dictumst, consequuntur perferendis, sapiente recusandae sem mollit pharetra consequatur nobis ratione pariatur suscipit iaculis fugiat! Velit, tincidunt ipsum porta! Venenatis libero, illum irure, accusantium occaecat, ullam nec quos auctor fusce nemo architecto libero perferendis tortor, vestibulum, mollis imperdiet sociis. Amet repellendus labore id tempora sem imperdiet lectus odit reiciendis repellendus minus. Tristique non luctus! Congue, et metus orci doloribus similique felis senectus euismod, vestibulum amet leo nihil, libero quae venenatis exercitation minima tellus esse sint metus magni praesentium? Ratione.</p>\n\n<p>Quia voluptatem illum dis ipsam dolorem aperiam orci excepturi magni commodo rhoncus provident! Laborum aute amet eleifend elit veniam quia praesentium ipsam habitant facere, nam aliquet metus eiusmod lacus mollit. Molestias alias, maecenas! Lectus, diamlorem nibh vel inceptos ultricies donec aute suscipit in magna. Felis laboriosam? Aliquip pede, cras eos fames nobis imperdiet conubia adipisci ridiculus, id fermentum! Nesciunt temporibus, reiciendis id velit ab eiusmod pariatur doloribus, ducimus nonummy purus distinctio nemo, impedit explicabo ipsa, mollis pharetra. Donec? Etiam minim? Autem leo fringilla asperiores, rerum corporis provident euismod, iusto volutpat, sodales eu. Officiis sint parturient laudantium! Nullam quo hic debitis.</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('27', '<h2 style=\"text-align:center;\">ooops...<strong><em> </em></strong></h2>\n\n<h1 style=\"text-align:center;\"><strong><em>404 </em></strong></h1>\n\n<h3 style=\"text-align:center;\">Page Not Found</h3>');

DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_favicon`;
CREATE TABLE `field_favicon` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_headline`;
CREATE TABLE `field_headline` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1000', '{Search} Website');

DROP TABLE IF EXISTS `field_images`;
CREATE TABLE `field_images` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `filedata` mediumtext DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_img`;
CREATE TABLE `field_img` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_link`;
CREATE TABLE `field_link` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1055', '{{home}}http404');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1056', '{{home}}dev/');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1038', '#footer');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1091', '{{home}}wirekit/svg/');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1045', '/ajax/test/?id=1');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1120', 'vendor/htmx/core/test/');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1122', '{{home}}wirekit/ui/');

DROP TABLE IF EXISTS `field_link_attr`;
CREATE TABLE `field_link_attr` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_link_title`;
CREATE TABLE `field_link_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_link_title` (`pages_id`, `data`) VALUES('1121', 'Page (SPA) Navigation');

DROP TABLE IF EXISTS `field_link_type`;
CREATE TABLE `field_link_type` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1038', '1105', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1055', '1107', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1056', '1107', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1091', '1107', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1122', '1107', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1045', '1108', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1048', '1108', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1121', '1108', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1120', '1110', '0');

DROP TABLE IF EXISTS `field_logo`;
CREATE TABLE `field_logo` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_markdown`;
CREATE TABLE `field_markdown` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_media`;
CREATE TABLE `field_media` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  `tags` varchar(250) NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`),
  FULLTEXT KEY `tags` (`tags`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_menu`;
CREATE TABLE `field_menu` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_menu` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1038', '1121,1056,1055,1120,1122,1091', '6', '1040');
INSERT INTO `field_menu` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1045', '', '0', '1046');
INSERT INTO `field_menu` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1048', '', '0', '1049');

DROP TABLE IF EXISTS `field_page_icon`;
CREATE TABLE `field_page_icon` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_page_icon` (`pages_id`, `data`) VALUES('1075', 'cogs');

DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT 0,
  `data` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_process` (`pages_id`, `data`) VALUES('6', '17');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('3', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('8', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('9', '14');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('10', '7');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('11', '47');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('16', '48');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('300', '104');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('21', '50');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('29', '66');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('23', '10');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('304', '138');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('31', '136');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('22', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('30', '68');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('303', '129');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('2', '87');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('302', '121');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('301', '109');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('28', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1007', '150');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1009', '158');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1011', '160');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1015', '170');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1078', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1025', '194');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1027', '196');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1033', '199');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1075', '193');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1085', '239');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_scripts_in_footer`;
CREATE TABLE `field_scripts_in_footer` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_scripts_in_head`;
CREATE TABLE `field_scripts_in_head` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_search_index`;
CREATE TABLE `field_search_index` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_search_index` (`pages_id`, `data`) VALUES('1047', 'Basic Page ... Proident quas sagittis, ullamcorper aliquip sed! Labore consectetuer, hymenaeos esse asperiores dolorum sollicitudin quos cillum, cubilia inceptos mollis tellus bibendum. Volutpat eaque veniam rhoncus, quisque reiciendis. Fames hac, dictumst voluptatem, leo, dignissim, iaculis accusamus? Nam dolorem dolore laudantium cillum. Parturient, ultrices excepturi! Nihil consequatur accusamus maecenas rerum tincidunt, aspernatur possimus. Nisi officia aliquid dui? Earum, platea suspendisse minus diam parturient, elit class et? Commodo! Natoque magni perspiciatis earum malesuada! Aliquet. Nostrud nostra? Potenti ut, exercitation, duis sodales nulla fugiat necessitatibus leo, molestie venenatis felis, ipsa ut? Faucibus dis, maxime mattis, tempus quia! Eos minima eveniet velit, maecenas iusto! Repudiandae eleifend. Suscipit blanditiis ullam laboris distinctio scelerisque commodi mattis. Hymenaeos maxime aliquid sodales maxime nibh. Semper, quis proident interdum. Orci perspiciatis? Nostrud dictumst, consequuntur perferendis, sapiente recusandae sem mollit pharetra consequatur nobis ratione pariatur suscipit iaculis fugiat! Velit, tincidunt ipsum porta! Venenatis libero, illum irure, accusantium occaecat, ullam nec quos auctor fusce nemo architecto libero perferendis tortor, vestibulum, mollis imperdiet sociis. Amet repellendus labore id tempora sem imperdiet lectus odit reiciendis repellendus minus. Tristique non luctus! Congue, et metus orci doloribus similique felis senectus euismod, vestibulum amet leo nihil, libero quae venenatis exercitation minima tellus esse sint metus magni praesentium? Ratione. Quia voluptatem illum dis ipsam dolorem aperiam orci excepturi magni commodo rhoncus provident! Laborum aute amet eleifend elit veniam quia praesentium ipsam habitant facere, nam aliquet metus eiusmod lacus mollit. Molestias alias, maecenas! Lectus, diamlorem nibh vel inceptos ultricies donec aute suscipit in magna. Felis laboriosam? Aliquip pede, cras eos fames nobis imperdiet conubia adipisci ridiculus, id fermentum! Nesciunt temporibus, reiciendis id velit ab eiusmod pariatur doloribus, ducimus nonummy purus distinctio nemo, impedit explicabo ipsa, mollis pharetra. Donec? Etiam minim? Autem leo fringilla asperiores, rerum corporis provident euismod, iusto volutpat, sodales eu. Officiis sint parturient laudantium! Nullam quo hic debitis. \n{}');

DROP TABLE IF EXISTS `field_select_page`;
CREATE TABLE `field_select_page` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1048', '1000', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1038', '1035', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1045', '1047', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1121', '1047', '0');

DROP TABLE IF EXISTS `field_static`;
CREATE TABLE `field_static` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_static` (`pages_id`, `data`) VALUES('1035', '{\"default_lang\":\"en\",\"site_name\":\"WireKit\",\"email\":\"kreativan.dev@gmail.com\",\"site_email\":\"\",\"phone\":\"12345678\",\"address\":\"Milky Way, Universe\",\"google_fonts_link\":\"https:\\/\\/fonts.googleapis.com\\/css2?family=Jost:ital,wght@0,300;0,400;1,300;1,400;1,700&display=swap\",\"heading_font\":\"Jost, Sans Serif\",\"base_font\":\"Jost, Sans Serif\"}');

DROP TABLE IF EXISTS `field_submenu_type`;
CREATE TABLE `field_submenu_type` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_submenu_type` (`pages_id`, `data`, `sort`) VALUES('1045', '1114', '0');
INSERT INTO `field_submenu_type` (`pages_id`, `data`, `sort`) VALUES('1048', '1114', '0');
INSERT INTO `field_submenu_type` (`pages_id`, `data`, `sort`) VALUES('1038', '1115', '0');

DROP TABLE IF EXISTS `field_subtitle`;
CREATE TABLE `field_subtitle` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_summary`;
CREATE TABLE `field_summary` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_tab`;
CREATE TABLE `field_tab` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_tab_2`;
CREATE TABLE `field_tab_2` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_tab_2_end`;
CREATE TABLE `field_tab_2_end` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_tab_end`;
CREATE TABLE `field_tab_end` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_tab_options`;
CREATE TABLE `field_tab_options` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_tab_options_end`;
CREATE TABLE `field_tab_options_end` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_text`;
CREATE TABLE `field_text` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('11', 'Templates');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('16', 'Fields');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('22', 'Setup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('3', 'Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('6', 'Add Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('8', 'Tree');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('9', 'Save Sort');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('10', 'Edit');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('21', 'Modules');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('29', 'Users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('30', 'Roles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('2', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('7', 'Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('27', '404 Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('302', 'Insert Link');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('23', 'Login');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('304', 'Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('301', 'Empty Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('300', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('303', 'Insert Image');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('28', 'Access');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('31', 'Permissions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('32', 'Edit pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('34', 'Delete pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('35', 'Move pages (change parent)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('36', 'View pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('50', 'Sort child pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('51', 'Change templates on pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('52', 'Administer users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('53', 'User can update profile/password');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('54', 'Lock or unlock a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1048', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1000', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1049', 'search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1038', 'Featrues');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1006', 'Use Page Lister');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1007', 'Find');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1009', 'Recent');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1010', 'Can see recently edited pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1011', 'Logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1012', 'Can view system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1013', 'Can manage system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1014', 'Repeaters');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1015', 'Clone');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1016', 'Clone a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1017', 'Clone a tree of pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1120', 'HTMX');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1025', 'DB Backups');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1026', 'Manage database backups (recommended for superuser only)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1027', 'Hanna Code');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1028', 'List and view Hanna Codes');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1029', 'Add/edit/delete Hanna Codes (text/html, javascript only)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1030', 'Add/edit/delete Hanna Codes (text/html, javascript and PHP)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1123', 'htmx');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1033', 'Upgrades');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1037', 'Main Menu');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1035', 'System');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1039', 'menu');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1040', 'featrues');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1045', 'Basic Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1046', 'basic-page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1047', 'Basic Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1077', 'Access to system settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1051', 'Export Site Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1091', 'SVG Icons');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1055', '404 Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1056', 'Dev Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1121', 'Page (SPA)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1078', 'Tools');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1075', 'System');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1085', 'Menu Manager');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1086', 'Access to menu manager');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1124', 'ajax');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1122', 'WireKit UI');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1103', 'Options');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1104', 'Link Type');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1105', 'None');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1106', 'Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1107', 'External');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1108', 'Page (SPA)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1109', 'Ajax');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1110', 'HTMX');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1111', 'Modal (htmx)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1112', 'Offcanvas (htmx)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1113', 'Submenu / Dropdown Type');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1114', 'None');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1115', 'Custom');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1116', 'Child Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1117', 'Toggle');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1118', 'Scroll');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('100', 'menu-item');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('80', 'search');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', 'system');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('99', 'menu');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('101', 'repeater_menu');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('106', 'system-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('105', '404');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('107', 'htmx');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('108', 'ajax');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fields_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sort` int(11) unsigned NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '97', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '44', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('80', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '76', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '138', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '79', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '99', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '111', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '113', '1', '{\"columnWidth\":50}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '135', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '118', '3', '{\"columnWidth\":70,\"showIf\":\"link_type!=1105|1106|1108\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '116', '4', '{\"columnWidth\":30,\"showIf\":\"link_type=1107\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '1', '0', '{\"columnWidth\":50}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '117', '5', '{\"showIf\":\"link_type=1106|1108\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '126', '10', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('80', '78', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '76', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '109', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '100', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '133', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '112', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '109', '5', '{\"description\":\"\",\"label\":\"Media \\/ Images\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '137', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '125', '7', '{\"label\":\"Scripts & Styles\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '123', '8', '{\"description\":\"\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '78', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '1', '0', '{\"columnWidth\":50}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '1', '0', '{\"collapsed\":\"4\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '132', '1', '{\"label\":\"Settings\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '136', '2', '{\"label\":\"Media\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '113', '1', '{\"columnWidth\":50}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '135', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '118', '3', '{\"columnWidth\":70,\"showIf\":\"link_type!=1105|1106|1108\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '116', '4', '{\"columnWidth\":30,\"showIf\":\"link_type=1107\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '119', '7', '{\"label\":\"Submenu \\/ Dropdown\",\"showIf\":\"submenu_type=1115\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '124', '9', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '117', '5', '{\"showIf\":\"link_type=1106|1108\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '76', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '79', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '78', '1', NULL);

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `label` varchar(250) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Title', '{\"required\":1,\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1,\"blankType\":\"null\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail Address', '{\"size\":70,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('107', 'FieldtypeImage', 'img', '0', 'Image', '{\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":1,\"outputFormat\":2,\"descriptionRows\":1,\"useTags\":0,\"gridMode\":\"left\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('108', 'FieldtypeImage', 'bg', '32768', 'Background', '{\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":1,\"outputFormat\":2,\"descriptionRows\":1,\"useTags\":0,\"gridMode\":\"left\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"collapsed\":2}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('44', 'FieldtypeImage', 'images', '0', 'Images', '{\"extensions\":\"gif jpg jpeg png\",\"adminThumbs\":1,\"inputfieldClass\":\"InputfieldImage\",\"maxFiles\":0,\"descriptionRows\":1,\"fileSchema\":270,\"textformatters\":[\"TextformatterEntities\"],\"outputFormat\":1,\"defaultValuePage\":0,\"defaultGrid\":0,\"icon\":\"camera\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('79', 'FieldtypeTextarea', 'summary', '1', 'Summary', '{\"textformatters\":[\"TextformatterEntities\"],\"inputfieldClass\":\"InputfieldTextarea\",\"collapsed\":2,\"rows\":3,\"contentType\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('76', 'FieldtypeTextarea', 'body', '32768', 'Body', '{\"inputfieldClass\":\"InputfieldCKEditor\",\"rows\":10,\"contentType\":1,\"toolbar\":\"Format, Bold, Italic, -, RemoveFormat\\nJustifyLeft, JustifyCenter, JustifyRight, JustifyBlock\\nNumberedList, BulletedList, -, Blockquote\\nPWLink, Unlink, Anchor\\nPWImage, Table, HorizontalRule, SpecialChar\\nPasteText, PasteFromWord\\nScayt, -, Sourcedialog\",\"inlineMode\":0,\"useACF\":1,\"usePurifier\":1,\"formatTags\":\"p;h1;h2;h3;h4;h5;h6;pre;address\",\"extraPlugins\":[\"justify\",\"pwimage\",\"pwlink\",\"sourcedialog\"],\"removePlugins\":\"image,magicline\",\"toggles\":[2,4,8],\"textformatters\":[\"TextformatterHannaCode\"],\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('78', 'FieldtypeText', 'headline', '32768', 'Headline', '{\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":2,\"size\":0,\"maxlength\":1024,\"minlength\":0,\"showCount\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('98', 'FieldtypeTextarea', 'ACP_scripts_and_styles', '0', 'Scripts and styles for admin pages', '{\"description\":\"Add the .js and .css URLs in this field textarea, one in each line. can be absolute or relative (relative is assumed from the site root eg: site\\/templates\\/styles\\/my.css)\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('99', 'FieldtypeAdminCustomPagesSelect', 'ACP_template', '0', 'Template', '{\"description\":\"Select the template which should get rendered. Templates have to be in \\/site\\/templates\\/.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('100', 'FieldtypeTextarea', 'search_index', '0', '', '{\"collapsed\":4}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('101', 'FieldtypeTextarea', 'text', '32768', 'Text', '{\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":3}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('102', 'FieldtypeTextarea', 'markdown', '32768', 'Markdown', '{\"textformatters\":[\"TextformatterMarkdownExtra\",\"TextformatterHannaCode\"],\"inputfieldClass\":\"InputfieldEasyMDE\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":5}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('106', 'FieldtypeText', 'subtitle', '0', 'Subtitle', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('109', 'FieldtypeImage', 'media', '32768', 'Media', '{\"fileSchema\":271,\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":0,\"outputFormat\":0,\"descriptionRows\":1,\"useTags\":1,\"gridMode\":\"grid\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"themeColor\":\"none\",\"icon\":\"picture-o\",\"collapsed\":0,\"description\":\"Upload iamges here to use them in editor\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('111', 'FieldtypeText', 'page_icon', '32768', 'Page Icon', '{\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"tags\":\"vendor\",\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('112', 'FieldtypeImage', 'logo', '32768', 'Logo', '{\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":2,\"descriptionRows\":1,\"useTags\":0,\"gridMode\":\"left\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"okExtensions\":[\"svg\"],\"themeColor\":\"none\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('113', 'FieldtypeText', 'link_title', '32768', 'Link Title', '{\"textformatters\":[\"TextformatterEntities\"],\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('137', 'FieldtypeFieldsetClose', 'tab_2_END', '0', 'Close an open fieldset', '{\"description\":\"This field was added automatically to accompany fieldset \'tab_2\'.  It should be placed in your template\\/fieldgroup wherever you want the fieldset to end.\",\"openFieldID\":136}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('116', 'FieldtypeOptions', 'link_attr', '32768', 'Link Attributes', '{\"inputfieldClass\":\"InputfieldCheckboxes\",\"optionColumns\":1,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('117', 'FieldtypePage', 'select_page', '32768', 'Select Page', '{\"derefAsPage\":1,\"inputfield\":\"InputfieldPageListSelect\",\"parent_id\":0,\"labelFieldName\":\"title\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('118', 'FieldtypeText', 'link', '32768', 'Link', '{\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('119', 'FieldtypeRepeater', 'menu', '32768', 'Menu', '{\"template_id\":47,\"parent_id\":1039,\"repeaterFields\":{\"0\":1,\"1\":113,\"3\":135,\"4\":118,\"5\":116,\"6\":117},\"repeaterCollapse\":0,\"repeaterLoading\":1,\"familyFriendly\":0,\"repeaterTitle\":\"{title}\",\"rememberOpen\":0,\"accordionMode\":0,\"loudControls\":0,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('123', 'FieldtypeTextarea', 'scripts_in_head', '32768', 'Scripts in Head', '{\"description\":\"If you want to respect PrivacyWire Cookie Management:\\n```<script type=\\\"text\\/plain\\\" data-type=\\\"text\\/javascript\\\" data-category=\\\"marketing\\\">    \\nconsole.log(\\\"your code goes here\\\");    \\n<\\/script>\\n```\",\"notes\":\"These scripts will be included in the `<head>` section.\",\"icon\":\"code\",\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":10,\"tags\":\"vendor\",\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('124', 'FieldtypeTextarea', 'scripts_in_footer', '32768', 'Scripts in Footer', '{\"notes\":\"These scripts will be included before closing `<\\/body>` tag.\",\"icon\":\"code\",\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":10,\"tags\":\"vendor\",\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('125', 'FieldtypeFieldsetTabOpen', 'tab', '0', 'TAB', '{\"closeFieldID\":126}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('126', 'FieldtypeFieldsetClose', 'tab_END', '0', 'Close an open fieldset', '{\"description\":\"This field was added automatically to accompany fieldset \'tab\'.  It should be placed in your template\\/fieldgroup wherever you want the fieldset to end.\",\"openFieldID\":125}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('128', 'FieldtypeFieldsetTabOpen', 'tab_options', '0', 'Options', '{\"closeFieldID\":129}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('129', 'FieldtypeFieldsetClose', 'tab_options_END', '0', 'Close an open fieldset', '{\"description\":\"This field was added automatically to accompany fieldset \'tab_options\'.  It should be placed in your template\\/fieldgroup wherever you want the fieldset to end.\",\"openFieldID\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('132', 'FieldtypeJsonData', 'static', '32768', 'Static', '{\"tags\":\"vendor\",\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":5,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('133', 'FieldtypeImage', 'favicon', '32768', 'Favicon', '{\"fileSchema\":270,\"extensions\":\"png\",\"maxFiles\":1,\"outputFormat\":2,\"descriptionRows\":1,\"useTags\":0,\"collapsed\":1,\"gridMode\":\"grid\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('136', 'FieldtypeFieldsetTabOpen', 'tab_2', '32768', 'Tab 2', '{\"closeFieldID\":137,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('135', 'FieldtypePage', 'link_type', '32768', 'Link Type', '{\"derefAsPage\":1,\"inputfield\":\"InputfieldRadios\",\"parent_id\":1104,\"labelFieldName\":\"title\",\"collapsed\":0,\"defaultValue\":1105,\"optionColumns\":1,\"required\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('138', 'FieldtypePage', 'submenu_type', '32768', 'Submenu / Dropdown Type', '{\"derefAsPage\":1,\"inputfield\":\"InputfieldRadios\",\"parent_id\":1113,\"labelFieldName\":\"title\",\"collapsed\":0,\"defaultValue\":1114,\"optionColumns\":1,\"required\":1}');

DROP TABLE IF EXISTS `fieldtype_options`;
CREATE TABLE `fieldtype_options` (
  `fields_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `title` text DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fields_id`,`option_id`),
  UNIQUE KEY `title` (`title`(250),`fields_id`),
  KEY `value` (`value`,`fields_id`),
  KEY `sort` (`sort`,`fields_id`),
  FULLTEXT KEY `title_ft` (`title`),
  FULLTEXT KEY `value_ft` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('116', '1', 'New Tab', '', '0');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('116', '2', 'Nofollow', '', '1');

DROP TABLE IF EXISTS `hanna_code`;
CREATE TABLE `hanna_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `code` text DEFAULT NULL,
  `modified` int(10) unsigned NOT NULL DEFAULT 0,
  `accessed` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `hanna_code` (`id`, `name`, `type`, `code`, `modified`, `accessed`) VALUES('2', 'settings', '2', '/*hc_attr\nvalue=\"\"\nhc_attr*/\n<?php\necho $system->settings(\"$value\");', '1631167541', '1631167614');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('2', 'FieldtypeNumber', '64', '', '2021-09-08 08:27:02');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '3', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '{\"classOptions\":\"uk-button\\nuk-button-default\\nuk-button-primary\\nuk-button-secondary\\nuk-button-danger\\nuk-button-text\\nuk-button-link\\nuk-button-small\\nuk-button-large\\nuk-link-muted\\nuk-link-text\\nuk-link-heading\",\"relOptions\":\"nofollow\",\"targetOptions\":\"_blank\",\"extLinkClass\":\"\",\"extLinkRel\":\"\",\"extLinkTarget\":\"\",\"urlType\":\"0\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('14', 'ProcessPageSort', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('15', 'InputfieldPageListSelect', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('117', 'JqueryUI', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('17', 'ProcessPageAdd', '0', '{\"bookmarks\":{\"_0\":[]}}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('125', 'SessionLoginThrottle', '11', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('122', 'InputfieldPassword', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('25', 'InputfieldAsmSelect', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('116', 'JqueryCore', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('108', 'InputfieldURL', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('32', 'InputfieldSubmit', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('33', 'InputfieldWrapper', '0', '', '2021-03-05 16:17:35');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('34', 'InputfieldText', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('35', 'InputfieldTextarea', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('36', 'InputfieldSelect', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('37', 'InputfieldCheckbox', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('38', 'InputfieldCheckboxes', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('39', 'InputfieldRadios', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('40', 'InputfieldHidden', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('41', 'InputfieldName', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('43', 'InputfieldSelectMultiple', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('45', 'JqueryWireTabs', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('46', 'ProcessPage', '64', '', '2021-09-08 08:27:02');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('47', 'ProcessTemplate', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('48', 'ProcessField', '32', '{\"collapsedTags\":[\"Vendor\",\"vendor\"]}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('50', 'ProcessModule', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('114', 'PagePermissions', '3', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('97', 'FieldtypeCheckbox', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('115', 'PageRender', '3', '{\"clearCache\":1}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('55', 'InputfieldFile', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('56', 'InputfieldImage', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('57', 'FieldtypeImage', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('60', 'InputfieldPage', '0', '{\"inputfieldClasses\":[\"InputfieldSelect\",\"InputfieldSelectMultiple\",\"InputfieldCheckboxes\",\"InputfieldRadios\",\"InputfieldAsmSelect\",\"InputfieldPageListSelect\",\"InputfieldPageListSelectMultiple\",\"InputfieldPageAutocomplete\"]}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('61', 'TextformatterEntities', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('66', 'ProcessUser', '0', '{\"showFields\":[\"name\",\"email\",\"roles\"]}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('67', 'MarkupAdminDataTable', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('68', 'ProcessRole', '0', '{\"showFields\":[\"name\"]}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('76', 'ProcessList', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('78', 'InputfieldFieldset', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('79', 'InputfieldMarkup', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('80', 'InputfieldEmail', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('89', 'FieldtypeFloat', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('83', 'ProcessPageView', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('84', 'FieldtypeInteger', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('85', 'InputfieldInteger', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('86', 'InputfieldPageName', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('87', 'ProcessHome', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('90', 'InputfieldFloat', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('94', 'InputfieldDatetime', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('98', 'MarkupPagerNav', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('129', 'ProcessPageEditImageSelect', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('103', 'JqueryTableSorter', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('104', 'ProcessPageSearch', '1', '{\"searchFields\":\"title\",\"displayField\":\"title path\"}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('105', 'FieldtypeFieldsetOpen', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('106', 'FieldtypeFieldsetClose', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('107', 'FieldtypeFieldsetTabOpen', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('109', 'ProcessPageTrash', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('111', 'FieldtypePageTitle', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('112', 'InputfieldPageTitle', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('113', 'MarkupPageArray', '3', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('131', 'InputfieldButton', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('133', 'FieldtypePassword', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('134', 'ProcessPageType', '33', '{\"showFields\":[]}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('135', 'FieldtypeURL', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('136', 'ProcessPermission', '1', '{\"showFields\":[\"name\",\"title\"]}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('137', 'InputfieldPageListSelectMultiple', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('138', 'ProcessProfile', '1', '{\"profileFields\":[\"pass\",\"email\",\"admin_theme\"]}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":19,\"coreVersion\":\"3.0.193\"}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('164', 'InputfieldRepeater', '0', '', '2021-03-05 12:46:06');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('148', 'AdminThemeDefault', '10', '{\"colors\":\"classic\"}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('149', 'InputfieldSelector', '42', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('150', 'ProcessPageLister', '32', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('151', 'JqueryMagnific', '1', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('152', 'PagePathHistory', '3', '{\"rootSegments\":[\"system\",\"htmx\"]}', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('155', 'InputfieldCKEditor', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('156', 'MarkupHTMLPurifier', '0', '', '2021-03-05 12:45:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('163', 'FieldtypeRepeater', '3', '{\"repeatersRootPageID\":1014}', '2021-03-05 12:46:06');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('158', 'ProcessRecentPages', '1', '', '2021-03-05 12:45:33');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('159', 'AdminThemeUikit', '10', '{\"useAsLogin\":\"\",\"userAvatar\":\"icon.user-circle\",\"userLabel\":\"{Name}\",\"logoURL\":\"\",\"logoAction\":\"0\",\"layout\":\"\",\"ukGrid\":\"0\",\"maxWidth\":1600,\"groupNotices\":\"1\",\"cssURL\":\"\",\"inputSize\":\"m\",\"noBorderTypes\":[],\"offsetTypes\":[],\"toggleBehavior\":\"0\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-03-05 12:45:33');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('160', 'ProcessLogger', '1', '', '2021-03-05 12:45:37');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('161', 'InputfieldIcon', '0', '', '2021-03-05 12:45:37');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('162', 'FieldtypeDecimal', '1', '', '2021-03-05 12:45:58');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('165', 'FieldtypeFieldsetPage', '35', '{\"repeatersRootPageID\":1014,\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-03-05 12:46:06');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('166', 'FieldtypeOptions', '1', '', '2021-03-05 12:46:18');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('167', 'InputfieldToggle', '0', '', '2021-03-05 12:46:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('168', 'FieldtypeToggle', '1', '', '2021-03-05 12:46:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('169', 'InputfieldPageAutocomplete', '0', '', '2021-03-05 12:46:52');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('170', 'ProcessPageClone', '11', '', '2021-03-05 12:47:28');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('171', 'TextformatterMarkdownExtra', '1', '{\"flavor\":\"2\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-03-05 12:47:45');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('172', 'TextformatterNewlineBR', '1', '', '2021-03-05 12:48:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('173', 'FieldtypeAdminCustomPagesSelect', '1', '', '2021-03-05 12:55:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('182', 'FileValidatorImage', '0', '', '2021-03-05 12:56:30');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('183', 'InputfieldEasyMDE', '0', '', '2021-03-05 12:56:37');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('191', 'MinimalFieldset', '10', '', '2021-03-05 12:59:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('193', 'ProcessAdminCustomPages', '1', '', '2021-03-05 13:02:51');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('194', 'ProcessDatabaseBackups', '1', '', '2021-03-05 13:02:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('195', 'TextformatterHannaCode', '1', '{\"openTag\":\"[[\",\"closeTag\":\"]]\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-03-05 13:03:11');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('196', 'ProcessHannaCode', '1', '', '2021-03-05 13:03:11');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('197', 'TextformatterVideoEmbed', '1', '{\"maxWidth\":640,\"maxHeight\":480,\"responsive\":\"\",\"clearCache\":\"\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\",\"maxSize\":\"720p\",\"aspectRatio\":\"0\",\"noCookies\":\"\",\"failAction\":\"0\",\"wrapStyles\":\"position:relative;margin:1em 0;padding-bottom:{pct}%;height:0;overflow:hidden;\",\"frameStyles\":\"position:absolute;top:0;left:0;width:100%;height:100%;\",\"refreshDays\":0}', '2021-03-05 13:03:24');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('199', 'ProcessWireUpgrade', '1', '', '2021-03-05 13:03:52');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('200', 'ProcessWireUpgradeCheck', '11', '', '2021-03-05 13:03:52');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('201', 'SearchEngine', '3', '{\"indexed_fields\":[\"title\",\"headline\",\"summary\",\"body\",\"text\",\"subtitle\"],\"indexed_templates\":[\"basic-page\"],\"find_args__sort\":\"sort\",\"find_args__operator\":\"*=\",\"index_pages_now_selector\":\"\",\"index_field\":\"search_index\",\"override_compatible_fieldtypes\":\"\",\"compatible_fieldtypes\":[\"FieldtypeEmail\",\"FieldtypeFieldsetPage\",\"FieldtypeDatetime\",\"FieldtypeText\",\"FieldtypeTextLanguage\",\"FieldtypeTextarea\",\"FieldtypeTextareaLanguage\",\"FieldtypePageTitle\",\"FieldtypePageTitleLanguage\",\"FieldtypeCheckbox\",\"FieldtypeInteger\",\"FieldtypeFloat\",\"FieldtypeURL\",\"FieldtypeModule\",\"FieldtypeFile\",\"FieldtypeImage\",\"FieldtypeSelector\",\"FieldtypeOptions\",\"FieldtypeRepeater\",\"FieldtypeRepeaterMatrix\",\"FieldtypePageTable\",\"FieldtypePage\",\"FieldtypeTable\",\"FieldtypeTextareas\"],\"debugger_page\":0,\"debugger_query\":\"\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\",\"index_pages_now\":\"\",\"indexer_actions\":[],\"render_args__themes_directory\":\"\",\"debugger_query_args\":\"{}\"}', '2021-03-05 13:04:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('202', 'TracyDebugger', '3', '{\"enabled\":1,\"outputMode\":\"development\",\"superuserForceDevelopment\":\"\",\"guestForceDevelopmentLocal\":\"\",\"ipAddress\":\"\",\"restrictSuperusers\":\"\",\"strictMode\":\"\",\"strictModeAjax\":\"\",\"forceScream\":\"\",\"showLocation\":[\"Tracy\\\\Dumper::LOCATION_SOURCE\",\"Tracy\\\\Dumper::LOCATION_LINK\",\"Tracy\\\\Dumper::LOCATION_CLASS\"],\"debugInfo\":1,\"maxDepth\":3,\"maxLength\":150,\"collapse\":14,\"collapse_count\":7,\"maxAjaxRows\":3,\"reservedMemorySize\":500000,\"showFireLogger\":1,\"referencePageEdited\":1,\"linksNewTab\":\"\",\"logSeverity\":[],\"fromEmail\":\"\",\"email\":\"\",\"clearEmailSent\":\"\",\"showDebugBar\":[\"frontend\",\"backend\"],\"hideDebugBarModals\":[],\"hideDebugBarFrontendTemplates\":[],\"hideDebugBarBackendTemplates\":[],\"hideDebugBar\":\"\",\"showPanelLabels\":\"\",\"barPosition\":\"bottom-right\",\"panelZindex\":100,\"frontendPanels\":[\"processwireInfo\",\"requestInfo\",\"processwireLogs\",\"tracyLogs\",\"methodsInfo\",\"debugMode\",\"console\",\"panelSelector\",\"tracyToggler\"],\"backendPanels\":[\"processwireInfo\",\"requestInfo\",\"processwireLogs\",\"tracyLogs\",\"methodsInfo\",\"debugMode\",\"console\",\"panelSelector\",\"tracyToggler\"],\"restrictedUserDisabledPanels\":[],\"nonToggleablePanels\":[],\"panelSelectorTracyTogglerButton\":1,\"editor\":\"vscode:\\/\\/file\\/%file:%line\",\"localRootPath\":\"\",\"useOnlineEditor\":[],\"onlineEditor\":\"tracy\",\"forceEditorLinksToTracy\":1,\"snippetsPath\":\"templates\",\"consoleBackupLimit\":25,\"consoleCodePrefix\":\"\",\"fileEditorBaseDirectory\":\"templates\",\"fileEditorAllowedExtensions\":\"php, module, js, css, txt, log, htaccess\",\"fileEditorExcludedDirs\":\"site\\/assets\",\"aceTheme\":\"tomorrow_night_bright\",\"codeFontSize\":14,\"codeLineHeight\":24,\"codeShowInvisibles\":\"1\",\"codeTabSize\":4,\"codeUseSoftTabs\":\"1\",\"pwAutocompletions\":1,\"codeShowDescription\":1,\"customSnippetsUrl\":\"\",\"processwireInfoPanelSections\":[\"versionsList\",\"adminLinks\",\"documentationLinks\",\"gotoId\",\"processWireWebsiteSearch\"],\"customPWInfoPanelLinks\":[\"\\/admin\\/setup\\/template\\/\",\"\\/admin\\/setup\\/field\\/\",\"\\/admin\\/setup\\/\",\"\\/admin\\/module\\/\",\"\\/admin\\/access\\/users\\/\",\"\\/admin\\/access\\/roles\\/\",\"\\/admin\\/access\\/permissions\\/\",\"\\/admin\\/profile\\/\"],\"showPWInfoPanelIconLabels\":1,\"pWInfoPanelLinksNewTab\":\"\",\"apiExplorerShowDescription\":1,\"apiExplorerToggleDocComment\":\"\",\"apiExplorerModuleClasses\":[],\"captainHookShowDescription\":1,\"captainHookToggleDocComment\":\"\",\"requestInfoPanelSections\":[\"moduleSettings\",\"templateSettings\",\"fieldSettings\",\"pageInfo\",\"pagePermissions\",\"languageInfo\",\"templateInfo\",\"fieldsListValues\",\"serverRequest\",\"inputGet\",\"inputPost\",\"inputCookie\",\"session\",\"editLinks\"],\"imagesInFieldListValues\":\"\",\"debugModePanelSections\":[\"pagesLoaded\",\"modulesLoaded\",\"hooks\",\"databaseQueries\",\"selectorQueries\",\"timers\",\"user\",\"cache\",\"autoload\"],\"alwaysShowDebugTools\":1,\"diagnosticsPanelSections\":[\"filesystemFolders\"],\"dumpPanelTabs\":[\"debugInfo\",\"fullObject\"],\"validatorUrl\":\"https:\\/\\/html5.validator.nu\\/\",\"todoIgnoreDirs\":\"git, svn, images, img, errors, sass-cache, node_modules\",\"todoAllowedExtensions\":\"php, module, inc, txt, latte, html, htm, md, css, scss, less, js\",\"todoScanModules\":\"\",\"todoScanAssets\":\"\",\"numLogEntries\":10,\"variablesShowPwObjects\":\"\",\"customPhpCode\":\"\",\"userSwitcherSelector\":\"\",\"userSwitcherRestricted\":[],\"userSwitcherIncluded\":[],\"requestMethods\":[\"GET\",\"POST\",\"PUT\",\"DELETE\",\"PATCH\"],\"requestLoggerMaxLogs\":10,\"requestLoggerReturnType\":\"array\",\"styleWhere\":[\"backend\",\"frontend\"],\"styleAdminColors\":\"local|#FF9933\\n*.local|#FF9933\\n*.dev|#FF9933\\ndev.*|#FF9933\\n*.test|#FF9933\\nstaging.*|#8b0066\\n*.com|#009900\",\"styleAdminType\":[\"favicon\"],\"styleAdminElements\":\"body::before {\\n\\tcontent: \\\"[type]\\\";\\n\\tbackground: [color];\\n\\tposition: fixed;\\n\\tleft: 0;\\n\\tbottom: 100%;\\n\\tcolor: #ffffff;\\n\\twidth: 100vh;\\n\\tpadding: 0;\\n\\ttext-align: center;\\n\\tfont-weight: 600;\\n\\ttext-transform: uppercase;\\n\\ttransform: rotate(90deg);\\n\\ttransform-origin: bottom left;\\n\\tz-index: 999999;\\n\\tfont-family: sans-serif;\\n\\tfont-size: 11px;\\n\\theight: 13px;\\n\\tline-height: 13px;\\npointer-events: none;\\n}\",\"userDevTemplate\":\"\",\"userDevTemplateSuffix\":\"dev\",\"showUserBar\":\"\",\"showUserBarTracyUsers\":null,\"userBarFeatures\":[\"admin\",\"editPage\"],\"userBarCustomFeatures\":\"\",\"userBarTopBottom\":\"bottom\",\"userBarLeftRight\":\"left\",\"userBarBackgroundColor\":null,\"userBarBackgroundOpacity\":\"1\",\"userBarIconColor\":\"#666666\",\"enableShortcutMethods\":1,\"enabledShortcutMethods\":[\"addBreakpoint\",\"bp\",\"barDump\",\"bd\",\"barEcho\",\"be\",\"barDumpBig\",\"bdb\",\"debugAll\",\"da\",\"dump\",\"d\",\"dumpBig\",\"db\",\"fireLog\",\"fl\",\"l\",\"templateVars\",\"tv\",\"timer\",\"t\"],\"uninstall\":\"\",\"submit_save_module\":\"Submit\",\"apiDataVersion\":\"3.0.193\",\"linksCode\":\"\",\"use_php_session\":\"\"}', '2021-03-05 13:04:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('204', 'TextformatterVideoOrSocialPostEmbed', '1', '{\"maxWidth\":640,\"maxHeight\":480,\"responsive\":\"\",\"clearCache\":\"\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-03-05 13:04:33');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('217', 'LazyCron', '3', '', '2021-06-22 15:53:25');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('209', 'InputfieldTextTags', '0', '', '2021-05-27 06:17:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('243', 'WireKit', '3', '{\"hide_system_pages\":\"2\",\"hide_for\":\"2\",\"sys_pages\":[],\"less_compiler\":\"1\",\"less_suffix\":\"\",\"custom_routing\":\"1\",\"is_routing\":\"1\",\"is_hooks\":\"1\",\"last_compile_time\":\"1643012936\",\"compiler\":\"1\"}', '2021-12-11 05:13:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('235', 'FieldtypeJsonData', '1', '', '2021-09-29 11:22:46');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('236', 'InputfieldJsonData', '0', '', '2021-09-29 11:22:46');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('239', 'MenuManager', '1', '{\"show_home\":\"1\",\"main_menu_source\":\"1037\",\"mobile_menu_source\":\"1037\",\"hide_menus\":[],\"uninstall\":\"\",\"submit_save_module\":\"Submit\",\"home_htmx\":\"1\"}', '2021-09-29 11:23:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('244', 'FieldtypeJsonOptions', '1', '', '2021-12-21 08:07:42');

DROP TABLE IF EXISTS `page_path_history`;
CREATE TABLE `page_path_history` (
  `path` varchar(250) NOT NULL,
  `pages_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`path`),
  KEY `pages_id` (`pages_id`),
  KEY `created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT 0,
  `templates_id` int(11) unsigned NOT NULL DEFAULT 0,
  `name` varchar(128) CHARACTER SET ascii NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT 1,
  `modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT 2,
  `created` timestamp NOT NULL DEFAULT '2015-12-18 06:09:00',
  `created_users_id` int(10) unsigned NOT NULL DEFAULT 2,
  `published` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1126 DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2022-01-30 14:01:59', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'admin', '1035', '2022-01-24 14:36:27', '40', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '1045', '2021-12-20 14:14:24', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2021-03-05 12:45:41', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2021-03-05 12:45:40', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '51', 'http404', '1035', '2022-01-25 14:04:01', '41', '2021-03-05 12:45:14', '3', '2021-03-05 12:45:14', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('28', '2', '2', 'access', '13', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('29', '28', '2', 'users', '29', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('30', '28', '2', 'roles', '29', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('31', '28', '2', 'permissions', '29', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('32', '31', '5', 'page-edit', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('34', '31', '5', 'page-delete', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('35', '31', '5', 'page-move', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('36', '31', '5', 'page-view', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('37', '30', '4', 'guest', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('38', '30', '4', 'superuser', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'admin', '1', '2022-01-24 14:36:27', '40', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('40', '29', '3', 'guest', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('50', '31', '5', 'page-sort', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('51', '31', '5', 'page-template', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('52', '31', '5', 'user-admin', '25', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('53', '31', '5', 'profile-edit', '1', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('54', '31', '5', 'page-lock', '1', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('300', '3', '2', 'search', '1045', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('301', '3', '2', 'trash', '1047', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('302', '3', '2', 'link', '1041', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('303', '3', '2', 'image', '1041', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('304', '2', '2', 'profile', '1025', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '41', '2021-03-05 12:45:14', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1000', '1', '26', 'search', '1', '2022-01-22 15:34:34', '41', '2021-03-05 12:45:14', '2', '2021-03-05 12:45:14', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1078', '2', '2', 'tools', '1', '2021-12-09 15:26:59', '41', '2021-07-05 05:43:08', '41', '2021-07-05 05:43:14', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1077', '31', '5', 'blok-settings', '1', '2021-07-04 21:09:51', '41', '2021-07-04 21:09:51', '41', '2021-07-04 21:09:51', '23');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1049', '1039', '2', 'for-page-1048', '17', '2021-03-05 16:32:35', '41', '2021-03-05 16:32:35', '41', '2021-03-05 16:32:35', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1039', '1014', '2', 'for-field-119', '17', '2021-03-05 14:32:58', '41', '2021-03-05 14:32:58', '41', '2021-03-05 14:32:58', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1006', '31', '5', 'page-lister', '1', '2021-03-05 12:45:14', '40', '2021-03-05 12:45:14', '40', '2021-03-05 12:45:14', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1007', '3', '2', 'lister', '1', '2021-03-05 12:45:14', '40', '2021-03-05 12:45:14', '40', '2021-03-05 12:45:14', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1009', '3', '2', 'recent-pages', '1025', '2021-12-20 14:15:02', '41', '2021-03-05 12:45:33', '40', '2021-03-05 12:45:33', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1010', '31', '5', 'page-edit-recent', '1', '2021-03-05 12:45:33', '40', '2021-03-05 12:45:33', '40', '2021-03-05 12:45:33', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1011', '22', '2', 'logs', '1', '2021-03-05 12:45:37', '40', '2021-03-05 12:45:37', '40', '2021-03-05 12:45:37', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1012', '31', '5', 'logs-view', '1', '2021-03-05 12:45:37', '40', '2021-03-05 12:45:37', '40', '2021-03-05 12:45:37', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1013', '31', '5', 'logs-edit', '1', '2021-03-05 12:45:37', '40', '2021-03-05 12:45:37', '40', '2021-03-05 12:45:37', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1014', '2', '2', 'repeaters', '1036', '2021-03-05 12:46:06', '41', '2021-03-05 12:46:06', '41', '2021-03-05 12:46:06', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1015', '3', '2', 'clone', '1024', '2021-03-05 12:47:28', '41', '2021-03-05 12:47:28', '41', '2021-03-05 12:47:28', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1016', '31', '5', 'page-clone', '1', '2021-03-05 12:47:28', '41', '2021-03-05 12:47:28', '41', '2021-03-05 12:47:28', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1017', '31', '5', 'page-clone-tree', '1', '2021-03-05 12:47:28', '41', '2021-03-05 12:47:28', '41', '2021-03-05 12:47:28', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1120', '1040', '47', '1643099487-3856-1', '1', '2022-01-26 08:46:36', '41', '2022-01-25 08:31:27', '41', '2022-01-25 08:31:36', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1091', '1040', '47', '1639203221-3347-1', '1', '2022-01-26 13:47:20', '41', '2021-12-11 06:13:41', '41', '2021-12-11 06:13:53', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1025', '22', '2', 'db-backups', '1', '2021-03-05 13:02:59', '41', '2021-03-05 13:02:59', '41', '2021-03-05 13:02:59', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1026', '31', '5', 'db-backup', '1', '2021-03-05 13:02:59', '41', '2021-03-05 13:02:59', '41', '2021-03-05 13:02:59', '18');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1027', '22', '2', 'hanna-code', '1', '2021-03-05 13:03:11', '41', '2021-03-05 13:03:11', '41', '2021-03-05 13:03:11', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1028', '31', '5', 'hanna-code', '1', '2021-03-05 13:03:11', '41', '2021-03-05 13:03:11', '41', '2021-03-05 13:03:11', '19');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1029', '31', '5', 'hanna-code-edit', '1', '2021-03-05 13:03:11', '41', '2021-03-05 13:03:11', '41', '2021-03-05 13:03:11', '20');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1030', '31', '5', 'hanna-code-php', '1', '2021-03-05 13:03:11', '41', '2021-03-05 13:03:11', '41', '2021-03-05 13:03:11', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1122', '1040', '47', '1643204817-2658-1', '1', '2022-01-26 13:49:31', '41', '2022-01-26 13:46:57', '41', '2022-01-26 13:47:14', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1033', '22', '2', 'upgrades', '1', '2021-03-05 13:03:52', '41', '2021-03-05 13:03:52', '41', '2021-03-05 13:03:52', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1037', '1035', '45', 'main-menu', '1025', '2021-03-05 14:22:32', '41', '2021-03-05 14:22:25', '41', '2021-03-05 14:22:25', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1038', '1037', '46', 'featrues', '0', '2022-01-27 12:00:18', '41', '2021-03-05 14:25:43', '41', '2022-01-13 13:31:33', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1035', '1', '43', 'system', '1025', '2022-01-27 13:18:45', '41', '2021-03-05 13:22:14', '41', '2021-03-05 13:22:14', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1040', '1039', '2', 'for-page-1038', '17', '2021-03-05 15:21:26', '41', '2021-03-05 15:21:26', '41', '2021-03-05 15:21:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1045', '1037', '46', 'basic-page', '0', '2022-01-24 15:05:01', '41', '2021-03-05 16:29:36', '41', '2021-12-23 08:52:16', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1046', '1039', '2', 'for-page-1045', '17', '2021-03-05 16:29:36', '41', '2021-03-05 16:29:36', '41', '2021-03-05 16:29:36', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1047', '1', '29', 'basic-page', '1', '2022-01-10 10:56:27', '41', '2021-03-05 16:30:12', '41', '2021-03-05 16:30:15', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1048', '1037', '46', 'search', '0', '2022-01-18 19:46:22', '41', '2021-03-05 16:32:35', '41', '2021-12-08 06:25:42', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1055', '1040', '47', '1615635106-568-1', '1', '2022-01-25 08:34:37', '41', '2021-03-13 11:31:46', '41', '2021-03-13 11:31:55', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1056', '1040', '47', '1615635618-0379-1', '1', '2022-01-25 08:33:20', '41', '2021-03-13 11:40:18', '41', '2021-03-13 11:40:28', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1075', '1078', '2', 'system-page', '1', '2021-12-17 13:45:01', '41', '2021-06-23 07:40:16', '41', '2021-06-23 07:41:03', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1121', '1040', '47', '1643099555-5737-1', '1', '2022-01-25 08:34:12', '41', '2022-01-25 08:32:35', '41', '2022-01-25 08:32:46', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1085', '1078', '2', 'menu-manager', '1', '2021-12-09 15:26:59', '41', '2021-09-29 11:23:07', '41', '2021-09-29 11:23:07', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1086', '31', '5', 'menu-manager', '1', '2021-09-29 11:23:07', '41', '2021-09-29 11:23:07', '41', '2021-09-29 11:23:07', '26');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1103', '1035', '52', 'options', '1025', '2022-01-11 09:48:13', '41', '2022-01-11 09:48:04', '41', '2022-01-11 09:48:04', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1123', '1035', '53', 'htmx', '1025', '2022-01-27 13:18:45', '41', '2022-01-27 11:49:23', '41', '2022-01-27 11:49:23', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1124', '1035', '54', 'ajax', '1025', '2022-01-27 13:24:47', '41', '2022-01-27 13:24:24', '41', '2022-01-27 13:24:40', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1104', '1103', '52', 'link-type', '1', '2022-01-11 09:53:13', '41', '2022-01-11 09:48:34', '41', '2022-01-11 09:48:34', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1105', '1104', '52', 'none', '1', '2022-01-11 09:48:51', '41', '2022-01-11 09:48:51', '41', '2022-01-11 09:48:51', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1106', '1104', '52', 'page', '1', '2022-01-11 09:53:13', '41', '2022-01-11 09:48:56', '41', '2022-01-11 09:48:56', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1107', '1104', '52', 'external', '1', '2022-01-11 09:49:04', '41', '2022-01-11 09:49:04', '41', '2022-01-11 09:49:04', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1108', '1104', '52', 'page-htmx', '1', '2022-01-22 14:55:15', '41', '2022-01-11 09:49:12', '41', '2022-01-11 09:49:12', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1109', '1104', '52', 'ajax', '2049', '2022-01-25 08:42:42', '41', '2022-01-11 09:49:16', '41', '2022-01-11 09:49:16', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1110', '1104', '52', 'htmx', '1', '2022-01-11 10:01:02', '41', '2022-01-11 09:49:20', '41', '2022-01-11 09:49:20', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1111', '1104', '52', 'modal-htmx', '2049', '2022-01-25 08:42:45', '41', '2022-01-11 09:49:27', '41', '2022-01-11 09:49:27', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1112', '1104', '52', 'offcanvas-htmx', '2049', '2022-01-25 08:42:48', '41', '2022-01-11 09:49:34', '41', '2022-01-11 10:05:46', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1113', '1103', '52', 'submenu-type', '1', '2022-01-18 19:41:38', '41', '2022-01-18 19:41:22', '41', '2022-01-18 19:41:24', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1114', '1113', '52', 'none', '1', '2022-01-18 19:42:04', '41', '2022-01-18 19:42:00', '41', '2022-01-18 19:42:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1115', '1113', '52', 'custom', '1', '2022-01-18 19:42:14', '41', '2022-01-18 19:42:09', '41', '2022-01-18 19:42:14', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1116', '1113', '52', 'child-pages', '1', '2022-01-18 19:42:27', '41', '2022-01-18 19:42:24', '41', '2022-01-18 19:42:27', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1117', '1104', '52', 'uk-toggle', '2049', '2022-01-25 08:42:50', '41', '2022-01-22 14:55:57', '41', '2022-01-22 14:56:15', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1118', '1104', '52', 'uk-scroll', '2049', '2022-01-25 08:42:52', '41', '2022-01-22 14:56:37', '41', '2022-01-22 14:56:47', '9');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1006', '2', '2021-03-05 12:45:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1010', '2', '2021-03-05 12:45:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1012', '2', '2021-03-05 12:45:37');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1013', '2', '2021-03-05 12:45:37');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1016', '2', '2021-03-05 12:47:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1017', '2', '2021-03-05 12:47:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1077', '2', '2021-07-04 21:09:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1091', '2', '2021-12-11 06:13:41');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1026', '2', '2021-03-05 13:02:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1028', '2', '2021-03-05 13:03:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1029', '2', '2021-03-05 13:03:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1030', '2', '2021-03-05 13:03:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1035', '1', '2021-03-05 13:22:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1037', '1', '2021-03-05 14:22:25');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1038', '1', '2021-03-05 14:25:43');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1045', '1', '2021-03-05 16:29:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1047', '1', '2021-03-05 16:30:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1048', '1', '2021-06-02 18:09:34');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1120', '2', '2022-01-25 08:31:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('27', '1', '2021-03-13 11:30:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1055', '2', '2021-03-13 11:31:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1056', '2', '2021-03-13 11:40:18');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1121', '2', '2022-01-25 08:32:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1086', '2', '2021-09-29 11:23:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1123', '1', '2022-01-27 11:49:23');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1124', '1', '2022-01-27 13:24:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1103', '1', '2022-01-11 09:48:04');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1122', '2', '2022-01-26 13:46:57');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1104', '1', '2022-01-11 09:48:34');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1105', '1', '2022-01-11 09:48:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1106', '1', '2022-01-11 09:48:56');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1107', '1', '2022-01-11 09:49:04');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1108', '1', '2022-01-11 09:49:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1109', '1', '2022-01-11 09:49:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1110', '1', '2022-01-11 09:49:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1111', '1', '2022-01-11 09:49:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1112', '1', '2022-01-11 09:49:34');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1113', '1', '2022-01-18 19:41:22');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1114', '1', '2022-01-18 19:42:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1115', '1', '2022-01-18 19:42:09');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1116', '1', '2022-01-18 19:42:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1117', '1', '2022-01-22 14:55:57');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1118', '1', '2022-01-22 14:56:37');

DROP TABLE IF EXISTS `pages_meta`;
CREATE TABLE `pages_meta` (
  `source_id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`source_id`,`name`),
  KEY `name` (`name`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('41', 'HannaCode', '{\"aceTheme\":\"monokai\",\"aceKeybinding\":\"none\",\"aceHeight\":400,\"aceBehaviors\":0}');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1014', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1037', '1035');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1039', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1039', '1014');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1040', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1040', '1014');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1040', '1039');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1078', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1103', '1035');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1104', '1035');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1104', '1103');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1113', '1035');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1113', '1103');

DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int(10) unsigned NOT NULL DEFAULT 0,
  `last_attempt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `flags` int(11) NOT NULL DEFAULT 0,
  `cache_time` mediumint(9) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1642509395,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1643661178,\"ns\":\"ProcessWire\",\"roles\":[37]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1643661178,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('26', 'search', '80', '0', '0', '{\"noChildren\":1,\"noParents\":-1,\"allowPageNum\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-search title\",\"compile\":3,\"modified\":1643703323,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('46', 'menu-item', '100', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[45],\"slashUrls\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"noShortcut\":1,\"compile\":3,\"tags\":\"-Vendor\",\"modified\":1643026046}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', 'system', '97', '8', '0', '{\"noParents\":-1,\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-cog title\",\"noSettings\":1,\"noChangeTemplate\":1,\"noUnpublish\":1,\"compile\":3,\"tags\":\"System\",\"modified\":1643275641,\"tabContent\":\"General\",\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('45', 'menu', '99', '0', '0', '{\"childTemplates\":[46],\"parentTemplates\":[43],\"slashUrls\":1,\"pageLabelField\":\"fa-bars title\",\"compile\":3,\"label\":\"menu\",\"tags\":\"Vendor\",\"modified\":1643289876}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('47', 'repeater_menu', '101', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1614951178}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'system-page', '106', '0', '0', '{\"childTemplates\":[52],\"parentTemplates\":[43,52],\"slashUrls\":1,\"compile\":3,\"tags\":\"Vendor\",\"modified\":1641311876}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('51', '404', '105', '0', '0', '{\"noParents\":-1,\"slashUrls\":1,\"compile\":3,\"modified\":1643661178,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('53', 'htmx', '107', '0', '0', '{\"noChildren\":1,\"noParents\":-1,\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-html5 title\",\"compile\":3,\"tags\":\"Vendor\",\"modified\":1643548904,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'ajax', '108', '0', '0', '{\"noChildren\":1,\"noParents\":-1,\"allowPageNum\":1,\"urlSegments\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-code title\",\"compile\":3,\"tags\":\"Vendor\",\"modified\":1643548903,\"ns\":\"ProcessWire\"}');

DROP TABLE IF EXISTS `textformatter_video_embed`;
CREATE TABLE `textformatter_video_embed` (
  `video_id` varchar(128) NOT NULL,
  `embed_code` varchar(1024) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `textformatter_video_or_social_embed`;
CREATE TABLE `textformatter_video_or_social_embed` (
  `video_id` varchar(128) NOT NULL,
  `embed_code` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":49,"numCreateTables":56,"numInserts":576,"numSeconds":0}