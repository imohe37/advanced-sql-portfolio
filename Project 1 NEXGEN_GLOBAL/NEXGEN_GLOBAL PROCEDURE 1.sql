--The Business Problem: The Currency & Freight Nightmare
--Nexus-Global buys its inventory from Chinese suppliers in Chinese Yuan (CNY), but sells them locally in Nigeria in Naira (NGN).

CREATE PROCEDURE sp_CalculateProductLandingCost
@TargetProductID VARCHAR(10),
@ExchangeRate DECIMAL(10,2)
AS
SELECT 
    ProductID,
    ProductName,
    (Unit_Cost_CNY * @ExchangeRate) AS Base_Cost_NGN,
    ((Length_CM * Width_CM * Height_CM / 1000000) * 250000) AS Freight_Cost_NGN,
    ((Unit_Cost_CNY * @ExchangeRate) + ((Length_CM * Width_CM * Height_CM / 1000000) * 250000)) AS Total_Landing_Cost_NGN
FROM Product_Catalog
WHERE ProductID = @TargetProductID


EXEC sp_CalculateProductLandingCost @TargetProductID = PC002, @ExchangeRate = 210

EXEC sp_CalculateProductLandingCost @TargetProductID = PC029, @ExchangeRate = 210