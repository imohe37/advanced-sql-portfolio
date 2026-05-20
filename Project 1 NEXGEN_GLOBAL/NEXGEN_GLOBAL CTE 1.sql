--Your First Challenge: The CBM Volume Report
--You are going to write a query using a CTE (Common Table Expression) to isolate this math before displaying the final results.

WITH ProductVolume_CTE AS (
    SELECT ProductID, ProductName, Category, (Length_CM*Width_CM*Height_CM/1000000) AS Volume_CBM
    FROM Product_Catalog AS PC
)
SELECT * FROM ProductVolume_CTE
ORDER BY Volume_CBM DESC