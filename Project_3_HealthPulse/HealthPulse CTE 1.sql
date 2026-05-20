WITH CTE_Total_Visits_Above_AGE40 AS (
SELECT Patients.PatientID, FullName, Age, COUNT(VisitID) AS Total_Visits
FROM Patients
JOIN Visits
ON Patients.PatientID = Visits.PatientID
WHERE Age > 40
GROUP BY Patients.PatientID, FullName, Age
)

SELECT *
FROM CTE_Total_Visits_Above_AGE40
ORDER BY Total_Visits DESC