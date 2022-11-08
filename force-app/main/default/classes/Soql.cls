public class Soql {

}
//Sampletry Select AccountID , Count(Email)  from Contact where email like '%gmail%' Group by AccountId having Count(Email)>2
//SELECT Industry, CreatedDate, LastModifiedById FROM  Account --01
//SELECT Id, NumberOfEmployees, AnnualRevenue From Account WHERE NumberOfEmployees>50 AND AnnualRevenue <100000 --02
//SELECT Name, AccountId, Title FROM Contact WHERE (Title='CEO' OR Title='VP') AND AccountId!=null --03
//SELECT ID, Birthdate FROM Contact WHERE CALENDAR_YEAR(Birthdate) =2000 AND CALENDAR_MONTH(Birthdate) !=5 --04
//SELECT Id FROM CONTACT WHERE Account.NumberOfEmployees > 75 and Account.Industry = 'Finance' AND Account.AnnualRevenue<90000 AND Title = 'Sales Manager' --05
//Select Name , ID from Contact where (Email like '%@outlook.com' AND Account.Industry = 'Government' ) --06
//Select Name , ID from Contact where (Title like '%Sales%' OR (Title ='CEO' AND (Account.Industry = 'Technology' OR Account.Industry = 'Finance'))) --07
//Select Name , Account.Description from Contact where Email like '%5%' --08
//SELECT count(id), min(BirthDate), AccountId FROM Contact GROUP BY AccountId --09
//SELECT SUM(AMOUNT) total FROM Opportunity WHERE StageName != null --10
//SELECT AccountId, SUM(AMOUNT) total FROM Opportunity WHERE StageName != null GROUP BY AccountId --11
//SELECT CALENDAR_MONTH(CreatedDate) month, COUNT(ID) Total FROM Account WHERE CreatedDate = LAST_N_MONTHS:12 GROUP BY CALENDAR_MONTH(CreatedDate) Order BY CALENDAR_MONTH(CreatedDate) --12
//SELECT AccountId, count(Email) FROM Contact WHERE Email Like '%@gmail.com'  AND AccountId !=null group by AccountId having COUNT(Email)>2 --13
//SELECT MIN(BirthDate), MAX(Birthdate) FROM Contact GROUP BY AccountId --14