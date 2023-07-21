	SELECT 
		Orders.Order_ID,Orders.quantity, Merchandise.Merchandise_name, Merchandise.price, SUM(Orders.quantity * Merchandise.price)
	FROM 
		Orders
    INNER JOIN
		Merchandise 
	ON 	
		Merchandise.Merchandise_name=Orders.Order_ID  
    GROUP BY
		TotalSales 
    HAVING 
		COUNT(Orders.Order_ID) > 25;
    
    
    -- This query calculates the best selling merchandises from a store
    
    SELECT 
		Orders.Order_ID ,Orders.quantity, Merchandise.Merchandise_name, Merchandise.price  
	FROM 
		Orders
    INNER JOIN 
		Merchandise 
	ON 
		Merchandise.Merchandise_name = Orders.Order_ID
    GROUP BY 
		Merchandise.price
    HAVING 
		Merchandise.price >100
    ORDER BY 
		Merchandise.price 
	DESC;

    -- This query finds items in the order that is greater than 100 dollars
    


	SELECT 
		Customers.Customer_ID, Customers.full_name, Orders.total_amount 
	FROM 
		Orders
    INNER JOIN 
		Customers 
	ON  
		Customers.Customers_ID = Orders.total_amount 
    GROUP BY 
		Customers.Customer_ID
    HAVING 
		COUNT(Customers.Customers_ID) <100; 

    
    -- This query finds the customer that spends the most money on a single purchase at a store 
    
	SELECT
		Merchandise.Merchandise_ID, Merchandise.Merchandise_name, Orders.quantity, Orders.Order_ID
	FROM 
		Merchandise
    WHERE 
		Merchandise.Merchandise_ID = Orders.Order_ID
    GROUP BY 
		Merchandise_name
    HAVING 
		COUNT(Merchandise.Merchandise_ID) = 30;
    
    -- This query finds the Merchandise that sells the most volume 
    
    SELECT 
		Orders.Order_ID, Merchandise.Merchandise_name, Merchandise.Merchandise_ID
    FROM  
		Merchandise 
    WHERE 
		Merchandise.Merchandise_name = Orders.Order_ID AND Merchandise.Merchandise_ID >
    (SELECT 
		Customer.age AS "Age"
    FROM 
		Customers
    WHERE
		age >= 21);
    
    -- This query finds if the merchandise the customer is attempting to buy needs an ID and if the customer is old enough to purchase 
    
    SELECT 
		Orders.Order_ID ,Orders.quantity, Merchandise.Merchandise_name , Merchandise.price, Merchandise.Merchandise_ID  
	FROM 
		Merchandise
    INNER JOIN 
		Orders 
	ON 
		Merchandise.Merchandise_name = Merchandise.Merchandise_ID AND Orders.Order_ID >
    (SELECT 
		Stores.Store_LOC AS "Store Location", Stores.Store_ID AS "Store_ID"
    FROM 
		Orders
	GROUP BY 
		Orders.quantity 
	HAVING 
		Count(30));
        
    -- This query finds the quantity of ordered items of a particular store out of 30
    
    DELIMITER $$
    
    CREATE TRIGGER employee_pay
    BEFORE INSERT
    ON Employee FOR EACH ROW
    BEGIN
		DECLARE 
			hourly_wage DOUBLE;
        
       SELECT 
			COUNT(*)
       INTO 
			hourly_wage
       FROM 
		    Management;
        
        IF hourly_wage = 0 THEN
			
            UPDATE Management
            
            SET salary = salary + hourly_wage;
		ELSE 
			
            INSERT INTO Management(salary)
            
            VALUES(hourly_wage);
		END IF;
        
	END $$
    
    DELIMITER ;
    
    INSERT INTO Employee(E_ID, full_name, DOB, age, job_title, hourly_wage) VALUES
    (123123, 'Robert King', '1992-05-02', 30, 'Store Manager', 0);
    
    -- This trigger will check if the employee is a salaried employee or the employee gets paid by hour
    
    DELIMITER $$ 
    CREATE TRIGGER order_information
    AFTER INSERT 
    ON Orders FOR EACH ROW
    BEGIN 
    	IF 
			Orders.quantity = 0 THEN
			UPDATE 
			Orders
			SET 
			total_amount= total_amount + quantity;
		ELSE
			
            INSERT INTO Orders(total_amount)
            VALUES(0);
		END IF;
        
        END $$
        
        DELIMITER $$;
	 INSERT INTO Orders(Order_ID, Customer_ID, quantity, barcode, Merchandise_ID, Merchandise_name, total_amount) VALUES
    (10201200, 98262823, 0, 9282932741, 2345671211, 'Grey Goose', 0);
    
	-- This trigger will determine if the order quantity is 0 and if it is the total amount also becomes 0 


	CREATE PROCEDURE Find_Store @Company nvarchar(30)
		AS
		SELECT 
			Store.Store_ID, Store.Store_name, Company.Company_name  
        FROM 
			Store
        JOIN 
			Company 
		ON 
			Company.Company_name = Store.Store_ID 
        WHERE 
			Store.Store_name= Store.store_ID AND Company.company_name< Company;
        
        -- This procedure links together the company name and the store ID 
        
        
	CREATE PROCEDURE Find_Item @Manufacturer nvarchar(30)
        AS 
        SELECT 
			Merchandise, Factory.Factory_item_barcode , Farm.Farm_item_barcode
        FROM 
			Merchandise 
        INNER JOIN 
			Merchandise.barcode = Factory.Factory_item_barcode AND Farm.Farm_item_barcode
        WHERE 
			Merchandise.Merchandise_name = Merchandise.barcode
        
        -- This procedure displays where the merchandise comes from which manufacturer based on the barcode
		
    DELIMITER $$
    		
		CREATE FUNCTION total_sales(
			total_sales DECIMAL(10,2) 
            )
		RETURNS VARCHAR(20)
        DETERMINISTIC
        BEGIN 
			DECLARE 
				Sale_Store VARCHAR(20);
            SELECT 
				Orders.total_amount = SUM(Orders.total_amount), Store.Store_ID, Store.Store_name
			FROM 
				Orders
            JOIN 
				Stores 
            ON 
				Store.Store_name = Orders.total_amount;
        
			RETURN (Sale_Store);
		END $$
	DELIMITER ; 
            
		-- This function finds the total from a specific store and displays which store
        
        DELIMITER $$
        CREATE FUNCTION total_items_sold(
			distinct_total_items INT(3)
            )
            RETURNS INT(3)
            DETERMINISTIC
				BEGIN 
					DECLARE 
						distinct_total_items INT(3);
                    SELECT DISTINCT
						Merchandise.Merchandise_ID, Store.Store_ID , Merchandise.Merchandise_name 
                    FROM 
						Merchandise
                    JOIN 
						Orders 
					ON 
						Orders.quantity = Merchandise_ID 
                    JOIN 
						Store 
					ON 
						Store_ID = Merchandise_ID;
                    
                    RETURN(distinct_total_items); 
                    
				END $$
		DELIMITER ;
					
		-- This function finds the total number of distinct items in a store
        
        

     
        
	   UPDATE
			Merchandise_ID 
       INNER JOIN 
			Orders
       ON 
			Orders.total_amount = Merchandise.Merchandise_price
	   SET 
			Merchandise_ID  = Merchandise_price*1.1
	   WHERE 
			Merchandise_ID = '5872096772';
        
	-- This query updates the price of this item by a factor of 1.1
    
		UPDATE
			Employee_hourly_wage  
		INNER JOIN 
			Employee
        ON 
			E_ID = Company.E_ID
		SET 
			Employee_hourly_wage  = Employee_hourly_wage  + 2
	   WHERE 
			E_ID = '337372';
            
		-- This query updates the hourly rate of an employee
        
        DELETE FROM 
			Employee 
		WHERE 
			Employee.full_name = 'John White';
        
        -- This query deletes an employee's data from the database 
        
        
        DELETE FROM 
			Merchandise 
		WHERE 
			Merchandise_ID = '5872096772';
        
        -- This query deletes a merchandise from the database
        
        
    
    