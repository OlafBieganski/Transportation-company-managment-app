-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema transportation_company_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema transportation_company_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `transportation_company_DB` DEFAULT CHARACTER SET utf8 ;
USE `transportation_company_DB` ;

-- -----------------------------------------------------
-- Table `transportation_company_DB`.`truck_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`truck_model` (
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `weight` INT UNSIGNED NOT NULL,
  `width` INT UNSIGNED NOT NULL,
  `lenght` INT UNSIGNED NOT NULL,
  `height` INT UNSIGNED NOT NULL,
  `max_trailer_weight` INT UNSIGNED NULL,
  `payload` INT UNSIGNED NULL,
  PRIMARY KEY (`brand`),
  INDEX `brand_idx` (`brand` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`trailer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`trailer` (
  `vin_nr` INT NOT NULL,
  `lenght` INT UNSIGNED NOT NULL,
  `width` INT UNSIGNED NOT NULL,
  `height` INT UNSIGNED NOT NULL,
  `tandem` TINYINT(1) NOT NULL,
  `weight` INT UNSIGNED NOT NULL,
  `payload` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`vin_nr`),
  INDEX `vin_nr_idx` (`vin_nr` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`trucks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`trucks` (
  `vin_nr` INT NOT NULL,
  `registration_nr` VARCHAR(7) NOT NULL,
  `production_year` DATE NOT NULL,
  `car_service` DATE NOT NULL,
  `OC` DATE NOT NULL,
  `AC` DATE NULL,
  `aditional_info` VARCHAR(1000) NULL,
  `trailer_vin_nr` INT NULL,
  `truck_model_brand` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `registration_nr_UNIQUE` (`registration_nr` ASC) INVISIBLE,
  PRIMARY KEY (`vin_nr`, `truck_model_brand`),
  INDEX `vin_nr_idx` (`vin_nr` ASC) VISIBLE,
  INDEX `fk_trucks_truck_model1_idx` (`truck_model_brand` ASC) VISIBLE,
  INDEX `fk_trucks_trailer1_idx` (`trailer_vin_nr` ASC) VISIBLE,
  CONSTRAINT `fk_trucks_truck_model1`
    FOREIGN KEY (`truck_model_brand`)
    REFERENCES `transportation_company_DB`.`truck_model` (`brand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trucks_trailer1`
    FOREIGN KEY (`trailer_vin_nr`)
    REFERENCES `transportation_company_DB`.`trailer` (`vin_nr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`employes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`employes` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `sex` ENUM('M', 'F') NOT NULL,
  `age` INT UNSIGNED NOT NULL,
  `salary` INT UNSIGNED NOT NULL,
  `email` VARCHAR(44) NOT NULL,
  `phone_nr` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `employee_first_last_name_idx` (`first_name` ASC, `last_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`drivers` (
  `employes_employee_id` INT NOT NULL,
  `trucks_vin_nr` INT NULL,
  INDEX `fk_drivers_employes1_idx` (`employes_employee_id` ASC) INVISIBLE,
  INDEX `fk_drivers_trucks1_idx` (`trucks_vin_nr` ASC) VISIBLE,
  PRIMARY KEY (`employes_employee_id`),
  CONSTRAINT `fk_drivers_employes1`
    FOREIGN KEY (`employes_employee_id`)
    REFERENCES `transportation_company_DB`.`employes` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drivers_trucks1`
    FOREIGN KEY (`trucks_vin_nr`)
    REFERENCES `transportation_company_DB`.`trucks` (`vin_nr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  `nip_nr` INT NOT NULL,
  `shipments_amount` INT NULL,
  `phone_nr` VARCHAR(15) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `nip_UNIQUE` (`nip_nr` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`route`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`route` (
  `route_id` INT NOT NULL AUTO_INCREMENT,
  `destination` VARCHAR(45) NOT NULL,
  `pickup_point` VARCHAR(45) NOT NULL,
  `distance` INT UNSIGNED NOT NULL,
  `aditional_info` VARCHAR(1000) NULL,
  PRIMARY KEY (`route_id`),
  INDEX `route_id_idx` (`route_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`shipment` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `route_route_id` INT NOT NULL,
  `payload_weight` INT NOT NULL,
  `deadline` DATE NOT NULL,
  `volume_m3` INT UNSIGNED NULL,
  `width` INT UNSIGNED NULL,
  `height` INT UNSIGNED NULL,
  `lenght` INT UNSIGNED NULL,
  `aditional_info` VARCHAR(1000) NULL,
  PRIMARY KEY (`customer_id`, `route_route_id`),
  INDEX `fk_shipment_route1_idx` (`route_route_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipment_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `transportation_company_DB`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipment_route1`
    FOREIGN KEY (`route_route_id`)
    REFERENCES `transportation_company_DB`.`route` (`route_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`access`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`access` (
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `acount_type` ENUM('D', 'L', 'A', 'C') NOT NULL,
  `employes_employee_id` INT NULL,
  `customer_customer_id` INT NULL,
  INDEX `fk_access_employes1_idx` (`employes_employee_id` ASC) VISIBLE,
  INDEX `fk_access_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `username_idx` (`username` ASC) VISIBLE,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk_access_employes1`
    FOREIGN KEY (`employes_employee_id`)
    REFERENCES `transportation_company_DB`.`employes` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_access_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `transportation_company_DB`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`jobs` (
  `job_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `route_route_id` INT NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NOT NULL,
  `real_start` DATETIME NULL,
  `real_end` DATETIME NULL,
  `aditional_info` VARCHAR(1000) NULL,
  `drivers_employes_employee_id` INT NULL,
  PRIMARY KEY (`job_id`, `route_route_id`),
  INDEX `fk_jobs_route1_idx` (`route_route_id` ASC) VISIBLE,
  INDEX `job_id_idx` (`job_id` ASC) VISIBLE,
  CONSTRAINT `fk_jobs_drivers1`
    FOREIGN KEY (`drivers_employes_employee_id`)
    REFERENCES `transportation_company_DB`.`drivers` (`employes_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_route1`
    FOREIGN KEY (`route_route_id`)
    REFERENCES `transportation_company_DB`.`route` (`route_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
