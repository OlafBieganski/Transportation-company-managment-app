create user 'JKowalski'@'localhost' identified by 'h4slo';
grant all privileges on transportation_company_db.* to 'JKowalski'@'localhost';
show grants for 'JKowalski'@'localhost';

create user 'PNowak' identified by 'p4ssword';
grant all privileges on transportation_company_db.jobs to 'PNowak';
grant all privileges on transportation_company_db.route to 'PNowak';
grant all privileges on transportation_company_db.shipment to 'PNowak';
grant all privileges on transportation_company_db.drivers to 'PNowak';
grant all privileges on transportation_company_db.trucks to 'PNowak';
grant all privileges on transportation_company_db.trailer to 'PNowak';
grant all privileges on transportation_company_db.truck_model to 'PNowak';
grant all privileges on transportation_company_db.customer to 'PNowak';
grant all privileges on transportation_company_db.username to 'PNowak';

create user 'MKowal' identified by '321dsa';

create user 'Firmex' identified by '111haslo';
grant insert on transportation_company_db.shipment to 'Firmex';
grant insert on transportation_company_db.route to 'Firmex';
grant select on transportation_company_db.route to 'Firmex';