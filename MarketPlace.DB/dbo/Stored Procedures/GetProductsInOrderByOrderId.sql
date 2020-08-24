CREATE PROCEDURE [dbo].[GetProductsInOrderByOrderId]
	@orderId BIGINT
AS
BEGIN
	SELECT 
		 o.Id,
		 o.FirstName,
		 o.LastName,
		 o.Patronymic,
		 o.Email,
		 o.Phone,
		 o.CityId,
		 o.[Address],
		 o.TotalAmount,
		 o.OrderDate,
		 o.DeliveryDate,
		 o.IsDelivered,
		 op.ProductId,	
		 op.Quantity,
		 op.Amount,	
		 p.[Name],
		 p.Price
	FROM dbo.[Order] o
	LEFT JOIN Order_Product op ON op.OrderId = o.Id
	LEFT JOIN Product p ON p.Id = op.ProductId 
	WHERE o.Id = @orderId 
END;