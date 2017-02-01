CREATE DATABASE AD_LAB_1403095;
Use AD_LAB_1403095;

CREATE TABLE Marketing_list
(
	ID int NOT NULL PRIMARY KEY,
	Name VARCHAR(255),
	Dob DATE,
	Gender CHAR(1),
	Parish VARCHAR(255),
	Mobile INT,
	Provider VARCHAR(255),
);

INSERT INTO Marketing_List ( ID, Name, Dob, Gender, Parish, Mobile, Provider) VALUES
('1000', 'John', '1994-08-27', 'M', 'Kingston', '3214568', 'Digicel'),
('1001', 'Richard', '1995-08-27', 'M', 'St James', '5214521', 'Digicel'),
('1002', 'Jane', '1994-09-25', 'F', 'St Thomas', '6542154', 'FLOW'),
('1003', 'Hugh', '1994-07-17', 'M', 'St Ann', '3251456', 'Digicel'),
('1004', 'Kim', '1995-08-7', 'F', 'St Andrews', '2985452', 'Digicel'),
('1005', 'Hellen', '1991-05-2', 'F', 'Trelawny', '3314525', 'FLOW'),
('1006', 'Jack', '1974-08-23', 'M', 'Kingston', '4269854', 'Digicel'),
('1007', 'Ashley', '1985-03-25', 'F', 'Kingston', '4295648', 'Digicel'),
('1008', 'Shanice', '1944-09-26', 'F', 'Kingston', '9632255', 'FLOW'),
('1009', 'Joan', '1999-01-27', 'F', 'Kingston', '9285548', 'FLOW');


-- 1
SELECT Provider, COUNT (*) AS No_of_Cust
FROM Marketing_list
GROUP BY Provider

-- 2
SELECT COUNT(Parish) AS Males_In_StMary
FROM Marketing_list
WHERE Parish='ST. Mary' AND Gender='M';

-- 3
DELETE FROM Marketing_list
WHERE Parish='ST. Mary' and Gender='M';

-- 4
SELECT *
FROM Marketing_list
WHERE Gender='M';


-- Ex2 A
GO
CREATE PROCEDURE sp_exmp_1
AS
BEGIN
	SELECT Provider, COUNT(*) AS No_of_Cust FROM Marketing_list
	GROUP BY Provider

	SELECT COUNT(Parish) AS No_of_Male_in_ST_Mary FROM Marketing_list
	WHERE Parish='ST. Mary' AND Gender='M';

	DELETE FROM Marketing_list
	WHERE Parish='ST. Mary' AND Gender='M';

	SELECT * FROM Marketing_list
	WHERE Gender='M';
END

-- Ex2 B
GO 

CREATE PROCEDURE sp_exmp_2
AS 
BEGIN

	SELECT COUNT(*) AS No_of_F_Cust FROM Marketing_list
	WHERE Gender='F';

	SELECT COUNT(*) AS No_of_M_Cust FROM Marketing_list
	WHERE Gender='M';

	SELECT Parish, COUNT(*) AS No_of_Cust FROM Marketing_list
	GROUP BY Parish;

	DELETE FROM Marketing_list 
	WHERE Dob < '1951-01-01';

END

Execute sp_exmp_1;
Execute sp_exmp_2;