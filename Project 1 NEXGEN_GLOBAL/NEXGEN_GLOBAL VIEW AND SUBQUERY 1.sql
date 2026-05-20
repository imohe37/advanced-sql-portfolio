--Objective 3: The Sales Performance Dashboard

CREATE VIEW v_MasterSales AS
SELECT 
    SO.OrderID,
    SO.Customer_Location,
    SO.Amount_Paid_NGN,
    SO.Sale_Date,
    PC.ProductName,
    PC.Category
FROM Sales_Orders AS SO
INNER JOIN Product_Catalog AS PC 
ON SO.ProductID = PC.ProductID

--Your Next Challenge: The Subquery Audit
--Now, using that fresh view (v_MasterSales), you need to write a query that finds all orders where the amount paid is higher than the average order value across the entire company.

SELECT *
FROM v_MasterSales
WHERE Amount_Paid_NGN > (SELECT AVG(Amount_Paid_NGN) FROM v_MasterSales)
ORDER BY Amount_Paid_NGN DESC