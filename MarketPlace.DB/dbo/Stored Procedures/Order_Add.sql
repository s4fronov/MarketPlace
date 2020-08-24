CREATE PROCEDURE [dbo].[Order_Add]
	@firstName       NVARCHAR(15),
	@lastName        NVARCHAR(15),
	@patronymic 	 NVARCHAR(15) = NULL,
	@email           NVARCHAR(30),
	@phone           NVARCHAR(15),
	@cityId 		 INT,
	@address         NVARCHAR(30)
AS
BEGIN	
	INSERT INTO dbo.[Order]
		(
		 FirstName, 
		 LastName,
		 Patronymic,
		 Email,
		 Phone,
		 CityId,  
		 [Address],
		 TotalAmount,
		 OrderDate,
		 DeliveryDate,
		 IsDelivered
		 )
	VALUES
		(
		 @firstName,
		 @lastName,
		 @patronymic,
		 @email,
		 @phone,
		 @cityId,
		 @address,
		 0,
		 SYSDATETIME(),
		 GETDATE() + 7,
		 DEFAULT
		 )
	SELECT SCOPE_IDENTITY()
END;