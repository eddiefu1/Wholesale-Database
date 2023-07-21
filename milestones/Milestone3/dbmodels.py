import os
#highSale = "Highest sale for a merchandise in a store"
def highSale(store):
  try:
    conn = connect() #connect to database
    rows = [] #declaring array of rows 
    headers = ['Order_ID', 'quantity', 'Merchandise_Name', 'Price'] #header files for the command to show when runnning command
    if conn:
      cursor = conn.cursor()#connect to cursor
      query = """SELECT Orders.Order_ID ,Orders.quantity, Merchandise.Merchandise_name, Merchandise.price, SUM(Orders.quantity * Merchandise.price)
      FROM Orders INNER JOIN Merchandise ON Merchandise.Merchandise_name=Orders.Order_ID GROUP BY TotalSales HAVING COUNT(Orders.Order_ID) > 25;"""
      storeSales = store.upper()
      cursor.execute(query)#execute query
      data = cursor.fetchall()
      if data: 
        for queryData in data: 
          row = [] #declaring array of rows
          #setting columns with query data, should be the same as header set earlier
          column = queryData['Order_ID']
          column1= queryData['quantity']
          column2= queryData['Merchandise_Name']
          column3 = queryData['Price']
          #appending the columns with the rows
          row.append(column)
          row.append(column1)
          row.append(column2)
          row.append(column3)
          rows.append(row)
          #closing the connection 
          conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output
#highestCustomer= "The customer that spent the most in this database from all the stores"
def highestCustomer():
  try: 
    conn= connect()#connect to database
    rows = []#declaring array of rows 
    headers = ['Customer_ID', 'full_name', 'Total_Amount']#header files for the command to show when runnning command
    if conn:
      cursor = conn.cursor()#connect to cursor
      query = """SELECT Customers.Customer_ID, Customers.full_name, Orders.total_amount FROM Orders INNER JOIN Customers ON Customers.Customers_ID = Orders.total_amount GROUP BY Customers.Customer_ID HAVING COUNT(Customers.Customers_ID) <100;"""
         #executing query set earlier
      cursor.execute(query)
      data = curosr.fetchall()
      if data: 
        for queryData in data:
            row =[]#declaring array of rows 
          #setting column with query data, should be the same as header set earlier
            column = queryData['Customer_ID']
            column1 = queryData['full_name']
            column2 = queryData['total_amount']
          #appending rows with columns
            row.append(column)
            row.append(column1)
            row.append(column2)
            rows.append(row)
          #closing connection
            conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output
#totalMerchandise= "The highest selling merchandise a single store sells"
def totalMerchandise(store):
  try:
    conn= connect()#connect to database
    rows = []#declaring array of rows 
    headers = ['Merchandise_ID', 'Store_ID', 'Merchandise_name']#header files for the command to show when runnning command
    if conn:
      cursor= conn.cursor()#connect to cursor
      query= """CREATE FUNCTION total_items_sold(distinct_total_items INT(3)) RETURNS INT(3) 
      DETERMINISTIC
			BEGIN 
				DECLARE distinct_total_items INT(3); 
        SELECT DISTINCT Merchandise.Merchandise_ID, Store.Store_ID , Merchandise.Merchandise_nameFROM Merchandise JOIN Orders ON 
        Orders.quantity = Merchandise_ID JOIN Store ON  Store_ID = Merchandise_ID; RETURN(distinct_total_items); 
       END 
                    $$ DELIMITER;"""
      #executing query set earlier
      cursor.execute(query)
      data= cursor.fetchall()
      if data: 
        for queryData in data:
          row = []#declaring array of rows 
          column= queryData['Merchandise_ID']
          column1= queryData['Store_ID']
          column2= queryData['Merchandise_ID']
          #appending the rows with the columns
          row.append(column)
          row.append(column1)
          row.append(column2)
          rows.append(row)
          #closing the connection
          conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output

#storeOrigin= "Where the store came from"
def storeOrigin(store):
  try: 
    conn=connect()#connect to database
    rows=[]#declaring array of rows 
    headers=['Store_ID', 'Store_name', 'Company_name']#header files for the command to show when runnning command
    if conn:
      cursor= conn.cursor()#connect to cursor
      query= """SELECT Store.Store_ID, Store.Store_name, Company.Company_name 
            FROM Store JOIN Company ON Store.Store_ID = Company_name"""
      cursor.execute(query) #execute query
      data.cursor.fetchall()
    if data:
      for queryData in data:
        row = []#declaring array of rows 
        #setting the columns with query data, should be the same as the headers
        column= queryData['Store_ID']
        column1= queryData['Store_name']
        column2= queryData['Company_name']
        #appending the rows with the columns
        row.append(column)
        row.append(column1)
        row.append(column2)
        rows.append(row)
        #closing the connection
        conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output
#highPricedMerchandise= "The items that have stores over 100 dollars are"
def highPricedMerchandise(store):
  try:
    conn=connect()#connect to database
    rows = []#declaring array of rows 
    headers = ['Merchandise_name', 'Price']#header files for the command to show when runnning command
    if conn: 
      cursor= conn.cursor()#connect to cursor
      query = """ SELECT Orders.Order_ID ,Orders.quantity, Merchandise.Merchandise_name, Merchandise.price FROM Orders INNER JOIN 
		Merchandise ON Merchandise.Merchandise_name = Orders.Order_ID GROUP BY Merchandise.price HAVING Merchandise.price >100 ORDER BY Merchandise.price DESC;"""
      cursor.execute(query) #execute query
      data.cursor.fetchall()
    if data:
      for queryData in data:
        row = []#declaring array of rows 
         #setting columns of the table shown. Should be same as header set earlier
        column= queryData['Merchandise_name']
        column1= queryData['Price']
        #appending the rows
        row.append(column)
        row.append(column1)
        rows.append(row)
        #closing connection
        conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output
