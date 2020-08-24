CREATE PROCEDURE [dbo].[AddProductInOrder]
	@orderId   BIGINT,
	@productId BIGINT,
	@quantity  TINYINT
AS
BEGIN
	DECLARE @amount MONEY = ((SELECT Price FROM dbo.Product WHERE Id = @productId) * @quantity)

	UPDATE dbo.[Order]
	SET TotalAmount = TotalAmount + @amount
	WHERE Id = @orderId;

	INSERT INTO dbo.Order_Product
		(OrderId,
		 ProductId,
		 Quantity,
		 Amount)
	VALUES
		(@orderId,
		 @productId,
		 @quantity,
		 @amount)
	DECLARE @id BIGINT = CAST(SCOPE_IDENTITY() AS [BIGINT])   	
END;