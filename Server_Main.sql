set serveroutput ON
drop table Customer cascade constraint;
drop table Product cascade constraint;
drop table Details cascade constraint;
drop table Customer1 cascade constraint;
drop table Product1 cascade constraint;
drop table Details1 cascade constraint;

clear screen;

create table Customer(
	cid int not null,
	name varchar2(50),
	address varchar(50),
	phone int ,
	primary key(cid)	
);

CREATE OR REPLACE TRIGGER InsertedToCustomer
After INSERT 
ON Customer
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted to Customer');
END;
/

create table Product(
	pid int not null,
    pname varchar2(50),
	price int,
	primary key(pid)	
);

CREATE OR REPLACE TRIGGER InsertedToProduct
After INSERT 
ON Product
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted to Product');
END;
/
create table Details(
	cid int not null,
	pid int not null,
	foreign key(cid) references Customer(cid),
	foreign key(pid) references Product(pid)	
);

create table Customer1(
	cid int not null,
	name varchar2(50),
	address varchar(50),
	phone int ,
	primary key(cid)
);

insert into Customer1 (cid,name,address,phone) values (1, 'A', 'Dhaka', 01910057385);
insert into Customer1 (cid,name,address,phone) values (2, 'B', 'Rajshahi', 01773728936);
insert into Customer1 (cid,name,address,phone) values (3, 'C', 'Khulna', 01975493721);
insert into Customer1 (cid,name,address,phone) values (4, 'D', 'Dhaka', 01813560374);
insert into Customer1 (cid,name,address,phone) values (5, 'E', 'Chottogram', 01938990473);





create table Product1(
	pid int not null,
    pname varchar2(50),
	price int,
	primary key(pid)	
);

insert into Product1 (pid,pname,price) values (1, 'TV', 25000 );
insert into Product1 (pid,pname,price) values (2, 'TV', 20000 );
insert into Product1 (pid,pname,price) values (3, 'TV', 27000 );
insert into Product1 (pid,pname,price) values (4, 'AC', 40000 );
insert into Product1 (pid,pname,price) values (5, 'AC', 70000 );
insert into Product1 (pid,pname,price) values (6, 'Mobile', 15000 );
insert into Product1 (pid,pname,price) values (7, 'Mobile', 17000 );


create table Details1(
	cid int not null,
	pid int not null,
	foreign key(cid) references Customer1(cid),
	foreign key(pid) references Product1(pid)		
);

insert into Details1 (cid,pid) values (1, 1);
insert into Details1 (cid,pid) values (1, 5);
insert into Details1 (cid,pid) values (1, 4);
insert into Details1 (cid,pid) values (2, 6);
insert into Details1 (cid,pid) values (2, 3);
insert into Details1 (cid,pid) values (3, 5);
insert into Details1 (cid,pid) values (4, 6);
insert into Details1 (cid,pid) values (4, 7);
insert into Details1 (cid,pid) values (5, 4);
insert into Details1 (cid,pid) values (5, 5);
insert into Details1 (cid,pid) values (5, 2);
insert into Details1 (cid,pid) values (5, 7);
commit;
