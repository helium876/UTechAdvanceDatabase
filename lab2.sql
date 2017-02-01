Use AD_LAB_1403095;


GO 

CREATE PROCEDURE sp_exmp_1
AS
BEGIN

	SELECT Provider, Count (*) AS Num_of_Cust
	FROM Marketing_list
	GROUP BY Provider

	SELECT Count(Parish) AS Num_Males_StMary
	FROM Marketing_list
	WHERE Parish='ST. Mary' AND Gender='M';

	DELETE FROM Marketing_list
	WHERE Parish='ST. Mary' AND Gender='M';


	SELECT * FROM Marketing_list
	WHERE Gender='M';

END




GO 

CREATE PROCEDURE sp_exmp_2
AS
BEGIN

	SELECT COUNT(*) AS Num_of_Female_Cust FROM Marketing_list
	WHERE Gender='F';

	SELECT COUNT(*) AS Num_of_Male_Cust FROM Marketing_list
	WHERE Gender='M';

	SELECT Parish, COUNT(*) AS Num_of_Cust FROM Marketing_list
	GROUP BY Parish;

	DELETE FROM Marketing_list 
	WHERE Dob < '1951-01-01';

END

Execute sp_exmp_1;
Execute sp_exmp_2P;