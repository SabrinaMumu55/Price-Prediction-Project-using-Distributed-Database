
insert into Customer select * From (
select * from Customer1 UNION select * From Customer2@site1)
commit;
SELECT * From Customer;

insert into Product select * From (
select * from Product1 UNION select * From Product2@site1)
commit;
SELECT * From Product;



insert into Details select * From (
select * from Details1 UNION select * From Details2@site1)
commit;
SELECT * From Details;

create or replace view Customer(Customer_ID, Customer_Name) as
select cid, name
from Customer ;

create or replace view Product(Product_Name, Price) as
select pname, price
from Product order by pname;
commit;