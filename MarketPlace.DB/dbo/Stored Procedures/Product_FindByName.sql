CREATE PROCEDURE [dbo].[Product_FindByName]
	@name BIGINT
AS
BEGIN
	SELECT * FROM dbo.Product WHERE [Name] = @name 
END;