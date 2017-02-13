-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Фев 13 2017 г., 18:45
-- Версия сервера: 5.6.16
-- Версия PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `myshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`) VALUES
(1, 0, 'Телефоны'),
(2, 0, 'Планшеты'),
(3, 1, 'Телефоны Sumsung'),
(4, 1, 'Телефоны Apple'),
(5, 2, 'Планшеты Apple'),
(6, 2, 'Планшеты Acer'),
(7, 2, 'Планшеты Sumsung');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_payment` datetime DEFAULT NULL,
  `date_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  `comment` text NOT NULL,
  `user_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date_created`, `date_payment`, `date_modification`, `status`, `comment`, `user_ip`) VALUES
(1, 1, '2016-07-22 21:31:44', NULL, '2016-07-22 19:36:15', 0, 'id пользователя: 1<br />\n                    Имя: Имя2<br />\n                    Тел.: 2222222<br />\n                    Адрес: Адрес222', '127.0.0.1'),
(2, 1, '2016-07-22 21:35:21', NULL, '2016-07-22 19:36:19', 0, 'id пользователя: 1<br />\n                    Имя: Имя3<br />\n                    Тел.: 33333<br />\n                    Адрес: Адрес3333', '127.0.0.1'),
(3, 19, '2016-07-22 22:13:56', NULL, '2016-07-22 20:13:56', 0, 'id пользователя: 19<br />\r\n                    Имя: testuser<br />\r\n                    Тел.: 444444<br />\r\n                    Адрес: АдресАдресАдрес', '127.0.0.1'),
(4, 19, '2016-07-22 22:22:06', NULL, '2016-07-22 20:22:06', 0, 'id пользователя: 19<br />\r\n                    Имя: testuser<br />\r\n                    Тел.: 444444<br />\r\n                    Адрес: АдресАдресАдрес', '127.0.0.1'),
(5, 19, '2016-07-22 22:23:38', NULL, '2016-08-02 23:13:10', 0, 'id пользователя: 19<br />\r\n                    Имя: testuser<br />\r\n                    Тел.: 444444<br />\r\n                    Адрес: АдресАдресАдрес', '127.0.0.1'),
(9, 1, '2016-08-02 23:47:27', '2016-08-03 10:10:11', '2016-08-02 23:37:48', 0, 'id пользователя: 1<br />\r\n                    Имя: Имя2<br />\r\n                    Тел.: 2222222<br />\r\n                    Адрес: Адрес222', '127.0.0.1'),
(10, 1, '2016-09-19 23:16:16', NULL, '2016-09-19 21:16:16', 0, 'id пользователя: 1<br />\r\n                    Имя: Имя2<br />\r\n                    Тел.: 2222222<br />\r\n                    Адрес: Адрес222', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_api_key`
--

CREATE TABLE IF NOT EXISTS `ost_api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apikey` (`apikey`),
  KEY `ipaddr` (`ipaddr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ost_canned_attachment`
--

CREATE TABLE IF NOT EXISTS `ost_canned_attachment` (
  `canned_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`canned_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ost_canned_attachment`
--

INSERT INTO `ost_canned_attachment` (`canned_id`, `file_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ost_canned_response`
--

CREATE TABLE IF NOT EXISTS `ost_canned_response` (
  `canned_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`canned_id`),
  UNIQUE KEY `title` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`),
  FULLTEXT KEY `resp` (`title`,`response`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Что такое osTicket (приммер)?', '\r\nosTicket это бесплатная система управления заявками.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 1, 'Пример (с переменными)', '\r\n%{ticket.name},\r\n\r\nВаша заявка № %{ticket.number} создана %{ticket.create_date} в %{ticket.dept.name}.\r\n\r\n', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_config`
--

CREATE TABLE IF NOT EXISTS `ost_config` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `isonline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` float(3,1) NOT NULL DEFAULT '0.0',
  `enable_daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `staff_ip_binding` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `staff_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `staff_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `staff_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `passwd_reset_period` int(10) unsigned NOT NULL DEFAULT '0',
  `client_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `client_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `client_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `max_page_size` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `max_open_tickets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `max_file_size` int(11) unsigned NOT NULL DEFAULT '1048576',
  `max_user_file_uploads` tinyint(3) unsigned NOT NULL,
  `max_staff_file_uploads` tinyint(3) unsigned NOT NULL,
  `autolock_minutes` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `overdue_grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `alert_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `default_sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_priority_id` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `default_template_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `default_timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_smtp_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `allow_email_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clickable_urls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_priority_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_email_priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_kb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_premade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_captcha` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_auto_cron` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_mail_polling` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_sys_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_sql_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_mailparse_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_login_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `save_email_headers` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `strip_quoted_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_ticket_activity` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_admin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `transfer_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `assigned_alert_staff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `assigned_alert_team_lead` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_alert_team_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_assign_reopened_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_related_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_answered_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_notes_inline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hide_staff_name` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overlimit_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments_onlogin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `random_ticket_ids` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_level` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `log_graceperiod` int(10) unsigned NOT NULL DEFAULT '12',
  `upload_dir` varchar(255) NOT NULL DEFAULT '',
  `allowed_filetypes` varchar(255) NOT NULL DEFAULT '.doc, .pdf',
  `time_format` varchar(32) NOT NULL DEFAULT ' h:i A',
  `date_format` varchar(32) NOT NULL DEFAULT 'm/d/Y',
  `datetime_format` varchar(60) NOT NULL DEFAULT 'm/d/Y g:i a',
  `daydatetime_format` varchar(60) NOT NULL DEFAULT 'D, M j Y g:ia',
  `reply_separator` varchar(60) NOT NULL DEFAULT '-- do not edit --',
  `admin_email` varchar(125) NOT NULL DEFAULT '',
  `helpdesk_title` varchar(255) NOT NULL DEFAULT 'osTicket Support Ticket System',
  `helpdesk_url` varchar(255) NOT NULL DEFAULT '',
  `schema_signature` char(32) NOT NULL DEFAULT '',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `isoffline` (`isonline`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_config`
--

INSERT INTO `ost_config` (`id`, `isonline`, `timezone_offset`, `enable_daylight_saving`, `staff_ip_binding`, `staff_max_logins`, `staff_login_timeout`, `staff_session_timeout`, `passwd_reset_period`, `client_max_logins`, `client_login_timeout`, `client_session_timeout`, `max_page_size`, `max_open_tickets`, `max_file_size`, `max_user_file_uploads`, `max_staff_file_uploads`, `autolock_minutes`, `overdue_grace_period`, `alert_email_id`, `default_email_id`, `default_dept_id`, `default_sla_id`, `default_priority_id`, `default_template_id`, `default_timezone_id`, `default_smtp_id`, `allow_email_spoofing`, `clickable_urls`, `allow_priority_change`, `use_email_priority`, `enable_kb`, `enable_premade`, `enable_captcha`, `enable_auto_cron`, `enable_mail_polling`, `send_sys_errors`, `send_sql_errors`, `send_mailparse_errors`, `send_login_errors`, `save_email_headers`, `strip_quoted_reply`, `log_ticket_activity`, `ticket_autoresponder`, `message_autoresponder`, `ticket_notice_active`, `ticket_alert_active`, `ticket_alert_admin`, `ticket_alert_dept_manager`, `ticket_alert_dept_members`, `message_alert_active`, `message_alert_laststaff`, `message_alert_assigned`, `message_alert_dept_manager`, `note_alert_active`, `note_alert_laststaff`, `note_alert_assigned`, `note_alert_dept_manager`, `transfer_alert_active`, `transfer_alert_assigned`, `transfer_alert_dept_manager`, `transfer_alert_dept_members`, `overdue_alert_active`, `overdue_alert_assigned`, `overdue_alert_dept_manager`, `overdue_alert_dept_members`, `assigned_alert_active`, `assigned_alert_staff`, `assigned_alert_team_lead`, `assigned_alert_team_members`, `auto_assign_reopened_tickets`, `show_related_tickets`, `show_assigned_tickets`, `show_answered_tickets`, `show_notes_inline`, `hide_staff_name`, `overlimit_notice_active`, `email_attachments`, `allow_attachments`, `allow_email_attachments`, `allow_online_attachments`, `allow_online_attachments_onlogin`, `random_ticket_ids`, `log_level`, `log_graceperiod`, `upload_dir`, `allowed_filetypes`, `time_format`, `date_format`, `datetime_format`, `daydatetime_format`, `reply_separator`, `admin_email`, `helpdesk_title`, `helpdesk_url`, `schema_signature`, `updated`) VALUES
(1, 1, 0.0, 0, 1, 4, 2, 30, 0, 4, 2, 30, 25, 0, 1048576, 0, 0, 3, 0, 2, 1, 1, 1, 2, 1, 8, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 12, '', '.doc, .pdf', ' h:i A', 'm/d/Y', 'm/d/Y g:i a', 'D, M j Y g:ia', '-- do not edit --', 'maximum60@gmail.com', 'support desk', 'http://myshop.local/support/', 'd7bd54066151e24a6e763ab93e58551f', '2016-12-06 00:30:44');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_department`
--

CREATE TABLE IF NOT EXISTS `ost_department` (
  `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_name` varchar(128) NOT NULL DEFAULT '',
  `dept_signature` tinytext NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ost_department`
--

INSERT INTO `ost_department` (`dept_id`, `tpl_id`, `sla_id`, `email_id`, `autoresp_email_id`, `manager_id`, `dept_name`, `dept_signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `updated`, `created`) VALUES
(1, 0, 0, 1, 1, 0, 'Информационно-технический', 'С уважением, техническая поддержка', 1, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 1, 1, 1, 0, 'Финансовый', 'С уважением, финансовый отдел', 1, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_email`
--

CREATE TABLE IF NOT EXISTS `ost_email` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(125) NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 'user@example.com', 'Support', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2016-12-06 02:12:21', '2016-12-06 02:12:21'),
(2, 0, 2, 1, 'alerts@example.com', 'osTicket Alerts', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2016-12-06 02:12:21', '2016-12-06 02:12:21'),
(3, 0, 2, 1, 'noreply@example.com', '', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2016-12-06 02:12:21', '2016-12-06 02:12:21');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_email_template`
--

CREATE TABLE IF NOT EXISTS `ost_email_template` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cfg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `ticket_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_autoresp_body` text NOT NULL,
  `ticket_autoreply_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_autoreply_body` text NOT NULL,
  `ticket_notice_subj` varchar(255) NOT NULL,
  `ticket_notice_body` text NOT NULL,
  `ticket_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_alert_body` text NOT NULL,
  `message_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `message_autoresp_body` text NOT NULL,
  `message_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `message_alert_body` text NOT NULL,
  `note_alert_subj` varchar(255) NOT NULL,
  `note_alert_body` text NOT NULL,
  `assigned_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `assigned_alert_body` text NOT NULL,
  `transfer_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `transfer_alert_body` text NOT NULL,
  `ticket_overdue_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overdue_body` text NOT NULL,
  `ticket_overlimit_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overlimit_body` text NOT NULL,
  `ticket_reply_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_reply_body` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`tpl_id`),
  KEY `cfg_id` (`cfg_id`),
  FULLTEXT KEY `message_subj` (`ticket_reply_subj`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_email_template`
--

INSERT INTO `ost_email_template` (`tpl_id`, `cfg_id`, `isactive`, `name`, `notes`, `ticket_autoresp_subj`, `ticket_autoresp_body`, `ticket_autoreply_subj`, `ticket_autoreply_body`, `ticket_notice_subj`, `ticket_notice_body`, `ticket_alert_subj`, `ticket_alert_body`, `message_autoresp_subj`, `message_autoresp_body`, `message_alert_subj`, `message_alert_body`, `note_alert_subj`, `note_alert_body`, `assigned_alert_subj`, `assigned_alert_body`, `transfer_alert_subj`, `transfer_alert_body`, `ticket_overdue_subj`, `ticket_overdue_body`, `ticket_overlimit_subj`, `ticket_overlimit_body`, `ticket_reply_subj`, `ticket_reply_body`, `created`, `updated`) VALUES
(1, 1, 1, 'osTicket основной шаблон', 'шаблон по умолчанию', 'Support Ticket Opened [#%{ticket.number}]', '%{ticket.name},\r\n\r\nA request for support has been created and assigned ticket #%{ticket.number}. A representative will follow-up with you as soon as possible.\r\n\r\nYou can view this ticket''s progress online here: %{ticket.client_link}.\r\n\r\nIf you wish to send additional comments or information regarding this issue, please don''t open a new ticket. Simply login using the link above and update the ticket.\r\n\r\n%{signature}', 'Support Ticket Opened [#%{ticket.number}]', '%{ticket.name},\r\n\r\nA request for support has been created and assigned ticket #%{ticket.number} with the following auto-reply:\r\n\r\n%{response}\r\n\r\n\r\nWe hope this response has sufficiently answered your questions. If not, please do not open another ticket. If need be, representative will follow-up with you as soon as possible.\r\n\r\nYou can view this ticket''s progress online here: %{ticket.client_link}.', '[#%{ticket.number}] %{ticket.subject}', '%{ticket.name},\r\n\r\nOur customer care team has created a ticket, #%{ticket.number} on your behalf, with the following message.\r\n\r\n%{message}\r\n\r\nIf you wish to provide additional comments or information regarding this issue, please don''t open a new ticket. You can update or view this ticket''s progress online here: %{ticket.client_link}.\r\n\r\n%{signature}', 'New Ticket Alert', '%{recipient},\r\n\r\nNew ticket #%{ticket.number} created.\r\n\r\n-----------------------\r\nName: %{ticket.name}\r\nEmail: %{ticket.email}\r\nDept: %{ticket.dept.name}\r\n\r\n%{message}\r\n-----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.', '[#%{ticket.number}] Message Added', '%{ticket.name},\r\n\r\nYour reply to support request #%{ticket.number} has been noted.\r\n\r\nYou can view this support request progress online here: %{ticket.client_link}.\r\n\r\n%{signature}', 'New Message Alert', '%{recipient},\r\n\r\nNew message appended to ticket #%{ticket.number}\r\n\r\n----------------------\r\nName: %{ticket.name}\r\nEmail: %{ticket.email}\r\nDept: %{ticket.dept.name}\r\n\r\n%{message}\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.', 'New Internal Note Alert', '%{recipient},\r\n\r\nInternal note appended to ticket #%{ticket.number}\r\n\r\n----------------------\r\n* %{note.title} *\r\n\r\n%{note.message}\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.', 'Ticket #%{ticket.number} Assigned to you', '%{assignee},\r\n\r\nTicket #%{ticket.number} has been assigned to you by %{assigner}\r\n\r\n----------------------\r\n\r\n%{comments}\r\n\r\n----------------------\r\n\r\nTo view complete details, simply login to the support system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Support Ticket System - powered by osTicket.', 'Ticket Transfer #%{ticket.number} - %{ticket.dept.name}', '%{recipient},\r\n\r\nTicket #%{ticket.number} has been transferred to %{ticket.dept.name} department by %{staff.name}\r\n\r\n----------------------\r\n\r\n%{comments}\r\n\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.', 'Stale Ticket Alert', '%{recipient},\r\n\r\nA ticket, #%{ticket.number} assigned to you or in your department is seriously overdue.\r\n\r\n%{ticket.staff_link}\r\n\r\nWe should all work hard to guarantee that all tickets are being addressed in a timely manner.\r\n\r\n- Your friendly (although with limited patience) Support Ticket System - powered by osTicket.', 'Open Tickets Limit Reached', '%{ticket.name}\r\n\r\nYou have reached the maximum number of open tickets allowed.\r\n\r\nTo be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply login using the link below.\r\n\r\n%{url}/tickets.php?e=%{ticket.email}\r\n\r\nThank you.\r\n\r\nSupport Ticket System', '[#%{ticket.number}] %{ticket.subject}', '%{ticket.name},\r\n\r\nA customer support staff member has replied to your support request, #%{ticket.number} with the following response:\r\n\r\n%{response}\r\n\r\nWe hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or login to your account for a complete archive of all your support requests and responses.\r\n\r\n%{ticket.client_link}\r\n\r\n%{signature}', '2016-12-06 02:12:19', '2016-12-06 02:12:19');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_faq`
--

CREATE TABLE IF NOT EXISTS `ost_faq` (
  `faq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  PRIMARY KEY (`faq_id`),
  UNIQUE KEY `question` (`question`),
  KEY `category_id` (`category_id`),
  KEY `ispublished` (`ispublished`),
  FULLTEXT KEY `faq` (`question`,`answer`,`keywords`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_faq`
--

INSERT INTO `ost_faq` (`faq_id`, `category_id`, `ispublished`, `question`, `answer`, `keywords`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 'Не работает авторизация', 'Переключите раскладку клавиатуры.', NULL, '', '2016-12-06', '2016-12-06');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_faq_attachment`
--

CREATE TABLE IF NOT EXISTS `ost_faq_attachment` (
  `faq_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`faq_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ost_faq_category`
--

CREATE TABLE IF NOT EXISTS `ost_faq_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_faq_category`
--

INSERT INTO `ost_faq_category` (`category_id`, `ispublic`, `name`, `description`, `notes`, `created`, `updated`) VALUES
(1, 1, 'Техические вопросы', 'Техические вопросы', '', '2016-12-06', '2016-12-06');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_faq_topic`
--

CREATE TABLE IF NOT EXISTS `ost_faq_topic` (
  `faq_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`faq_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ost_file`
--

CREATE TABLE IF NOT EXISTS `ost_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(25) NOT NULL DEFAULT '',
  `hash` varchar(125) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_file`
--

INSERT INTO `ost_file` (`id`, `type`, `size`, `hash`, `name`, `created`) VALUES
(1, 'text/plain', '25', '670c6cc1d1dfc97fad20e5470251b255', 'osTicket.txt', '2016-12-06 02:12:19');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_file_chunk`
--

CREATE TABLE IF NOT EXISTS `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL,
  PRIMARY KEY (`file_id`,`chunk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x43616e6e6564206174746163686d656e747320726f636b210a);

-- --------------------------------------------------------

--
-- Структура таблицы `ost_filter`
--

CREATE TABLE IF NOT EXISTS `ost_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `execorder` int(10) unsigned NOT NULL DEFAULT '99',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `match_all_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reject_ticket` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_replyto_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disable_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canned_response_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `email_id` (`email_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `match_all_rules`, `stop_onmatch`, `reject_ticket`, `use_replyto_email`, `disable_autoresponder`, `canned_response_id`, `email_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `target`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Any', 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2016-12-06 02:12:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_filter_rule`
--

CREATE TABLE IF NOT EXISTS `ost_filter_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `what` enum('name','email','subject','body','header') NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  KEY `filter_id` (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_filter_rule`
--

INSERT INTO `ost_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '2016-12-06 02:12:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_groups`
--

CREATE TABLE IF NOT EXISTS `ost_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_post_ticket_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_assign_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_transfer_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_premade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_faq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_view_staff_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `group_active` (`group_enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ost_groups`
--

INSERT INTO `ost_groups` (`group_id`, `group_enabled`, `group_name`, `can_create_tickets`, `can_edit_tickets`, `can_post_ticket_reply`, `can_delete_tickets`, `can_close_tickets`, `can_assign_tickets`, `can_transfer_tickets`, `can_ban_emails`, `can_manage_premade`, `can_manage_faq`, `can_view_staff_stats`, `notes`, `created`, `updated`) VALUES
(1, 1, 'Администраторы', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'overlords', '2016-12-06 02:12:20', '2016-12-06 02:12:20'),
(2, 1, 'Менеджеры', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', '2016-12-06 02:12:20', '2016-12-06 02:12:20'),
(3, 1, 'Персонал', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, '', '2016-12-06 02:12:20', '2016-12-06 02:12:20');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_group_dept_access`
--

CREATE TABLE IF NOT EXISTS `ost_group_dept_access` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `group_dept` (`group_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ost_group_dept_access`
--

INSERT INTO `ost_group_dept_access` (`group_id`, `dept_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ost_help_topic`
--

CREATE TABLE IF NOT EXISTS `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_pid`),
  KEY `topic_pid` (`topic_pid`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`,`team_id`),
  KEY `sla_id` (`sla_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `isactive`, `ispublic`, `noautoresp`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `topic`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 1, 0, 2, 1, 0, 0, 1, 'Техническая поддержка', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 1, 1, 0, 3, 1, 0, 0, 0, 'Бухгалтерия', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_session`
--

CREATE TABLE IF NOT EXISTS `ost_session` (
  `session_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `session_data` longtext COLLATE utf8_unicode_ci,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'osTicket staff ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `updated` (`session_updated`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('v8bd264pf70unshc76nfamces3', 'csrf|a:2:{s:5:"token";s:56:"MDRhMzZkZjVhOGQ2ZTMxMjQ0ZDM5MzUzMDg5ZDMyNTBhZDI2MjY5MQ==";s:4:"time";i:1480984578;}TZ_OFFSET|s:4:"-5.0";TZ_DST|s:1:"0";_staff|a:2:{s:6:"userID";s:6:"admin1";s:5:"token";s:76:"74f212c6e19f5e0118608f9b8bf0dcfe:1480984552:f528764d624db129b32c21fbca0cb8d6";}search_0e25e1ebcf20987671ddef66f45d5f50|s:1832:"SELECT DISTINCT ticket.ticket_id,lock_id,ticketID,ticket.dept_id,ticket.staff_id,ticket.team_id  ,ticket.subject,ticket.name,ticket.email,dept_name  ,ticket.status,ticket.source,isoverdue,isanswered,ticket.created,pri.*  ,count(attach.attach_id) as attachments  ,count(DISTINCT thread.id) as thread_count  ,IF(ticket.duedate IS NULL,IF(sla.id IS NULL, NULL, DATE_ADD(ticket.created, INTERVAL sla.grace_period HOUR)), ticket.duedate) as duedate  ,IF(ticket.reopened is NULL,IF(ticket.lastmessage is NULL,ticket.created,ticket.lastmessage),ticket.reopened) as effective_date  ,CONCAT_WS(" ", staff.firstname, staff.lastname) as staff, team.name as team  ,IF(staff.staff_id IS NULL,team.name,CONCAT_WS(" ", staff.lastname, staff.firstname)) as assigned  ,IF(ptopic.topic_pid IS NULL, topic.topic, CONCAT_WS(" / ", ptopic.topic, topic.topic)) as helptopic   FROM ost_ticket ticket  LEFT JOIN ost_department dept ON ticket.dept_id=dept.dept_id  LEFT JOIN ost_ticket_priority pri ON (ticket.priority_id=pri.priority_id)  LEFT JOIN ost_ticket_lock tlock ON (ticket.ticket_id=tlock.ticket_id AND tlock.expire>NOW() \n               AND tlock.staff_id!=1)  LEFT JOIN ost_ticket_attachment attach ON (ticket.ticket_id=attach.ticket_id)  LEFT JOIN ost_ticket_thread thread ON ( ticket.ticket_id=thread.ticket_id)  LEFT JOIN ost_staff staff ON (ticket.staff_id=staff.staff_id)  LEFT JOIN ost_team team ON (ticket.team_id=team.team_id)  LEFT JOIN ost_sla sla ON (ticket.sla_id=sla.id AND sla.isactive=1)  LEFT JOIN ost_help_topic topic ON (ticket.topic_id=topic.topic_id)  LEFT JOIN ost_help_topic ptopic ON (ptopic.topic_id=topic.topic_pid)   WHERE (   ticket.staff_id=1 OR ticket.dept_id IN (1,2) ) AND status=''open'' AND isanswered=0   GROUP BY ticket.ticket_id ORDER BY priority_urgency ASC, effective_date DESC, ticket.created DESC LIMIT 0,25";lastcroncall|i:1480984544;', '2016-12-07 02:37:03', '2016-12-06 02:37:03', 0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_sla`
--

CREATE TABLE IF NOT EXISTS `ost_sla` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_priority_escalation` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disable_overdue_alerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `isactive`, `enable_priority_escalation`, `disable_overdue_alerts`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 0, 48, 'SLA по умолчанию', NULL, '2016-12-06 02:12:20', '2016-12-06 02:12:20');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_staff`
--

CREATE TABLE IF NOT EXISTS `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` tinytext NOT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `group_id` (`group_id`,`staff_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `group_id`, `dept_id`, `timezone_id`, `username`, `firstname`, `lastname`, `passwd`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `daylight_saving`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 8, 'admin1', 'Maxim Alexandrovich', 'Procopenco', '$2a$08$yPREojYqfODfi5KhHx0q2ukLHm57iGVFdXuLLhz/7szlNCtrXYo9m', 'maximum60@gmail.com', '', NULL, '', '', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '2016-12-06 02:12:21', '2016-12-06 02:17:20', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_syslog`
--

CREATE TABLE IF NOT EXISTS `ost_syslog` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket установлен!', 'Поздравляем с успешной установкой osTicket!\n\nСпасибо Вам за выбор osTicket!', '', '127.0.0.1', '2016-12-06 02:12:21', '2016-12-06 02:12:21');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_team`
--

CREATE TABLE IF NOT EXISTS `ost_team` (
  `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noalerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `name` (`name`),
  KEY `isnabled` (`isenabled`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `isenabled`, `noalerts`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 'Специалисты 1 уровня', '', '2016-12-06 02:12:20', '2016-12-06 02:12:20');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_team_member`
--

CREATE TABLE IF NOT EXISTS `ost_team_member` (
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`,`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ost_ticket`
--

CREATE TABLE IF NOT EXISTS `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticketID` int(11) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '2',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '[no subject]',
  `phone` varchar(16) DEFAULT NULL,
  `phone_ext` varchar(8) DEFAULT NULL,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `email_extid` (`ticketID`,`email`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `priority_id` (`priority_id`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`),
  KEY `sla_id` (`sla_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `ticketID`, `dept_id`, `sla_id`, `priority_id`, `topic_id`, `staff_id`, `team_id`, `email`, `name`, `subject`, `phone`, `phone_ext`, `ip_address`, `status`, `source`, `isoverdue`, `isanswered`, `duedate`, `reopened`, `closed`, `lastmessage`, `lastresponse`, `created`, `updated`) VALUES
(1, 104865, 1, 0, 2, 1, 0, 0, 'support@osticket.ru', 'osTicket Support', 'osTicket установлен!', NULL, NULL, '', 'open', 'Web', 0, 0, NULL, NULL, NULL, NULL, NULL, '2016-12-06 02:12:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_ticket_attachment`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_attachment` (
  `attach_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ref_type` enum('M','R','N') NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `ref_type` (`ref_type`),
  KEY `ref_id` (`ref_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ost_ticket_email_info`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_email_info` (
  `message_id` int(11) unsigned NOT NULL,
  `email_mid` varchar(255) NOT NULL,
  `headers` text,
  KEY `message_id` (`email_mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ost_ticket_event`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_event` (
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL,
  `team_id` int(11) unsigned NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  `state` enum('created','closed','reopened','assigned','transferred','overdue') NOT NULL,
  `staff` varchar(255) NOT NULL DEFAULT 'SYSTEM',
  `annulled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL,
  KEY `ticket_state` (`ticket_id`,`state`,`timestamp`),
  KEY `ticket_stats` (`timestamp`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ost_ticket_lock`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_lock` (
  `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`lock_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ost_ticket_priority`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Низкий', '#DDFFDD', 4, 1),
(2, 'normal', 'Нормальный', '#FFFFF0', 3, 1),
(3, 'high', 'Высокий', '#FEE7E7', 2, 1),
(4, 'emergency', 'Критичный', '#FEE7E7', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ost_ticket_thread`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_thread` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_type` enum('M','R','N') NOT NULL,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`),
  KEY `pid` (`pid`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ost_ticket_thread`
--

INSERT INTO `ost_ticket_thread` (`id`, `pid`, `ticket_id`, `staff_id`, `thread_type`, `poster`, `source`, `title`, `body`, `ip_address`, `created`, `updated`) VALUES
(1, 0, 1, 0, 'M', '', 'Web', 'osTicket Installed', 'Thank you for choosing osTicket.\n\nPlease make sure you join the osTicket forums at http://osticket.com/forums to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community.\n\nIf you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs.\n\nCheers,\n\n-\nosTicket Team\nhttp://osticket.com/\n\nPS. Don''t just make customers happy, make happy customers!\n', '', '2016-12-06 02:12:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `ost_timezone`
--

CREATE TABLE IF NOT EXISTS `ost_timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `ost_timezone`
--

INSERT INTO `ost_timezone` (`id`, `offset`, `timezone`) VALUES
(1, -12.0, 'Eniwetok, Kwajalein'),
(2, -11.0, 'Midway Island, Samoa'),
(3, -10.0, 'Hawaii'),
(4, -9.0, 'Alaska'),
(5, -8.0, 'Pacific Time (US & Canada)'),
(6, -7.0, 'Mountain Time (US & Canada)'),
(7, -6.0, 'Central Time (US & Canada), Mexico City'),
(8, -5.0, 'Eastern Time (US & Canada), Bogota, Lima'),
(9, -4.0, 'Atlantic Time (Canada), Caracas, La Paz'),
(10, -3.5, 'Newfoundland'),
(11, -3.0, 'Brazil, Buenos Aires, Georgetown'),
(12, -2.0, 'Mid-Atlantic'),
(13, -1.0, 'Azores, Cape Verde Islands'),
(14, 0.0, 'Лондон'),
(15, 1.0, 'Париж'),
(16, 2.0, 'Калининград'),
(17, 3.0, 'Москва, Санкт-Перербург'),
(18, 3.5, 'Tehran'),
(19, 4.0, 'Баку, Тбилиси'),
(20, 4.5, 'Kabul'),
(21, 5.0, 'Екатеринбург'),
(22, 5.5, 'Bombay, Calcutta, Madras, New Delhi'),
(23, 6.0, 'Almaty, Dhaka, Colombo'),
(24, 7.0, 'Новосибирск'),
(25, 8.0, 'Beijing, Perth, Singapore, Hong Kong'),
(26, 9.0, 'Якутск'),
(27, 9.5, 'Adelaide, Darwin'),
(28, 10.0, 'Владивосток'),
(29, 11.0, 'Магадан'),
(30, 12.0, 'Камчатка');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `image`, `status`) VALUES
(1, 3, 'GT-C3560', '                                                &lt;p&gt;Закругленные углы и окантовка  вносят стильный штрих в минималистичный дизайн телефона. Металлическая отделка смотрится  элегантно и современно. А благодаря небольшим размерам С3560 удобно лежит в руке и легко помещается в кармане.&lt;/p&gt;\n&lt;br /&gt;\n\n&lt;p&gt;Спецификации:&lt;/p&gt;\n&lt;ul&gt;&lt;li&gt;Стандарты сети GSM и EDGE : GSM (850/900/1800/1900)&lt;/li&gt;&lt;li&gt;Стандарт сети 3G : N/A&lt;/li&gt;&lt;li&gt;Стандарт сети CDMA : N/A&lt;/li&gt;&lt;li&gt;TD-SCDMA Band : N/A&lt;/li&gt;&lt;/ul&gt;\n                    \n                    ', 3000, '1.jpg', 1),
(3, 3, 'GT-E2600', '                        &lt;p&gt;Тонкий и изящный дизайн телефона E2600? широкий экран и пользовательский интерфейс Paragon UX обеспечивают удобство и комфорт в использовании.  Телефон оснащен интуитивно-понятным пользовательским интерфейсом.  &lt;/p&gt;\n&lt;br /&gt;\n&lt;p&gt;Спецификации:&lt;/p&gt;\n&lt;ul&gt;&lt;li&gt;850 / 900 / 1800 / 1900 МГц GSM &amp; EDGE Band&lt;/li&gt;&lt;li&gt;GPRS Network&amp;Data: 850 / 900 / 1800 / 1900&lt;/li&gt;&lt;li&gt;EDGE Network&amp;Data: 850 / 900 / 1800 / 1900&lt;/li&gt;&lt;li&gt;фирменная&lt;/li&gt;&lt;li&gt;Интернет браузерr ( NetFront 4.2)&lt;/li&gt;&lt;li&gt;JAVA&trade; SUN CLDC HotSpot Implementation 1.1 (MIDP 2.0) Platform&lt;/li&gt;&lt;li&gt;SAR 0,45 Вт./кг.&lt;/li&gt;&lt;/ul&gt;\n\n&lt;a href=&quot;http://www.samsung.com/ru/consumer/mobile-devices/mobile-phones/hhp-gsm/GT-E2600ZKASER&quot;&gt;http://www.samsung.com/ru/consumer/mobile-devices/mobile-phones/hhp-gsm/GT-E2600ZKASER&lt;/a&gt;\n                    ', 5000, '3.jpg', 1),
(2, 3, 'S5570 Galaxy mini', '                        Платформа\n850/900/1800/1900 МГц\nДиапазон 900/2100 МГц\nAndroid 2.2 OS\nИнтернет браузер (Android Browser)\nФизические характеристики\nВес трубки 106,6 г.\nРазмеры трубки: 110,4 x 60,6 x 12,1 мм\n                    ', 7000, '2.jpg', 1),
(4, 3, 'E2530 La Fleur', '                                                                                                                        &lt;ul&gt;&lt;li&gt;850/900/1800/1900 МГц&lt;/li&gt;&lt;li&gt;GPRS класс 12&lt;/li&gt;&lt;li&gt;EDGE Class12(только RX)&lt;/li&gt;&lt;li&gt;Proprietary (MMP) OS&lt;/li&gt;&lt;li&gt;Интернет браузер&lt;/li&gt;&lt;li&gt;MIDP 2,1 / CLDC 1.1&lt;/li&gt;&lt;/ul&gt;\n\n&lt;ul&gt;&lt;li&gt;Вес трубки 86 г.&lt;/li&gt;&lt;li&gt;Размеры трубки: 94.4 x 47.2 x 17.4 мм&lt;/li&gt;&lt;/ul&gt;\n\n&lt;ul&gt;&lt;li&gt;Стандартная батарея: до 800 мАч&lt;/li&gt;&lt;li&gt;До 680 мин. в режиме разговора&lt;/li&gt;&lt;/ul&gt;\n\n&lt;a href=&quot;http://www.samsung.com/ru/consumer/mobile-devices/mobile-phones/hhp-gsm/GT-E2530SRFSER&quot;&gt;\nhttp://www.samsung.com/ru/consumer/mobile-devices/mobile-phones/hhp-gsm/GT-E2530SRFSER&lt;/a&gt;\n                    \n                    \n                    \n                    \n                    ', 6000, '4.jpg', 1),
(5, 3, 'S3350 Chat 335', '                                                &lt;p&gt;Samsung Ch@t 335 &mdash; самый тонкий QWERTY-телефон на современном рынке, чья толщина составляет всего 11,9&nbsp;мм. Обтекаемый корпус с хромированным покрытием придает модели изысканный классический вид. 2,4-дюймовый LQVGA дисплей идеально подходит для просмотра снимков и чтения длинных сообщений.&lt;/p&gt;\n&lt;br /&gt;\n&lt;p&gt;Благодаря новой, улучшенной QWERTY-клавиатуре набор текста становится еще более быстрым и удобным, как при печати на ПК. Есть возможность настраивать горячие клавиши для часто используемых приложений (например, A для будильника и т.п.).&lt;/p&gt;\n\n&lt;a href=&quot;http://www.samsung.com/ru/consumer/mobile-devices/mobile-phones/hhp-gsm/GT-S3350HKASER&quot;&gt;http://www.samsung.com/ru/consumer/mobile-devices/mobile-phones/hhp-gsm/GT-S3350HKASER&lt;/a&gt;\n                    \n                    ', 10000, '5.jpg', 1),
(6, 3, 'S5380 La Fleur Wave Y', 'Стандарты сети 850/900/1800/1900MHz GSM&EDGE Band\nСтандарты сети: 900/2100МГц 3G\nПоддерживаемые 3G: GPRS Network&Data :850/900/1800/1900 (Slave)\nEDGE Network&Data: стандарты сетей: 850/900/1800/1900 (Master)\nNetwork&Data (3G): HSDPA 7,2Мбит/с.\nBada 2.0\nБраузер Dolfin Browser 3.0\nПлатформа SUN CLDC 1.1\nЗначение SAR: 0,797мВт./г.\n', 12000, '6.jpg', 1),
(7, 3, 'I9001 Galaxy S Plus', 'Платформа\n850 / 900 / 1800 / 1900 МГц\nGPRS Class12\nEDGE Class12\nИнтернет браузер (Android Browser)\nДисплей\nРазрешение дисплея 480 x 800 WVGA\n<br />\n<br />\n<a href="http://www.samsung.com/ru/consumer/mobile-devices/mobile-phones/hhp-smart/GT-I9001HKDSER">http://www.samsung.com/ru/consumer/mobile-devices/mobile-phones/hhp-smart/GT-I9001HKDSER</a>', 11000, '7.jpg', 1),
(8, 3, 'I8350 Omnia W', 'Windows Phone 7.5 Mango\nGSM&EDGE 850 / 900 / 1,800 / 1,900 МГц\n3G 900 / 2,100 MГц\nGPRS: Класс 12\nEDGE: Класс 12\nHSDPA 14.4 / HSUPA 5.76 Мбит/с\nInternet Explorer 9\n', 15000, '8.png', 1),
(9, 4, 'iPhone 3GS', '                        Широкоформатный дисплей Multi-Touch с диагональю 3,5 дюйма\nРазрешение 480 x 320 пикселей (163 пикселя/дюйм)\nОлеофобное покрытие, препятствующее появлению отпечатков пальцев\nПоддержка одновременного отображения нескольких языков и наборов символов\n&lt;br /&gt;&lt;br /&gt;\n&lt;a href=&quot;http://www.apple.com/ru/iphone/iphone-3gs/specs.html&quot;&gt;http://www.apple.com/ru/iphone/iphone-3gs/specs.html&lt;/a&gt;\n                    ', 20000, '11.jpg', 1),
(10, 4, 'iPhone 4S', '                                                Поддержка международных сетей\nUMTS/HSDPA/HSUPA (850, 900, 1900, 2100 МГц); \nGSM/EDGE (850, 900, 1800, 1900 МГц)\nCDMA EV-DO Rev. A (800, 1900 МГц)3\n802.11b/g/n Wi-Fi (802.11n только 2,4 ГГц)\nБеспроводная технология Bluetooth 4.0\n<br /><br />\n<a href="http://www.apple.com/ru/iphone/specs.html">http://www.apple.com/ru/iphone/specs.html</a>\n                    \n                    ', 25000, '12.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
