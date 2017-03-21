

INSERT INTO marketing_list(id, salary) VALUES
('1000','100253'),
('1001','125489'),
('1002','133658'),
('1003','145365'),
('1004','112523'),
('1005','125855'),
('1006','145666'),
('1007','126589'),
('1008','112254'),
('1009','132665');


CREATE FUNCTION Function2(@FirstLetter char(1))
RETURNS TABLE
AS
RETURN SELECT * FROM Student
WHERE LEFT(First_Name,1) = @FirstLetter


CREATE TABLE Employees




--Exercise 2A
CREATE TABLE Employee(
id int PRIMARY KEY,
FName varchar (50),
LName varchar (50),
)

INSERT INTO Employee (id,FName,LName)
VALUES(2356,'John','Brown'),
	  (2554, 'James','Bell'),
	  (2365,'Kim','Powell')

CREATE TABLE Campaign_Offer(

offer_id int IDENTITY(1,1) PRIMARY KEY,
offer_date date,
customer_id varchar (10),
offer_value money,
product_name varchar(100),
acceptance_status varchar (5),
Employee_ID int
CONSTRAINT fk_Campaign_Offer_marketing_list1 FOREIGN KEY(id) REFERENCES marketing_list1(Id),
CONSTRAINT fk_Campaign_Offer_Employee FOREIGN KEY(Employee_ID) REFERENCES Employee(id),
CONSTRAINT acceptance_status check (acceptance_status in ('Yes','No'))
)

INSERT INTO Campaign_Offer(offer_date, customer_id,offer_value, product_name, acceptance_status,Employee_ID)
values('2015-01-04','6474684686',44500,'Notepad','No',4983),
	  ('2015-01-21','7759385383', 1500,'Phone Case', 'Yes',5686),
	  ('2015-03-15','4559759754', 468, 'Toothbrush','No',6484),
	  ('2016-04-03','3494646431', 4754,'Notepad','No',3727),
	  ('2016-04-18','5656565565', 2475646,'Keyboard','Yes',3727) ;
	   
--Exercise 2B
CREATE FUNCTION Commission(@offer_value money)
RETURNS money
BEGIN
	DECLARE @Commission money
	SET @Commission=(0.1*@offer_value)
	RETURN @Commission;
END

SELECT dbo.Commission(4000) AS "Commission Earned";
SELECT productname, dbo.Commission(Campaign_Offer. offer_value) AS "Commission Earned" FROM Campaign_Offer;

--Exercise 2C
CREATE FUNCTION Com()
RETURNS table
AS
RETURN SELECT Campaign_Offer.ID, SUM(Campaign_Offer.offer_value * 0.1) AS "Total Commission Earned" FROM Campaign_Offer
WHERE Campaign_Offer.acceptance_status='Yes'
GROUP BY Campaign_Offer.ID

SELECT * FROM dbo.Com()

--Exercise 2D
SELECT * FROM dbo.Com() as Commission
INNER JOIN Employee
ON Commission.id = Employee.id

SELECT * FROM Employee
SELECT * FROM Campaign_Offer

--Exercise 2E
CREATE FUNCTION TabCommissionDate(@StartDate date, @EndDate date)
Returns table
As
Return
(
	SELECT Campaign_Offer.Employee_ID, dbo.Commission(m.Offer_value) AS Commission FROM Campaign_Offer 
	WHERE Offer_date BETWEEN @StartDate AND @EndDate
	GROUP BY Campaign_Offer.Employee_ID, dbo.Commission(Campaign_Offer.Offer_value)
) 
SELECT * FROM dbo.TaCommissionDate('2015/09/08', '2016/09/19') as Commission
INNER JOIN Employee
ON Commission.id = Employee.id
SELECT * FROM Campaign_Offer
SELECT * FROM Employee

--Exercise 2F
CREATE FUNCTION Leap2(@customer_id varchar (10))
RETURNS varchar(100)
AS
BEGIN
DECLARE @DATEOB date
DECLARE @val varchar (100)
SELECT @DATEOB=DOB FROM marketing_list1  WHERE @customer_id=ID
SET @val=(CASE WHEN(YEAR(@DATEOB)%4=0 AND YEAR (@DATEOB)% 100<>0) OR YEAR(@DATEOB)%400=0
	THEN 'Customer Born in Leap Year'
	ELSE ' Customer Not Born in Leap Year'
END)
RETURN @val
END
GO

SELECT dbo.Leap2('324356') AS 'Message'
