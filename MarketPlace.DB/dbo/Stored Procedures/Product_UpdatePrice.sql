CREATE PROCEDURE [dbo].[Product_UpdatePrice]
	@id    INT,
	@price MONEY
AS
BEGIN
	UPDATE dbo.Product
	SET Price = @price
	WHERE Id = @id
	EXEC Product_GetById @id
END;