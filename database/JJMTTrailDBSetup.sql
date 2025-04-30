-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
  PRIMARY KEY (`park`, `trail`, `Date`, `submitername`)
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Safe insert to avoid duplicates
INSERT IGNORE INTO `jjmtdb`.`Incidents` 
(`incidentNum`, `ParkName`, `TrailName`, `Date`, `Category`, `Description`, `Status`, `Priority`)
VALUES 
('001', 'Cromwell Valley', 'Lime Kiln', '2025-01-22', 'Erosion', 'Half of the trail is washed into the stream near the beaver dam', 'New', 'New'),
('002', 'Marshy Point', 'White Tail', '2025-03-15', 'Obstruction', 'Fallen Tree', 'New', 'New');
