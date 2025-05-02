-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema county_parks
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `county_parks` DEFAULT CHARACTER SET utf8 ;
USE `county_parks` ;

-- -----------------------------------------------------
-- Table `county_parks`.`Incidents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `county_parks`.`Incidents` (
  `incidentNum` int NOT NULL AUTO_INCREMENT,
  `ParkName` VARCHAR(45) NOT NULL,
  `TrailName` VARCHAR(45) NOT NULL,
  `SubmiterName` VARCHAR(45) NOT NULL,
  `Contact` VARCHAR(45) NOT NULL,
  `Date`  DATETIME(6) NOT NULL,
  `Category` VARCHAR(45) NULL,
  `Description` VARCHAR(1000) NULL,
  `PhotoURL` VARCHAR(45) NULL,
  `Status` VARCHAR(45) NULL,
  `StaffAssign` VARCHAR(45) NULL,
  `Priority` VARCHAR(45) NULL,

  PRIMARY KEY (`incidentNum`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `jjmtdb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jjmtdb`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(20) NULL,
  `ParkAssigned` VARCHAR(45) NOT NULL,
  `Comments` VARCHAR(1000) NULL,

  PRIMARY KEY (`StaffID`)
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Safe insert to avoid duplicates
INSERT IGNORE INTO `county_parks`.`Incidents` 
(`incidentNum`, `ParkName`, `TrailName`, `SubmiterName`, `Contact`, `Date`, `Category`, `Description`, `Status`, `Priority`)
VALUES 
('001', 'Cromwell Valley', 'Lime Kiln', 'Joe', '443-555-5555', '2025-01-22 10:22:35', 'Erosion', 'Half of the trail is washed into the stream near the beaver dam', 'New', 'New'),
('002', 'Marshy Point', 'White Tail', 'James', '443-555-5555', '2025-03-15 11:45:19', 'Obstruction', 'Fallen Tree', 'New', 'New');

INSERT IGNORE INTO 'county_parks'.'Staff'
('StaffID', 'FirstName', 'LastName', 'Email', 'PhoneNumber', 'ParkAssigned', 'Comments')
VALUES
('0000001', 'John', 'Doe', 'jdoe1@students.towson.edu', '123-456-7890', 'Oregon Ridge', 'This is a test.')
('0000002', 'Jeffrey', 'Tirschman', 'jtirschman@towson.edu', '410-555-5555', 'Towson Trail', 'Best professor ever!')
