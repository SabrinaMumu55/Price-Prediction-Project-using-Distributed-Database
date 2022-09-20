set serveroutput on;
set verify off;

CREATE OR REPLACE PACKAGE output AS

	procedure Product_Search(CustomerID in Customer.cid%type);
	
END output;
/

CREATE OR REPLACE PACKAGE BODY output AS
	
	procedure Product_Search(CustomerID in Customer.cid%type)
	is

	--CustomerID Customer.cid%type;
	begin
	for r in (select pname from product join details on product.pid= details.pid where cid=CustomerID)
	loop 
		dbms_output.put_line(r.pname);
	end loop;
		
	
	exception 
		when no_data_found then 
		dbms_output.put_line('No data found'); 
		
	end Product_Search;
	
END output;
/


ACCEPT x number PROMPT "Enter customer id: "
DECLARE
	
	CustomerID Customer.cid%type;
	ProductID Product.pid%type;
	ProductName Product.pname%type;
BEGIN
	CustomerID := &x ;
	
	select DISTINCT cid into CustomerID from Customer where cid= CustomerID;
	--dbms_output.put_line(CustomerID);
	
	output.Product_Search(CustomerID);
	
	exception 
	when no_data_found then 
		dbms_output.put_line('No data found'); 
END;
/