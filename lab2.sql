Use AD_LAB_1403095;

GO

CREATE PROCEDURE insert_records
(
	@ID INT,
	@Name VARCHAR(255),
	@Dob DATE,
	@Gender CHAR(1),
	@Parish VARCHAR(255),
	@Mobile INT,
	@Provider VARCHAR(255),
)
AS
BEGIN
	
	INSERT INTO Marketing_list(ID,Name,Dob,Gender,Parish,Mobile,Provider) 
	VALUES(@ID,@Name,@Dob,@Gender,@Parish,@Mobile,@Provider)
END


CREATE PROCEDURE find_record
(
	@ID INT
)
AS 
BEGIN
	SELECT * FROM Marketing_list
		WHERE ID = @ID;
END


CREATE PROCEDURE update_record
(
	@ID INT,
	@Name VARCHAR(255)
)
AS 
BEGIN
	UPDATE Marketing_list SET Name = @Name
	WHERE ID = @ID
END
