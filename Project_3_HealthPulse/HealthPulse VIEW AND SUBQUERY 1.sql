CREATE VIEW V_high_value_insurance_transactions AS
SELECT 
FullName, 
VisitDate, 
Department, 
Insurance_Provider, 
Cost_USD
FROM Patients
JOIN Visits
ON Patients.PatientID = Visits.PatientID
JOIN Billing
ON Visits.VisitID = Billing.VisitID
WHERE Insurance_Provider <> 'Cash'



SELECT * 
FROM V_high_value_insurance_transactions
WHERE Cost_USD > (SELECT AVG(Cost_USD) FROM V_high_value_insurance_transactions) 

