#Create a schema named Travego. 
create database Travego;

#Create the tables mentioned above with the mentioned column names. 
create table Passenger 
(Passenger_id int,
Passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20)
);
Create table Price
(id int,
Bus_type varchar(20),
Distance int,
Price int);
insert into Passenger values
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Kushboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji','1000','Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into Price values
(1,'Sleeper',350,770),
(2,'Sleeper',550,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

select * from Passenger;
select * from Price;

#a. How many female passengers traveled a minimum distance of 600 KMs?
select count(Gender) as female_count from Passenger where Distance<=600 and Gender='F';

#b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus
select * from passenger where Distance>500 and Bus_type='Sleeper';

#c. Select passenger names whose names start with the character 'S'
select Passenger_name from passenger where Passenger_name like 'S%';

/*d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,Destination City, Bus type, 
and Price in the output.*/
select Passenger_name,Boarding_City,Destination_City,Pa.Bus_Type, pr.Price from Passenger Pa join price pr 
on Pa.Distance = pr.Distance and Pa.Bus_Type=pr.Bus_Type;

#e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
select Passenger_name, pr.price, pr.Bus_type,pa.Distance from passenger pa join price pr 
on pa.Distance=pr.Distance and pa.Bus_Type and pr.Bus_Type 
where pa.Distance>=1000 and pa.Bus_Type='Sitting';

/*Inference From the given data, it is inferred that passenegers those travelled in Sitting are totally 4. 
Out of 4 no one has travelled 1000 kms. Therefore the output will be zero rows*/

#f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select pa.passenger_name, pr.price,pr.Bus_Type from passenger pa join price pr
on pa.Distance=pr.Distance where pr.Distance=600 and (pr.Bus_Type='Sleeper' or pr.Bus_Type='Sitting');

#g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper.
select * from passenger;
set sql_safe_updates=0;
update passenger set Category='Non-AC' where Bus_Type='Sleeper';
select * from passenger;

#h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
set autocommit=0;
delete from passenger where Passenger_name='Piyush';
commit;
#i. Truncate the table passenger and comment on the number of rows in the table (explain if required).
truncate passenger;
#j. Delete the table passenger from the database.
drop table passenger;