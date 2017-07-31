CREATE TABLE IF NOT EXISTS `vacations_employees` (
  `tid` VARCHAR(20) NOT NULL DEFAULT '',
  `surname` VARCHAR(40) NOT NULL DEFAULT '',
  `name` VARCHAR(40) NOT NULL DEFAULT '',
  `mid_name` VARCHAR(40) NOT NULL DEFAULT '',
  `surname_genetive` VARCHAR(120) NOT NULL DEFAULT '',
  `start_date` DATE NOT NULL DEFAULT '0000-00-00',
  `position` VARCHAR(200) NOT NULL DEFAULT '',
  `email` VARCHAR(60) NOT NULL DEFAULT '',
  `vct_days` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `company` VARCHAR(200) NOT NULL DEFAULT '',
  `vct_left` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `vct_earned` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  
  PRIMARY KEY (`tid`)
) COMMENT = 'employees';

CREATE TABLE IF NOT EXISTS `vacations_holidays` (
  `date` DATE NOT NULL DEFAULT '0000-00-00',
  `workday` SMALLINT(1) UNSIGNED NOT NULL DEFAULT '0',

  PRIMARY KEY (`date`)
) COMMENT = 'holidays';

CREATE TABLE IF NOT EXISTS `vacations_accrued_periods` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` VARCHAR(20) NOT NULL DEFAULT '',
  `start_period` DATE NOT NULL DEFAULT '0000-00-00',
  `end_period` DATE NOT NULL DEFAULT '0000-00-00',
  `days_accrued` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `days_used` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) COMMENT = 'accrued days';

CREATE TABLE IF NOT EXISTS `vacations_orders` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` VARCHAR(20) NOT NULL DEFAULT '',
  `order_id` VARCHAR(40) NOT NULL DEFAULT '',
  `order_date` DATE NOT NULL DEFAULT '0000-00-00',
  `vct_start` DATE NOT NULL DEFAULT '0000-00-00',
  `vct_end` DATE NOT NULL DEFAULT '0000-00-00',
  `vct_days` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `used` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`),
  UNIQUE KEY (`order_id`)
) COMMENT = 'vacations orders';

CREATE TABLE IF NOT EXISTS `vacations_main` (
  `uid` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `tid` VARCHAR(20) NOT NULL DEFAULT '',
  `role` SMALLINT(1) UNSIGNED NOT NULL DEFAULT '0',

  PRIMARY KEY (`tid`),
  UNIQUE KEY (`uid`)
) COMMENT = 'vacations main';

CREATE TABLE IF NOT EXISTS `vacations_log` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL  DEFAULT CURRENT_TIMESTAMP,
  `ip` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` VARCHAR(35) NOT NULL DEFAULT '',
  `comments` TEXT NOT NULL,

  PRIMARY KEY (`id`)
) COMMENT = 'vacations log';
