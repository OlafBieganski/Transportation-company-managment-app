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
  `model` VARCHAR(45) NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `weight` INT UNSIGNED NOT NULL,
  `width` INT UNSIGNED NOT NULL,
  `lenght` INT UNSIGNED NOT NULL,
  `height` INT UNSIGNED NOT NULL,
  `max_trailer_weight` INT UNSIGNED NULL,
  `payload` INT UNSIGNED NULL,
  PRIMARY KEY (`model`),
  INDEX `model_idx` (`model` ASC) VISIBLE)
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
  `truck_model_model` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `registration_nr_UNIQUE` (`registration_nr` ASC) INVISIBLE,
  PRIMARY KEY (`vin_nr`, `truck_model_model`),
  INDEX `vin_nr_idx` (`vin_nr` ASC) VISIBLE,
  INDEX `fk_trucks_trailer1_idx` (`trailer_vin_nr` ASC) VISIBLE,
  INDEX `fk_trucks_truck_model1_idx` (`truck_model_model` ASC) VISIBLE,
  CONSTRAINT `fk_trucks_trailer1`
    FOREIGN KEY (`trailer_vin_nr`)
    REFERENCES `transportation_company_DB`.`trailer` (`vin_nr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trucks_truck_model1`
    FOREIGN KEY (`truck_model_model`)
    REFERENCES `transportation_company_DB`.`truck_model` (`model`)
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
    ON DELETE CASCADE
    ON UPDATE CASCADE,
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
  `distance` INT UNSIGNED NULL,
  `aditional_info` VARCHAR(1000) NULL,
  PRIMARY KEY (`route_id`),
  INDEX `route_id_idx` (`route_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_company_DB`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_company_DB`.`shipment` (
  `shipment_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `route_route_id` INT NOT NULL,
  `payload_weight` INT NOT NULL,
  `deadline` DATE NOT NULL,
  `volume_m3` INT UNSIGNED NULL,
  `width` INT UNSIGNED NULL,
  `height` INT UNSIGNED NULL,
  `lenght` INT UNSIGNED NULL,
  `aditional_info` VARCHAR(1000) NULL,
  INDEX `fk_shipment_route1_idx` (`route_route_id` ASC) VISIBLE,
  PRIMARY KEY (`shipment_id`),
  INDEX `shipment_id_idx` (`shipment_id` ASC) VISIBLE,
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
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_access_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `transportation_company_DB`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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

------------------------------
-- Stored Procedures
------------------------------

DELIMITER //

-- Dodanie nowego pracownika i jego konta
CREATE PROCEDURE `transportation_company_DB`.`register_employee` (
  IN p_username VARCHAR(20),
  IN p_password VARCHAR(20),
  IN p_email VARCHAR(45),
  IN p_first_name VARCHAR(20),
  IN p_last_name VARCHAR(20),
  IN p_sex ENUM('M', 'F'),
  IN p_age INT UNSIGNED,
  IN p_salary INT UNSIGNED,
  IN p_phone_nr VARCHAR(15),
  IN p_access_type ENUM('D', 'L', 'A', 'C')
)
BEGIN
  DECLARE v_user_count INT;

  -- Nie może byc klientem
  IF p_access_type = 'C' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Pracownik nie może posiadac konta klienta';
  END IF
  
  -- Sprawdź, czy użytkownik o podanej nazwie już istnieje
  SELECT COUNT(*) INTO v_user_count
  FROM `transportation_company_DB`.`access`
  WHERE username = p_username;
  
  -- Jeśli użytkownik już istnieje, zakończ procedurę z błędem
  IF v_user_count > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Użytkownik o podanej nazwie już istnieje';
  END IF;
  
  -- Dodaj nowego użytkownika
  START TRANSACTION;
  
  -- Dodaj wpis do tabeli employes
  INSERT INTO `transportation_company_DB`.`employes` (first_name, last_name, sex, age, salary, email, phone_nr)
  VALUES (p_first_name, p_last_name, p_sex, p_age, p_salary, p_email, p_phone_nr);
  
  -- Pobierz ID dodanego użytkownika
  SET @employee_id = LAST_INSERT_ID();
  
  -- Dodaj wpis do tabeli access
  INSERT INTO `transportation_company_DB`.`access` (username, password, acount_type, employes_employee_id)
  VALUES (p_username, p_password, p_access_type, @employee_id);
  
  COMMIT;
END //

-- delete employee
CREATE PROCEDURE delete_employee(
  IN p_employee_id INT
)
BEGIN
  DECLARE v_id INT;

  -- Check if the employee exists
  SELECT COUNT(*) INTO v_id
  FROM `transportation_company_DB`.`employes`
  WHERE employee_id = p_employee_id;

  IF v_id = 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Employee does not exist';
  ELSE
    BEGIN
      -- Delete the employee from the employes table
      DELETE FROM `transportation_company_DB`.`employes`
      WHERE employee_id = p_employee_id;

      SELECT 'Employee and corresponding access record deleted' AS result;
    END;
  END IF;
END //

-- Dodanie pracownika jako kierowcy
CREATE PROCEDURE add_as_driver (
  IN p_employee_id INT
)
BEGIN
  DECLARE v_driver_id INT;
  
  -- Check if the employee exists
  SELECT COUNT(*) INTO v_driver_id
  FROM transportation_company_DB.employes
  WHERE employee_id = p_employee_id;
  
  -- If employee exists, create a driver and assign the employee
  IF v_driver_id > 0 THEN
    -- Create the driver
    INSERT INTO transportation_company_DB.drivers (employes_employee_id)
    VALUES (p_employee_id);
    
    -- Display success message
    SELECT 'Driver created with employee_id: ', p_employee_id AS 'Message';
  ELSE
    -- Display error message if employee doesn't exist
    SELECT 'Employee with employee_id: ', p_employee_id, ' does not exist.' AS 'Error';
  END IF;
END //

CREATE PROCEDURE delete_as_driver(
  IN p_employee_id INT
)
BEGIN
  DECLARE v_driver_count INT;

  -- Check if the employee is a driver
  SELECT COUNT(*) INTO v_driver_count
  FROM `transportation_company_DB`.`drivers`
  WHERE employes_employee_id = p_employee_id;

  IF v_driver_count = 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Employee is not a driver';
  ELSE
    BEGIN
      -- Delete the driver from the drivers table
      DELETE FROM `transportation_company_DB`.`drivers`
      WHERE employes_employee_id = p_employee_id;

      SELECT 'Driver deleted' AS result;
    END;
  END IF;
END //

-- Add a client and register his account
CREATE PROCEDURE add_customer (
  IN p_company_name VARCHAR(45),
  IN p_nip_nr INT,
  IN p_phone_nr VARCHAR(15),
  IN p_email VARCHAR(45),
  IN p_username VARCHAR(20),
  IN p_password VARCHAR(20)
)
BEGIN
  DECLARE v_customer_id INT;
  
  -- Check if the NIP number already exists
  SELECT COUNT(*) INTO v_customer_id
  FROM transportation_company_DB.customer
  WHERE nip_nr = p_nip_nr;
  
  -- If NIP number doesn't exist, create the customer and their access account
  IF v_customer_id = 0 THEN
    -- Create the customer
    INSERT INTO transportation_company_DB.customer (company_name, nip_nr, shipments_amount, phone_nr, email)
    VALUES (p_company_name, p_nip_nr, 0, p_phone_nr, p_email);
    
    -- Get the auto-generated customer_id
    SET v_customer_id = LAST_INSERT_ID();
    
    -- Create the access account
    INSERT INTO transportation_company_DB.access (username, password, acount_type, customer_customer_id)
    VALUES (p_username, p_password, 'C', v_customer_id);
    
    -- Display success message
    SELECT 'Customer created with customer_id: ', v_customer_id AS 'Message';
  ELSE
    -- Display error message if NIP number already exists
    SELECT 'Customer with NIP number: ', p_nip_nr, ' already exists.' AS 'Error';
  END IF;
END //

-- delete customer
CREATE PROCEDURE delete_customer (
  IN p_customer_id INT
)
BEGIN
  DECLARE v_count INT;
  
  -- Check if the customer exists
  SELECT COUNT(*) INTO v_count
  FROM transportation_company_DB.customer
  WHERE customer_id = p_customer_id;
  
  -- If customer exists, delete the customer and their access account
  IF v_count > 0 THEN
    
    -- Delete the customer
    DELETE FROM transportation_company_DB.customer
    WHERE customer_id = p_customer_id;
    
    -- Display success message
    SELECT 'Customer with customer_id: ', p_customer_id, ' deleted.' AS 'Message';
  ELSE
    -- Display error message if customer doesn't exist
    SELECT 'Customer with customer_id: ', p_customer_id, ' does not exist.' AS 'Error';
  END IF;
END //

-- triger for increasing a shipment amount of a customers when he makes a new one
CREATE TRIGGER increase_shipment_amount
AFTER INSERT ON `transportation_company_DB`.`shipment`
FOR EACH ROW
BEGIN
  UPDATE `transportation_company_DB`.`customer`
  SET shipment_amount = shipment_amount + 1
  WHERE customer_id = NEW.customer_id;
END //

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
