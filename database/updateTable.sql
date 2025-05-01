-- Update the Docker MySQL database
ALTER TABLE `county_parks`.`Incidents` 
ADD COLUMN `SubmiterName` VARCHAR(45) NULL AFTER `TrailName`,
ADD COLUMN `Contact` VARCHAR(45) NULL AFTER `SubmiterName`,
CHANGE COLUMN `Date` `Date` DATETIME(6) NULL DEFAULT NULL ;