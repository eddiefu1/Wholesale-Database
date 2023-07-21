-- Script name: inserts.sql
   -- Author:      Eddie Fu
   -- Purpose:     insert sample data to test the integrity of this database system
   
   -- the database used to insert the data into.
USE WholesaleManagementDB;
     
        -- Big Box Department Store table inserts
   INSERT INTO Big_Box_Department_Store(BB_ID, BB_LOC, BB_phone, Store_type, BB_item_barcode, BB_name, BB_EID) VALUES
   (1275181452, '100 Westlake Center.','(415) 466-0501' ,'Home Goods Chain',  1125428631, 'Target',301382), 
   (0013527169, '65 Colma Blvd.', '(650) 992-5350', 'Apparel Chain', 1174218003, 'Marshalls',301212), 
   (0004613068 , '303 Gellert Blvd.','(650) 992-9689' , 'Home Goods Chain', 1166853920, 'Bed Bath & Beyond',318292);

     -- Employee table inserts
    INSERT INTO Employee (E_ID, full_name, DOB, age, job_title, hourly_wage) VALUES 
	(122211, 'Carlos Lopez', '1960-03-02', 62, 'Founder', 0),
    (100013, 'Chip Wilson', '1955-08-04', 67, 'Founder', 0), 
	(380821, 'Kobe Bryant', '1990-02-15', 32, 'Founder', 0),
    (100012, 'Carlos Rendon', '1972-05-03', 50, 'Founder', 0),
	(304482, 'Doug Mcmillion','1980-02-01', 40, 'Founder', 0),
	(336442, 'Jeff Jose', '1980-03-02', 42, 'Plant Manager', 0),
	(395312, 'Mark Zuckerberg', '1984-05-14', 38, 'Manufacturing Manager', 0),
	(320572, 'Sakura Ting', '1990-01-09', 32, 'Store Manager', 0), 
    (289992, 'Mary Pape', '1999-06-05', 23, 'Store Manager', 0),
    (302022, 'Ronnie Cruz', '1980-02-01', 42, 'Store Manager', 0),
    (301382, 'Will Cruz', '1990-01-12', 32, 'Retail Worker', 20.00), 
    (301212, 'Jesus Gonzalez', '1992-02-08', 30, 'Retail Worker', 15.50), 
    (318292, 'Jose Ramirez', '1977-03-08', 45, 'Retail Worker', 20.00), 
    (283802, 'Johnny Lin', '2000-04-20', 22, 'Retail Worker', 20.00),
    (393562, 'Carlos Nina', '2002-04-07', 20, 'Retail Worker', 20.00), 
    (300010, 'Howard Stern', '1999-02-02', 22, 'Retail Worker', 20.00), 
    (334672, 'John Roberts', '2000-03-20', 22, 'Retail Worker', 20.00),
	(337372, 'Jae Lin', '1992-03-02', 30, 'Retail Worker', 25.50), 
	(330572, 'John White', '2000-02-03', 22, 'Retail Worker', 20.00), 
    (364772, 'Jeff Bloom', '2002-03-01', 20, 'Retail Worker', 20.00), 
    (316372, 'John Golden', '2001-02-03', 21, 'Retail Worker', 20.00), 
    (343252, 'Edward Snowden', '2005-02-06', 17,'Retail Worker', 17.00), 
    (369462, 'Jesus Luis', '2001-02-01', 21, 'Retail Worker', 16.00), 
    (357712, 'Ashe Lin', '2001-07-03', 21, 'Retail Worker', 20.50), 
    (366412, 'Ryze Bob', '1994-03-03', 28,'Retail Worker', 23.50),
    (384572, 'Luigi Moore', '2000-09-07', 22, 'Retail Worker', 18.00),
	(381112, 'Bob Melvin', '1992-03-02', 30, 'Retail Worker', 17.50),
    (352972, 'Sean Tin', '2005-02-10', 17, 'Factory Worker', 8.50), 
    (207162, 'Jose Luis', '2006-09-09', 16, 'Factory Worker', 17.20), 
    (369712, 'Brian Lin', '2002-09-06', 20, 'Factory Worker', 18.50), 
    (329901, 'Dale Brian', '2003-05-05', 19, 'Farmer', 20.60), 
    (376112, 'John Ko', '1960-02-08', 62, 'Farmer', 23.50), 
    (342352, 'Buster Posey', '1940-02-20', 82, 'Farmer', 30.50);

    

   
   -- Book Store table inserts
   INSERT INTO Book_Store (bookstore_ID, bookstore_LOC, bookstore_phone, Store_type, bookstore_item_barcode, bookstore_name, bookstore_EID) VALUES 
   (1090162936, '1150 El Camino Real Ste 277.', '(650) 871-2530', 'Retail Bookstore', 1514788481, 'Barnes and Nobles',283802),
   (1316656588, '50 2nd St.', '(415) 495-2992', 'Independent Book Store', 1506362297, 'Alexanders Bookstore',300010), 
   (1823752572, '1650 Holloway Ave.', '(415) 727-9203', 'University Bookstore', 1985075892, 'SFSU Bookstore',393562 );

   -- Clothing Store table inserts
   INSERT INTO Clothing_Store (clothingstore_ID, clothingstore_LOC, clothingstore_phone, Store_type, clothingstore_item_barcode, clothingstore_name, clothingstore_EID) VALUES 
   (1072097839, '845 Market St.', '(628) 244-8897', 'Athleisure Clothes Chain', 1872096772, 'Lululemon',100013), 
   (1059004350, '3277 Lakeshore Ave.', '(510) 763-2995', 'Clothes Chain', 1867568709, 'GAP',334672), 
   (1078441569, '405 Westlake Center.','(650) 992-0304', 'Clothes Chain',1645915078 , 'Ross',320572);   
   
	-- Company table inserts
	INSERT INTO Company (Company_name, Company_LOC, E_ID, job_title) VALUES 
    ('Lululemon', '1818 Cornwall Ave.', 100013, 'Founder'), 
    ('Nokona', '4602 E Thomas Rd., 85018,', 369712, 'Factory Worker'),
    ('Albertsons Companies', '250 Parkcenter Blvd.', 320572, 'Store Manager'),
    ('Alexanders Book Store','50 2nd St.',300010, 'Retail Worker'),
    ('Target Corp.','1000 Nicollet Mall TPS-3165.',301382, 'Retail Worker'),
    ('Bed Bath & Beyond Co', ' 650 Liberty Avenue Union.',318292, 'Retail Worker'),
    ('TJX Co', '770 Cochituate Rd.',301212, 'Retail Worker'), 
    ('Elliott Management', ' 40 West 57th Street New York.', 283802, 'Retail Worker'), 
    ('SFSU', '1650 Holloway Ave, San Francisco, CA 94132',393562, 'Retail Worker'), 
    ('GAP inc', '2 Folsom St.', 334672, 'Retail Worker');
    
    -- Customer table inserts
    INSERT INTO Customer (Customer_ID, full_name, DOB, age, Order_ID, Customer_Phone) VALUES 
    (44372117, 'Eddie Fu', '1998-04-20', 24, 80788904, '(408)-555-5555'), 
    (02462794, 'Lebron James', '1984-12-30', 37, 15077166, '(323)-135-1674'), 
    (41655799, 'Tiger Woods','1975-12-30', 46, 85299205, '(221) 565-1235');
    
  
    -- Factory table inserts 
	INSERT INTO Factory (Factory_ID, Factory_LOC, Factory_Phone, Factory_item_barcode, Factory_name,Factory_EID) VALUES 
    (8877739316, '15th floor, Red Crescent Concord Tower.', 5872096772, 'Youngone Corp, Dhaka',352972),
    (5340932792, '2302 S. Edwin C. Moses Blvd.', '(937) 226-7100', 2506362297, 'BOOK FACTORY',207162), 
    (8519666072, '917 US-82. ', '(800) 433-0957', 1, 7141803795, 'Nokona Ballgloves',369712);
    
    -- Farm table inserts
    INSERT INTO Farm (Farm_ID, Farm_LOC, Farm_phone, Farm_item_barcode, Farm_name, Farm_EID) VALUES 
    (4474045703, '40400 Harts Lake Valley Rd.', '(360) 458-7774', 676112, 7186932210 , 'Wilcox Farms',342352), 
    (0806709782, '529 Kansas Ave.', '(866) 225-4821', 3752071461, 'Crystal Creamery Modesto Plant',376112),
    (0437757354, '345 Westridge Drive.', '(800)871-3333', 5509041235 , 'Driscolls',329901);
    
    -- Grocery Stores inserts
    INSERT INTO Grocery_Store(GroceryStore_ID, GroceryStore_LOC, GroceryStore_Phone, Store_type, GroceryStore_item_barcode, GroceryStore_name, GroceryStore_EID) VALUES 
    (9722901583, '601 Westlake Cente.', '(650) 755-0576', 'Retail Supermarket Chain', 5509041235, 'Safeway',364772),
    (2821319369, '3251 20th Ave Ste 340.', '(415) 375-4242',  'Retail Supermarket Chain',3752071461, 'Whole Foods',316372), 
    (7029448510, '1600 El Camino Real.', '(650) 757-3003', 'Warehouse Chain', 8131074669, 'Costco',343252);
    
    -- Liquor Stores inserts
    INSERT INTO Liquor_Store(LiquorStore_ID, LiquorStore_LOC, LiquorStore_phone, Store_type, LiquorStore_item_barcode, LiquorStore_name,LiquorStore_EID) VALUES 
    (4628275875, '4915 Junipero Serra Blvd.', '(650) 757-0196', 'Liquor Chain', 2917180389 , 'BevMo!',243253), 
    (7714228486,'311 Gellert Blvd.', '(650) 488-2088', 'Liquor Chain', 2917180389, 'Total Wine & More', 984570), 
    (9888078687, '1648 Pacific Ave.','(415) 885-2922',  'Independent Liquor', 8892351665 , 'The Jug Shop',100012);
    
	-- Management inserts
    INSERT INTO Management(Manager_ID,full_name, E_ID,  DOB, age, salary) VALUES 
    (313378, 'Chip Wilson', 100013, '1955-8-4',67, 200000), 
    (735776,'Sakura Ting',320572, '1980-02-01', 42, 60000),
    (987318 ,'Mark Zuckerberg',395312, '1984-05-14', 38, 500000),
    (099413 , 'Carlos Rendon', 100012,'1972-05-03', 50, 'Owner',60000), 
    (367464 , 'Kobe Bryant',380821, '1990-02-15', 32, 'Owner', 150000),
    (852238 , 'Jeff Jose',336442, '1980-03-02', 42, 'Plant Manager', 120000), 
    (100001 ,'Doug Mcmillion',304482,'1980-02-01', 40, 'CEO', 400000);  
    
    -- Manufacturer inserts
    INSERT INTO Manufacturer(Manufacturer_ID, Manufacturer_LOC, Manufacturer_Phone, Company_name, Manufacturer_EID) VALUES 
    (8877739316, '159, Mallijae-Ro.', '82 2 3906114' ,'Youngone Corp',395312), 
    (8519666072, '4602 E Thomas Rd.', '(800) 433-0957','Nokona Leather Goods',036449), 
    (0806709782, ' 1000 Davis St.', '(209) 394-7901', 'Foster Farms',095319);
    
    -- Merchandise inserts
    INSERT INTO Merchandise(Merchandise_ID, barcode, Merchandise_type, Merchandise_name, price) VALUES 
    (5872096772, 8389511757,'Athletic Clothing', 'City Sweat Joggers', 128.00), 
    (7227448911 ,9985075892, 'University Clothing', 'SFSU Hoodie',50.20), 
    (5841934500 ,2917180389, 'Liquor: Vodka', 'Grey Goose', 60.30);
    
    -- Order inserts
    INSERT INTO Orders(Order_ID, Customer_ID, quantity, price, Merchandise_ID, total_amount) VALUES
    (80788904, 44372117, 1, 128.00, 5872096772, 128.00),
    (15077166, 02462794, 1, 50.20, 7227448911, 50.20),  
    (85299205, 41655799, 3,60.30, 5841934500,180.90);
    
    -- Restaurants inserts
    INSERT INTO Restaurant(Restaurant_ID, Restaurant_LOC, Restaurant_phone, Store_type, Restaurant_food_ID, Restaurant_name) VALUES 
	(4588407628, '255 Winston Dr, San Francisco, CA 94132', '(415) 759-5033', 'Fast Food Chain', 4066233228, 'McDonalds',302022), 
	(1173917448, '8270 Mira Mesa Blvd, San Diego, CA 92126', '(858) 860-5000' , 'Japanese Restaurant', 3458355942 , 'Little Sakana',289992), 
	(3298016994, '4798 Mission St, San Francisco, CA 94112', '(415) 469-5480', 'Mexican Restaurant', 9592253657, 'Taqueria Guadalajara',122211);
    
    -- Sport Equiptment Store inserts
    INSERT INTO Sport_Equiptment_Store(SportEquiptment_ID,SportsEquiptment_LOC, SportEquiptment_phone, Store_type, SportEquiptment_item_barcode, SportEquiptment_name,SportEquiptment_EID) VALUES 
    (5942909657, '64 Serramonte Center.', '(415) 325-4109', 'Sports Good Chain', 2365063819, 'DICKS',369462),
    (2331861345, '1533 Sloat Blvd.', '(415) 681-4593', 'Sports Good Chain', 9285049236, 'BIG 5',357712), 
    (9596755866, '1919 Davis St.', '(510) 569-0200',  'Multinational Retail',2365063819, 'Walmart',381112);      
    
    -- Stores inserts
    INSERT INTO Stores(Store_ID, Store_LOC, Store_type) VALUES 
    (4588407628, '255 Winston Dr.','Fast Food Chain'), 
    (4090162936,'1150 El Camino Real Ste 277.','Retail Bookstore'), 
    (3272097839, '845 Market St Unit 225.', 'Clothes Chain');