CREATE DATABASE IF NOT EXISTS stickynotes;
USE `stickynotes`;
-- -----------------------------------------------------
-- Table `stickynotes`.`stickynotes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stickynotes`.`stickynotes` ;
CREATE TABLE IF NOT EXISTS `stickynotes`.`stickynotes` (
`id` INT NOT NULL AUTO_INCREMENT ,
`note` VARCHAR(255) NULL ,
`created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = MyISAM;
-- -----------------------------------------------------
-- Data for table `stickynotes`.`stickynotes`
-- -----------------------------------------------------
START TRANSACTION;
USE `stickynotes`;
INSERT INTO `stickynotes`.`stickynotes` (`id`, `note`, `created`) VALUES (1, 'This is a sticky note you can type and edit.','1900-01-02' );
INSERT INTO `stickynotes`.`stickynotes` (`id`, `note`, `created`) VALUES (NULL, 'This is another sticky note ', '1900-01-01');
COMMIT;