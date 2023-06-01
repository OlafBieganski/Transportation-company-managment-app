CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `customer_shipment` AS
    SELECT 
        `customer`.`customer_id` AS `customer_id`,
        `customer`.`company_name` AS `company_name`,
        `shipment`.`payload_weight` AS `payload_weight`,
        `shipment`.`deadline` AS `deadline`,
        `route`.`destination` AS `destination`,
        `route`.`distance` AS `distance`,
        `route`.`pickup_point` AS `pickup_point`
    FROM
        ((`shipment`
        JOIN `customer` ON ((`shipment`.`customer_id` = `customer`.`customer_id`)))
        JOIN `route` ON ((`shipment`.`route_route_id` = `route`.`route_id`)));
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `driver_truck` AS
    SELECT 
        `drivers`.`employes_employee_id` AS `employes_employee_id`,
        `employes`.`first_name` AS `first_name`,
        `employes`.`last_name` AS `last_name`,
        `trucks`.`vin_nr` AS `vin_nr`,
        `trucks`.`registration_nr` AS `registration_nr`,
        `trucks`.`production_year` AS `production_year`,
        `truck_model`.`model` AS `model`,
        `truck_model`.`brand` AS `brand`,
        `truck_model`.`payload` AS `payload`
    FROM
        (((`drivers`
        JOIN `employes` ON ((`drivers`.`employes_employee_id` = `employes`.`employee_id`)))
        JOIN `trucks` ON ((`drivers`.`trucks_vin_nr` = `trucks`.`vin_nr`)))
        JOIN `truck_model` ON ((`trucks`.`truck_model_model` = `truck_model`.`model`)));
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `employee_access` AS
    SELECT 
        `employes`.`employee_id` AS `employee_id`,
        `employes`.`first_name` AS `first_name`,
        `employes`.`last_name` AS `last_name`,
        `access`.`username` AS `username`,
        `access`.`acount_type` AS `acount_type`
    FROM
        (`employes`
        JOIN `access` ON ((`employes`.`employee_id` = `access`.`employes_employee_id`)));
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `job_route` AS
    SELECT 
        `drivers`.`employes_employee_id` AS `employes_employee_id`,
        `trucks`.`vin_nr` AS `vin_nr`,
        `jobs`.`job_id` AS `job_id`,
        `jobs`.`start` AS `start`,
        `jobs`.`end` AS `end`,
        `route`.`pickup_point` AS `pickup_point`,
        `route`.`destination` AS `destination`,
        `route`.`distance` AS `distance`
    FROM
        (((`drivers`
        JOIN `trucks` ON ((`drivers`.`trucks_vin_nr` = `trucks`.`vin_nr`)))
        JOIN `jobs` ON ((`drivers`.`employes_employee_id` = `jobs`.`drivers_employes_employee_id`)))
        JOIN `route` ON ((`jobs`.`route_route_id` = `route`.`route_id`)));