#itemRestriction= "The item that require the customer to be 21 or older"
def itemRestriction():
  try:   
    conn=connect()#connect to database
    rows = []#declaring array of rows 
    headers = ['Merchandise_name', 'Merchandise_ID', 'Order_ID']#header files for the command to show when runnning command
    if conn: 
      cursor= conn.cursor() #connect to cursor
      query ="""SELECT Orders.Order_ID, Merchandise.Merchandise_name, Merchandise.Merchandise_ID FROM Merchandise WHERE Merchandise.Merchandise_name =   Orders.Order_ID AND Merchandise.Merchandise_ID >(SELECT Customer.age AS "Age" FROM Customers WHERE age >= 21);"""
    cursor.execute(query) #execute query
    data.cursor.fetchall()
    if data: 
      for queryData in data:
        row= []#declaring array of rows 
         #setting columns of the table shown. Should be same as header set earlier
        column=queryData['Merchandise_name']
        column1= queryData['Merchandise_ID']
        column2 = queryData['Order_ID']
        #appending rows
        row.append(column)
        row.append(column1)
        row.append(column2)
        rows.append(row)
        #closing connection
        conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output
#employeeRole = "Find out employee pay and whether employee is hourly or salary "
def employeeRole(eid):
  try:
    conn=connect()#connect to database
    rows=[]#declaring array of rows 
    headers = ['E_ID','full_name','job_title']#header files for the command to show when runnning command
    if conn: 
      cursor = conn.cursor()#connect to cursor
      query = """DELIMITER $$
  CREATE TRIGGER employee_pay BEFORE INSERT ON Employee FOR EACH ROW
    BEGIN
		DECLARE hourly_wage DOUBLE;
    SELECT COUNT(*) INTO hourly_wage FROM Management;
    IF 
      hourly_wage = 0 THEN UPDATE Managemeny
      SET salary = salary + hourly_wage;
		ELSE 
			INSERT INTO Management(salary)
      VALUES(hourly_wage);
		END IF;
      END $$
    DELIMITER ;"""
      cursor.execute(query) #execute query
      data.cursor.fetchall()
      if data:
        for queryData in data:
          row= [] #declaring an array of row
           #setting columns of the table shown. Should be same as header set earlier
          column = queryData['E_ID']
          column1= queryData['full_name']
          column2= queryData['job_title']
          #appending the rows with columns
          row.append(column)
          row.append(column1)
          row.append(column2)
          rows.append(row)
          #closing connection
          conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output

#merchandiseOrigin= "This merchandise came from "
def merchandiseOrigin(barcode):
  try: 
    conn= connect()
    rows= []#declaring array of rows 
    headers = ['Merchandise','Factory_item_barcode','Farm_item_barcode']#header files for the command to show when runnning command
    if conn: 
      cursor= conn.cursor()
      query = 	"""CREATE PROCEDURE Find_Item @Manufacturer nvarchar(30) AS 
        SELECT Merchandise, Factory.Factory_item_barcode , Farm.Farm_item_barcode FROM Merchandise 
my_secret = os.environ['DISCORD_TOKEN']
my_secret = os.environ['DISCORD_TOKEN']
my_secret = os.environ['DISCORD_TOKEN']
        INNER JOIN Merchandise.barcode = Factory.Factory_item_barcode AND Farm.Farm_item_barcode
        WHERE Merchandise.Merchandise_name = Merchandise.barcode """
      cursor.execute(query) #execute query
      data.cursor.fetchall()
    if data: 
      for queryData in data: 
        row = []#declaring array of rows 
         #setting columns of the table shown. Should be same as header set earlier
        column = queryData['Merchandise']
        column1 = queryData['Factory_item_barcode']
        column2 = queryData['Farm_item_barcode']
        #appending columns with rows
        row.append(column)
        row.append(column1)
        row.append(column2)
        rows.append(row)
        #closing connection
        conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output

#totalSale= "The total sale of this store is " 
def totalSale(store):
  try: 
    conn=connect()
    rows=[]#declaring array of rows 
    header=['Store_ID','Store_name', 'total_amount']#header files for the command to show when runnning command
    if conn:
      cursor=conn.cursor()
      query: """CREATE FUNCTION total_sales( total_sales DECIMAL(10,2))
		RETURNS VARCHAR(20)
    DETERMINISTIC
  BEGIN 
			DECLARE Sale_Store VARCHAR(20);
  SELECT Orders.total_amount = SUM(Orders.total_amount), Store.Store_ID, Store.Store_name
	FROM Orders JOIN Stores ON Store.Store_name = Orders.total_amount;
      RETURN (Sale_Store);
	END $$
DELIMITER;"""
      cursor.execute(query) #execute query
      data.cursor.fetchall()
    if data:
      for queryData in data:
        row=[]#declaring array of rows
        #setting columns of the table shown. Should be same as header set earlier
        column= queryData['Store_ID'] 
        column1= queryData['Store_name']
        column2 = queryData['total_amount']
        #appending the rows with the columns
        row.append(column)
        row.append(column1)
        row.append(column2)
        rows.append(row)
        #closing the connection
        conn.close()
  except Exception as e:
    print(e)
    output = -1
    return output
my_secret = os.environ['DISCORD_TOKEN']
