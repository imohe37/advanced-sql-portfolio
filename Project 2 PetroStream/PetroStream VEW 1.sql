CREATE VIEW v_RepairCostAboveAVG AS
SELECT 
    Maintenance.WellID,
    Region,
    IssueDate,
    RepairCost_USD
FROM Maintenance
JOIN Wells
ON Maintenance.WellID = Wells.WellID

SELECT *
FROM v_RepairCostAboveAVG 
WHERE RepairCost_USD > (SELECT AVG(RepairCost_USD) FROM v_RepairCostAboveAVG)
ORDER BY RepairCost_USD DESC
