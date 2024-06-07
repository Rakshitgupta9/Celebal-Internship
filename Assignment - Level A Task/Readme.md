# SQL Solutions for Assignment - Level A Task

### Step-by-Step Guide to Install AdventureWorks Database

To get started with the AdventureWorks database, follow these steps to download and install it on your SQL Server:

1. **Download AdventureWorks Database:**
   - Go to the [Microsoft SQL Server Samples GitHub repository](https://github.com/microsoft/sql-server-samples).
   - Navigate to `samples/databases/adventure-works`.
   - Download the `.bak` file for the AdventureWorks 2019 OLTP database. Direct link: [AdventureWorks2019.bak](https://github.com/microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak).

2. **Restore the AdventureWorks Database:**
   - Use SQL Server Management Studio (SSMS) or any other SQL Server tool to restore the downloaded `.bak` file to your SQL Server instance.

Make sure to use the AdventureWorks 2019 OLTP database for your tasks.

---


## List of SQL Queries

1. **List of all customers:**
    ```sql
    SELECT * FROM Sales.Customer;
    ```

2. **List of all customers where company name ends with 'N':**
    ```sql
    SELECT * 
    FROM Sales.Store s
    JOIN Sales.Customer c ON s.BusinessEntityID = c.StoreID
    WHERE s.Name LIKE '%N';
    ```

3. **List of all customers who live in Berlin or London:**
    ```sql
    SELECT c.*
    FROM Sales.Customer c
    JOIN Person.BusinessEntityAddress bea ON c.CustomerID = bea.BusinessEntityID
    JOIN Person.Address a ON bea.AddressID = a.AddressID
    WHERE a.City IN ('Berlin', 'London');
    ```

4. **List of all customers who live in UK or USA:**
    ```sql
    SELECT c.*
    FROM Sales.Customer c
    JOIN Person.BusinessEntityAddress bea ON c.CustomerID = bea.BusinessEntityID
    JOIN Person.Address a ON bea.AddressID = a.AddressID
    JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
    WHERE sp.CountryRegionCode IN ('UK', 'US');
    ```

5. **List of all products sorted by product name:**
    ```sql
    SELECT Name 
    FROM Production.Product
    ORDER BY Name;
    ```

6. **List of all products where product name starts with an A:**
    ```sql
    SELECT ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, Size, SizeUnitMeasureCode, WeightUnitMeasureCode, Weight, DaysToManufacture, ProductLine, Class, Style, ProductSubcategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, rowguid, ModifiedDate
    FROM Production.Product
    WHERE Name LIKE 'A%'
    ORDER BY Name;
    ```

7. **List of customers who ever placed an order:**
    ```sql
    SELECT DISTINCT c.*
    FROM Sales.Customer c
    JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID;
    ```

8. **List of customers who live in London and have bought chai:**
    ```sql
    SELECT DISTINCT c.*
    FROM Sales.Customer c
    JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
    JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
    JOIN Production.Product p ON sod.ProductID = p.ProductID
    JOIN Person.BusinessEntityAddress bea ON soh.ShipToAddressID = bea.BusinessEntityID
    JOIN Person.Address a ON bea.AddressID = a.AddressID
    WHERE a.City = 'London' AND p.Name = 'Chai';
    ```

9. **List of customer who never placed an order:**
    ```sql
    SELECT * FROM Sales.Customer c
    WHERE NOT EXISTS (
        SELECT 1
        FROM Sales.SalesOrderHeader soh
        WHERE c.CustomerID = soh.CustomerID
    );
    ```

10. **List of customers who ordered a Tofu:**
    ```sql
    SELECT DISTINCT c.*
    FROM Sales.Customer c
    JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
    JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
    JOIN Production.Product p ON sod.ProductID = p.ProductID
    WHERE p.Name = 'Tofu';
    ```

11. **Details of first order of the system:**
    ```sql
    SELECT TOP 1 *
    FROM Sales.SalesOrderHeader
    ORDER BY OrderDate ASC;
    ```

12. **Find the details of most expensive order date:**
    ```sql
    WITH OrderTotals AS (
        SELECT 
            SalesOrderID,
            SUM(LineTotal) AS TotalOrderCost
        FROM 
            Sales.SalesOrderDetail
        GROUP BY 
            SalesOrderID
    )
    SELECT 
        soh.SalesOrderID,
        soh.OrderDate,
        soh.DueDate,
        soh.ShipDate,
        soh.Status,
        soh.OnlineOrderFlag,
        soh.SalesOrderNumber,
        soh.PurchaseOrderNumber,
        soh.AccountNumber,
        soh.CustomerID,
        soh.SalesPersonID,
        soh.TerritoryID,
        soh.BillToAddressID,
        soh.ShipToAddressID,
        soh.ShipMethodID,
        soh.CreditCardID,
        soh.CreditCardApprovalCode,
        soh.CurrencyRateID,
        soh.SubTotal,
        soh.TaxAmt,
        soh.Freight,
        soh.TotalDue,
        soh.Comment,
        soh.rowguid,
        soh.ModifiedDate,
        ot.TotalOrderCost
    FROM 
        Sales.SalesOrderHeader soh
    JOIN 
        OrderTotals ot ON soh.SalesOrderID = ot.SalesOrderID
    ORDER BY 
        ot.TotalOrderCost DESC;
    ```

13. **For each order get the OrderID and average quantity of items in that order:**
    ```sql
    SELECT 
        SalesOrderID,
        AVG(OrderQty) AS AverageQuantity
    FROM 
        Sales.SalesOrderDetail
    GROUP BY 
        SalesOrderID;
    ```

14. **For each order get the OrderID, minimum quantity and maximum quantity for that order:**
    ```sql
    SELECT 
        SalesOrderID,
        MIN(OrderQty) AS MinimumQuantity,
        MAX(OrderQty) AS MaximumQuantity
    FROM 
        Sales.SalesOrderDetail
    GROUP BY 
        SalesOrderID;
    ```

15. **Get a list of all managers and total no of employees who report to them:**
    ```sql
    SELECT 
        E.BusinessEntityID AS ManagerID,
        P.FirstName + ' ' + P.LastName AS ManagerName,
        COUNT(RE.BusinessEntityID) AS TotalEmployees
    FROM 
        HumanResources.Employee AS E
    INNER JOIN 
        Person.Person AS P ON E.BusinessEntityID = P.BusinessEntityID
    LEFT JOIN 
        HumanResources.Employee AS RE ON RE.OrganizationNode.GetAncestor(1) = E.OrganizationNode
    GROUP BY 
        E.BusinessEntityID, P.FirstName, P.LastName
    ORDER BY 
        TotalEmployees DESC;
    ```

16. **Get the OrderID and total quantity for each order that has a total quantity of greater than 300:**
    ```sql
    SELECT 
        SalesOrderID,
        SUM(OrderQty) AS TotalQuantity
    FROM 
        Sales.SalesOrderDetail
    GROUP BY 
        SalesOrderID
    HAVING 
        SUM(OrderQty) > 300;
    ```

17. **List of all the orders placed on or after 1996/12/31:**
    ```sql
    SELECT *
    FROM Sales.SalesOrderHeader
    WHERE OrderDate >= '1996-12-31';
    ```

18. **List of all orders shipped to Canada:**
    ```sql
    SELECT 
        soh.SalesOrderID,
        soh.OrderDate,
        soh.ShipDate,
        soh.Status,
        soh.TotalDue,
        a.AddressLine1,
        a.AddressLine2,
        a.City,
        sp.Name AS StateProvince,
        cr.Name AS CountryRegion
    FROM 
        Sales.SalesOrderHeader soh
    JOIN 
        Person.Address a ON soh.ShipToAddressID = a.AddressID
    JOIN 
        Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
    JOIN 
        Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
    WHERE 
        cr.Name = 'Canada';
    ```

19. **List of all orders with order total > 200:**
    ```sql
    SELECT *
    FROM Sales.SalesOrderHeader
    WHERE TotalDue > 200;
    ```

20. **List of all countries and sales made in each country:**
    ```sql
    SELECT 
        cr.Name AS Country,
        SUM(soh.TotalDue) AS TotalSales
    FROM 
        Sales.SalesOrderHeader soh
    JOIN 
        Person.Address a ON soh.ShipToAddressID = a.AddressID
    JOIN 
        Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
    JOIN 
        Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
    GROUP BY 
        cr.Name
    ORDER BY 
        TotalSales DESC;
    ```

21. **List of customers' contact names and number of orders they placed:**
    ```sql
    SELECT 
        p.FirstName + ' ' + p.LastName AS ContactName,
        COUNT(soh.SalesOrderID) AS NumberOfOrders
    FROM 
        Sales.SalesOrderHeader soh
    JOIN 
        Sales.Customer c ON soh.CustomerID = c.CustomerID
    JOIN 
        Person.Person p ON c.PersonID = p.BusinessEntityID
    GROUP BY 
        p.FirstName, p.LastName
    ORDER BY 
        NumberOfOrders DESC;
    ```

22. **List of customers' contact names who have placed more than 3 orders:**
    ```sql
    SELECT 
        P.FirstName + ' ' + P.LastName AS ContactName,
        COUNT(SOH.SalesOrderID) AS NumberOfOrders


    FROM 
        Sales.SalesOrderHeader AS SOH
    JOIN 
        Sales.Customer AS C ON SOH.CustomerID = C.CustomerID
    JOIN 
        Person.Person AS P ON C.PersonID = P.BusinessEntityID
    GROUP BY 
        P.FirstName, P.LastName
    HAVING 
        COUNT(SOH.SalesOrderID) > 3;
    ```
Here's the continuation of the SQL queries for tasks 23 to 42:

---

## List of SQL Queries (continued)

23. **List of customers' contact names who have never placed an order:**
    ```sql
    SELECT 
        P.FirstName + ' ' + P.LastName AS ContactName
    FROM 
        Sales.Customer AS C
    JOIN 
        Person.Person AS P ON C.PersonID = P.BusinessEntityID
    LEFT JOIN 
        Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
    WHERE 
        SOH.SalesOrderID IS NULL;
    ```

24. **List of customers with no contact name:**
    ```sql
    SELECT 
        C.*
    FROM 
        Sales.Customer AS C
    LEFT JOIN 
        Person.Person AS P ON C.PersonID = P.BusinessEntityID
    WHERE 
        P.BusinessEntityID IS NULL;
    ```

25. **List of all cities and the number of customers in each city:**
    ```sql
    SELECT 
        A.City,
        COUNT(C.CustomerID) AS NumberOfCustomers
    FROM 
        Sales.Customer AS C
    JOIN 
        Person.BusinessEntityAddress AS BEA ON C.CustomerID = BEA.BusinessEntityID
    JOIN 
        Person.Address AS A ON BEA.AddressID = A.AddressID
    GROUP BY 
        A.City
    ORDER BY 
        NumberOfCustomers DESC;
    ```

26. **List of customers who live in same city as a store:**
    ```sql
    SELECT 
        DISTINCT C.*
    FROM 
        Sales.Customer AS C
    JOIN 
        Person.BusinessEntityAddress AS BEA ON C.CustomerID = BEA.BusinessEntityID
    JOIN 
        Person.Address AS A ON BEA.AddressID = A.AddressID
    JOIN 
        Sales.Store AS S ON A.City = S.City;
    ```

27. **List of cities and number of stores in each city:**
    ```sql
    SELECT 
        City,
        COUNT(*) AS NumberOfStores
    FROM 
        Sales.Store
    GROUP BY 
        City
    ORDER BY 
        NumberOfStores DESC;
    ```

28. **List of orders placed by customers living in cities with more than 2 stores:**
    ```sql
    SELECT 
        soh.*
    FROM 
        Sales.SalesOrderHeader AS soh
    JOIN 
        Sales.Customer AS c ON soh.CustomerID = c.CustomerID
    JOIN 
        Person.BusinessEntityAddress AS bea ON c.CustomerID = bea.BusinessEntityID
    JOIN 
        Person.Address AS a ON bea.AddressID = a.AddressID
    WHERE 
        a.City IN (
            SELECT 
                City
            FROM 
                Sales.Store
            GROUP BY 
                City
            HAVING 
                COUNT(*) > 2
        );
    ```

29. **List of customers who live in the same state as a store:**
    ```sql
    SELECT 
        DISTINCT C.*
    FROM 
        Sales.Customer AS C
    JOIN 
        Person.BusinessEntityAddress AS BEA ON C.CustomerID = BEA.BusinessEntityID
    JOIN 
        Person.Address AS A ON BEA.AddressID = A.AddressID
    JOIN 
        Sales.Store AS S ON A.StateProvinceID = S.StateProvinceID;
    ```

30. **List of states and number of stores in each state:**
    ```sql
    SELECT 
        SP.Name AS StateProvince,
        COUNT(*) AS NumberOfStores
    FROM 
        Sales.Store AS S
    JOIN 
        Person.StateProvince AS SP ON S.StateProvinceID = SP.StateProvinceID
    GROUP BY 
        SP.Name
    ORDER BY 
        NumberOfStores DESC;
    ```

31. **List of orders placed by customers living in states with more than 5 stores:**
    ```sql
    SELECT 
        soh.*
    FROM 
        Sales.SalesOrderHeader AS soh
    JOIN 
        Sales.Customer AS c ON soh.CustomerID = c.CustomerID
    JOIN 
        Person.BusinessEntityAddress AS bea ON c.CustomerID = bea.BusinessEntityID
    JOIN 
        Person.Address AS a ON bea.AddressID = a.AddressID
    WHERE 
        a.StateProvinceID IN (
            SELECT 
                S.StateProvinceID
            FROM 
                Sales.Store AS S
            GROUP BY 
                S.StateProvinceID
            HAVING 
                COUNT(*) > 5
        );
    ```

32. **List of products and the number of times they have been ordered:**
    ```sql
    SELECT 
        P.Name AS ProductName,
        COUNT(SOD.SalesOrderID) AS NumberOfOrders
    FROM 
        Sales.SalesOrderDetail AS SOD
    JOIN 
        Production.Product AS P ON SOD.ProductID = P.ProductID
    GROUP BY 
        P.Name
    ORDER BY 
        NumberOfOrders DESC;
    ```

33. **List of products and the total quantity ordered:**
    ```sql
    SELECT 
        P.Name AS ProductName,
        SUM(SOD.OrderQty) AS TotalQuantityOrdered
    FROM 
        Sales.SalesOrderDetail AS SOD
    JOIN 
        Production.Product AS P ON SOD.ProductID = P.ProductID
    GROUP BY 
        P.Name
    ORDER BY 
        TotalQuantityOrdered DESC;
    ```

34. **List of products ordered more than 1000 times:**
    ```sql
    SELECT 
        P.Name AS ProductName,
        COUNT(SOD.SalesOrderID) AS NumberOfOrders
    FROM 
        Sales.SalesOrderDetail AS SOD
    JOIN 
        Production.Product AS P ON SOD.ProductID = P.ProductID
    GROUP BY 
        P.Name
    HAVING 
        COUNT(SOD.SalesOrderID) > 1000
    ORDER BY 
        NumberOfOrders DESC;
    ```

35. **List of products ordered less than 10 times:**
    ```sql
    SELECT 
        P.Name AS ProductName,
        COUNT(SOD.SalesOrderID) AS NumberOfOrders
    FROM 
        Sales.SalesOrderDetail AS SOD
    JOIN 
        Production.Product AS P ON SOD.ProductID = P.ProductID
    GROUP BY 
        P.Name
    HAVING 
        COUNT(SOD.SalesOrderID) < 10
    ORDER BY 
        NumberOfOrders ASC;
    ```

36. **List of stores and the total sales amount for each store:**
    ```sql
    SELECT 
        S.Name AS StoreName,
        SUM(SOH.TotalDue) AS TotalSalesAmount
    FROM 
        Sales.SalesOrderHeader AS SOH
    JOIN 
        Sales.Store AS S ON SOH.ShipToAddressID = S.BusinessEntityID
    GROUP BY 
        S.Name
    ORDER BY 
        TotalSalesAmount DESC;
    ```

37. **List of stores with total sales amount greater than 500000:**
    ```sql
    SELECT 
        S.Name AS StoreName,
        SUM(SOH.TotalDue) AS TotalSalesAmount
    FROM 
        Sales.SalesOrderHeader AS SOH
    JOIN 
        Sales.Store AS S ON SOH.ShipToAddressID = S.BusinessEntityID
    GROUP BY 
        S.Name
    HAVING 
        SUM(SOH.TotalDue) > 500000
    ORDER BY 
        TotalSalesAmount DESC;
    ```

38. **List of stores and the number of orders for each store:**
    ```sql
    SELECT 
        S.Name AS StoreName,
        COUNT(SOH.SalesOrderID) AS NumberOfOrders
    FROM 
        Sales.SalesOrderHeader AS SOH
    JOIN 
        Sales.Store AS S ON SOH.ShipToAddressID = S.BusinessEntityID
    GROUP BY 
        S.Name
    ORDER BY 
        NumberOfOrders DESC;
    ```

39. **List of stores with more than 200 orders:**
    ```sql
    SELECT 
        S.Name AS StoreName,
        COUNT(SOH.SalesOrderID) AS NumberOfOrders
    FROM 
        Sales.SalesOrderHeader AS SOH
    JOIN 
        Sales.Store AS S ON SOH.ShipToAddressID = S.BusinessEntityID
    GROUP BY 
        S.Name
    HAVING 
        COUNT(SOH.SalesOrderID) > 200
    ORDER BY 
        NumberOfOrders DESC;
    ```

40. **List of salespersons and the total sales amount for each salesperson:**
    ```sql
    SELECT 
        SP.FirstName + ' ' + SP.LastName AS SalesPersonName,
        SUM(SOH.TotalDue) AS TotalSalesAmount
    FROM 
        Sales.SalesOrderHeader AS SOH
    JOIN 
        Sales.SalesPerson AS S ON SOH.SalesPersonID = S.BusinessEntityID
    JOIN 
        Person.Person AS SP ON S.BusinessEntityID = SP.BusinessEntityID
    GROUP BY 
        SP.FirstName, SP.LastName
    ORDER BY 
        TotalSalesAmount DESC;
    ```

41. **List of salespersons with total sales amount greater than 1000000:**
    ```sql
    SELECT 
        SP.FirstName + ' ' + SP.LastName AS SalesPersonName,
        SUM(SOH.TotalDue) AS TotalSalesAmount
    FROM 
        Sales.SalesOrderHeader AS SOH
    JOIN 
        Sales.SalesPerson AS S ON SOH.SalesPersonID = S.BusinessEntityID
    JOIN 
        Person.Person AS SP ON S.BusinessEntityID = SP.BusinessEntityID
    GROUP BY 
        SP.FirstName, SP.LastName
    HAVING 
        SUM(SOH.TotalDue) > 100

0000
    ORDER BY 
        TotalSalesAmount DESC;
    ```

42. **List of salespersons and the number of orders for each salesperson:**
    ```sql
    SELECT 
        SP.FirstName + ' ' + SP.LastName AS SalesPersonName,
        COUNT(SOH.SalesOrderID) AS NumberOfOrders
    FROM 
        Sales.SalesOrderHeader AS SOH
    JOIN 
        Sales.SalesPerson AS S ON SOH.SalesPersonID = S.BusinessEntityID
    JOIN 
        Person.Person AS SP ON S.BusinessEntityID = SP.BusinessEntityID
    GROUP BY 
        SP.FirstName, SP.LastName
    ORDER BY 
        NumberOfOrders DESC;
    ```

---
