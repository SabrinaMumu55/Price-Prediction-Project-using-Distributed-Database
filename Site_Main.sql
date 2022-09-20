set serveroutput ON

drop table Customer2 cascade constraint;
drop table Product2 cascade constraint;
drop table Details2 cascade constraint;

clear screen;


create table Customer2(
	cid int not null,
	name varchar2(50),
	address varchar(50),
	phone int ,
	primary key(cid)
);

insert into Customer2 (cid,name,address,phone) values (100, 'A', 'Dhaka', 01910057385);
insert into Customer2 (cid,name,address,phone) values (200, 'B', 'Rajshahi', 01773728936);





create table Product2(
	pid int not null,
    pname varchar2(50),
	price int,
	primary key(pid)	
);

insert into Product2 (pid,pname,price) values (100, 'TV', 25000 );
insert into Product2 (pid,pname,price) values (400, 'AC', 40000 );
insert into Product2 (pid,pname,price) values (700, 'Mobile', 17000 );

create table Details2(
	cid int not null,
	pid int not null,
	foreign key(cid) references Customer2(cid),
	foreign key(pid) references Product2(pid)		
);

insert into Details2 (cid,pid) values (100, 100);
insert into Details2 (cid,pid) values (100, 400);
insert into Details2 (cid,pid) values (200, 700);
commit;

