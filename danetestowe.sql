Insert into employes values('1', 'Jan', 'Kowalski', 'M', '32', 
'4000', 'jkowalski@gmail.com', '255366477');
Insert into employes values('2', 'Paweł', 'Nowak', 'M', '34', 
'4500', 'pnowak@gmail.com', '123654789');
Insert into employes values('3', 'Marta', 'Pawelec', 'F', '28', 
'4000', 'martapawelec@interia.pl', '763874901');
Insert into employes values('4', 'Maciej', 'Kowal', 'M', '45',
'5000', 'kowal123@interia.pl', '602353408');

insert into customer values('1', 'Super Firma', '1234567890', '0',
'075543785', 'sfirma@gmail.com');
insert into customer values('2', 'Firmex', '1987654321', '0',
'546874238', 'firmex@gmail.com');
insert into customer values('3', 'Motex', '1657545234', '0',
'452345098', 'motex@gmail.com');

insert into access(username, password, acount_type, employes_employee_id)
values('JKowalski', 'h4slo', 'A', '1');
insert into access(username, password, acount_type, employes_employee_id)
values('PNowak', 'p4ssword', 'L', '2');
insert into access(username, password, acount_type, employes_employee_id)
values('MPawelec', 'asd123', 'D', '3');
insert into access(username, password, acount_type, employes_employee_id)
values('MKowal', '321dsa', 'D', '4');
insert into access(username, password, acount_type, customer_customer_id)
values('SuperFirma', 'haslo999', 'C', '1');
insert into access(username, password, acount_type, customer_customer_id)
values('Firmex', '111haslo', 'C', '2');
insert into access(username, password, acount_type, customer_customer_id)
values('Motex', 'j4blKo', 'C', '3');


insert into truck_model values('Scania', 'R370', '7500', '2495',
'5935','3870','35000','35000');
insert into truck_model values('Man', 'TGX', '7500', '2500',
'5875','3993','35000','35000');

insert into trailer values('87654321', '6500','2500', '3800', '0',
'2000', '20000' );
insert into trailer values('21436587', '6500','2500', '3800', '1',
'2000', '20000' );
insert into trailer values('89674523', '6500','2500', '3800', '0',
'2000', '23000' );

insert into trucks values('12345678', 'DW3455X','2019-01-02',
'2023-10-10','2023-11-10', '2023-11-10', ' ', '87654321', 'Man');
insert into trucks values('64358723', 'DW4512X','2020-03-02',
'2024-01-10','2023-11-10', '2023-11-10', ' ', '21436587', 'Scania');

insert into drivers values('3','12345678');
insert into drivers values('4','64358723');

insert into route values('1', 'Gdańsk', 'Wrocław', '502', 'Przejazd pod wiaduktem o wysokości 4,5 metra');
insert into route values('2', 'Kraków', 'Wrocław', '280', 'Przejazd przez autostradę A4');

insert into jobs(job_id, route_route_id, start, end, drivers_employes_employee_id) 
values('1', '1', '2023-06-01 06:00:00', '2023-06-01 12:00:00', '3');
insert into jobs(job_id, route_route_id, start, end, drivers_employes_employee_id) 
values('2', '2', '2023-06-03 05:00:00', '2023-06-03 9:00:00', '4');

insert into shipment(customer_id, route_route_id, payload_weight, deadline, volume_m3, width, height, lenght, aditional_info)
values('1', '1', '10000', '2023-06-01', '35', '2000', '3500', '5000', 'Przesyłki zawierają szklane elementy');
insert into shipment(customer_id, route_route_id, payload_weight, deadline, volume_m3, width, height, lenght)
values('2', '2', '15000', '2023-06-03', '35', '2000', '3500', '5000');
