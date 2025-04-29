-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema jjmtdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jjmtdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jjmtdb` DEFAULT CHARACTER SET utf8 ;
USE `jjmtdb` ;

-- -----------------------------------------------------
-- Table `jjmtdb`.`trail_reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jjmtdb`.`trail_reports` (
  `park` VARCHAR(45) NOT NULL,
  `trail` VARCHAR(45) NOT NULL,
  `Date`  datetime(6) NOT NULL,
  `category` VARCHAR(45) NULL,
  `PhotoURL` VARCHAR(45) NULL,
  `Status` VARCHAR(45) NULL,
  `StaffAssign` VARCHAR(45) NULL,
  `Priority` VARCHAR(45) NULL,
  `submitername` VARCHAR(45) NOT NULL,
  `Contact` VARCHAR(45) NULL,
  `description` VARCHAR(1000) NULL,
  
  PRIMARY KEY (`park`, `trail`, `Date`, `submitername`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `jjmtdb`.`trail_reports` (`park`, `trail`, `Date`, `category`, `Status`, `Priority`, `submitername`, `description`) VALUES ('Cromwell Valley', 'Yellow Trail', '2025-01-22 10:59:32', 'Erosion', 'New', 'New', 'James', 'washed out near water pump');
INSERT INTO `jjmtdb`.`trail_reports` (`park`, `trail`, `Date`, `category`, `Status`, `Priority`, `submitername`, `description`) VALUES ('Marshy Point', 'Vernal Pond Trail', '2024-05-06 14:35:22', 'Wildlife', 'New', 'New', 'John', 'first frogspawn of season');
