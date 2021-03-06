CREATE TABLE `app_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `fullname` VARCHAR(45) NULL,
  `email` VARCHAR(250) NULL,
  `phone` VARCHAR(45) NULL,
  `building` INT NULL,
  `room` INT NULL,
  `activate` TINYINT NULL,
  `created` DATETIME NULL,
  `created_by` INT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `app_building` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `building_name` VARCHAR(45) NULL,
  `building_address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
CREATE TABLE `radius`.`app_active_code` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
ALTER TABLE `radius`.`app_active_code` 
ADD COLUMN `code` VARCHAR(45) NULL AFTER `username`;


