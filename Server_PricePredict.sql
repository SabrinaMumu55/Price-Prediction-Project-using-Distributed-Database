set serveroutput on;
set verify off;
clear screen;


create or replace view Products(Product_Name,Price) as
select pname, avg(price) from Product Group by pname;


create or replace function Predict(ProductName in Product.pname%type)
Return Product.price%type
is
	pn Product.pname%type;
	pr Product.price%type;
	
begin
	SELECT price into pr from Products where Products.Product_Name= ProductName;
	
	return pr;
	exception 
	when no_data_found then 
	dbms_output.put_line('No data found'); 
	
    
end Predict;
/

DECLARE

	ProductName Product.pname%type;
	ProductPrice Product.price%type;
	--pr Product.price%type;
	
	Mumu exception;
BEGIN
	ProductName := '&ProductName';
	
	ProductPrice := Predict(ProductName);
	
	--SELECT price into pr from Products where Products.Product_Name= ProductName;
	dbms_output.put_line('Predicted Product Price = ' || ProductPrice); 

exception 
	when no_data_found then 
		dbms_output.put_line('No data found'); 
	WHEN Mumu then
		dbms_output.put_line('Amount Exceeds');
	WHEN Others then
		dbms_output.put_line('No such product exists');

END;
/
commit;