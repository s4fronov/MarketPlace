IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.Product_Add') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.Product_Add
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Product_Add]	
	    @id                      BIGINT = NULL,
		@categoryId              TINYINT = NULL,
        @name                    NVARCHAR(30), 
		@manufacturer            NVARCHAR(30),  
		@price                   MONEY,
		@width                   DECIMAL = NULL, 
		@height                  DECIMAL = NULL,
		@length                  DECIMAL = NULL, 
		@weight                  DECIMAL = NULL,
		@prodYear                SMALLINT,
		@warranty                SMALLINT = NULL,
		@volume      			 DECIMAL = NULL,
		@power             		 DECIMAL = NULL,
		@maxTemperature          DECIMAL = NULL,
		@batteryCapacity         DECIMAL = NULL,
		@memorySize              DECIMAL = NULL,
		@screenDiagonal          DECIMAL = NULL,
		@screenResolutionWidth   SMALLINT = NULL,
		@screenResolutionHeight  SMALLINT = NULL,
		@numberOfModes           TINYINT = NULL,
		@hdmi            		 BIT = NULL,
		@jack             		 BIT = NULL,
		@miniJack       		 BIT = NULL,
		@lte       				 BIT = NULL,
		@tabletMode              BIT = NULL,
		@diskDrivePresence       BIT = NULL,
		@smartHomeFunction       BIT = NULL,    
		@steamGeneratorFunction  BIT = NULL,
		@wetCleaningFunction     BIT = NULL,		
		@quickDefrostFunction    BIT = NULL,
		@cameraFunction          BIT = NULL,
		@tvFunction              BIT = NULL,
		@grillFunction           BIT = NULL
	as
	begin
        INSERT INTO [dbo].[Product]
			(
    [Name],
    Manufacturer,
	Price,
	Width,
	Height,
	[Length],
	[Weight],
	ProdYear,
	Warranty,
	Volume,
	[Power],
	MaxTemperature,
	BatteryCapacity,
	MemorySize,
	ScreenDiagonal,
	ScreenResolutionWidth,
	ScreenResolutionHeight,
	NumberOfModes,
	HDMI,
	Jack,
	MiniJack,
	LTE,
	TabletMode,
	DiskDrivePresence,
	SmartHomeFunction,
	SteamGeneratorFunction,
	WetCleaningFunction,
	QuickDefrostFunction,
	CameraFunction,
	TvFunction,
	GrillFunction
	)
		VALUES
			(
		@name, 
		@manufacturer,
		@price,
		@width,
		@height,
		@length,
		@weight,
		@prodYear,
		@warranty,
		@volume,
		@power,
		@maxTemperature,
		@batteryCapacity,
		@memorySize,
		@screenDiagonal,
		@screenResolutionWidth,
		@screenResolutionHeight,
		@numberOfModes,
		@hdmi,
		@jack,
		@miniJack,
		@lte,
		@tabletMode,
		@diskDrivePresence,
		@smartHomeFunction,    
		@steamGeneratorFunction,
		@wetCleaningFunction,		
		@quickDefrostFunction,
		@cameraFunction,
		@tvFunction,
		@grillFunction
		);
        SET @id = CAST(SCOPE_IDENTITY() AS [INT])
		EXEC Product_GetById @id		
    end;
go

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.Product_GetByCategoryId') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.Product_GetByCategoryId
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE Product_GetByCategoryId
	@categoryId TINYINT
AS
BEGIN
	IF @categoryId = 1
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.Volume,
			 b.[Power],
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.QuickDefrostFunction				 
		FROM Refrigerator b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
ELSE IF @categoryId = 2
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.Volume,
			 b.[Power],
			 b.MaxTemperature,
			 b.NumberOfModes			 
		FROM Stove b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;	
ELSE IF @categoryId = 3
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.Volume,
			 b.[Power],
			 b.MaxTemperature,
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.GrillFunction			 
		FROM Oven b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
ELSE IF @categoryId = 4
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,				 
			 b.Volume,
			 b.[Power],
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.GrillFunction			 
		FROM Microwave b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;	
ELSE IF @categoryId = 5
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.MaxTemperature,
			 b.NumberOfModes,
			 b.SmartHomeFunction			 
		FROM Multicooker b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
ELSE IF @categoryId = 6
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.SmartHomeFunction			 
		FROM Teapot b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 7
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.MaxTemperature,			 
			 b.NumberOfModes,			 
			 b.SteamGeneratorFunction			 
		FROM Iron b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 8
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.NumberOfModes,
			 b.WetCleaningFunction			 
		FROM VacuumCleaner b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 9
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.BatteryCapacity,
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.WetCleaningFunction			 
		FROM RobotVacuumCleaner b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 10
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.[Power],
			 b.MaxTemperature,
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.SteamGeneratorFunction			 
		FROM AirConditioning b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 11
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.[Power],
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.HDMI,
			 b.MiniJack,
			 b.SmartHomeFunction,
			 b.CameraFunction,
			 b.TvFunction			 
		FROM Television b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 12
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.[Power],
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.HDMI,
			 b.MiniJack,
			 b.CameraFunction,
			 b.TvFunction			 
		FROM Monitor b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 13
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.[Power],
			 b.BatteryCapacity,
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.HDMI,
			 b.MiniJack,
			 b.TabletMode,
			 b.DiskDrivePresence,
			 b.CameraFunction			 
		FROM Notebook b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 14
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.[Power],
			 b.MemorySize,
			 b.NumberOfModes,
			 b.Jack,
			 b.MiniJack,
			 b.DiskDrivePresence,
			 b.SmartHomeFunction				 
		FROM AudioSystem b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 15
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.BatteryCapacity,
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.MiniJack,
			 b.LTE,
			 b.CameraFunction				 
		FROM Smartphone b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 16
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.BatteryCapacity,
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.MiniJack,
			 b.LTE,
			 b.TabletMode,
			 b.CameraFunction				 
		FROM Tablet b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
	ELSE IF @categoryId = 17
	BEGIN
		SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.BatteryCapacity,
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.NumberOfModes,
			 b.HDMI,
			 b.SmartHomeFunction,
			 b.CameraFunction	 
		FROM Camera b
		JOIN Product a ON a.Id = b.ProductId
		ORDER BY [Name] 
	END;
END;
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.Product_GetAll') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.Product_GetAll
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE Product_GetAll
AS
BEGIN
	SELECT
		a.[Name],
	    a.Manufacturer,
		a.Price,
		a.Width,
		a.Height,
		a.[Length],
		a.[Weight],
		a.ProdYear,
		a.Warranty
		FROM dbo.Product a
		ORDER BY [Name] 
END;
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.Product_GetById') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.Product_GetById
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Product_GetById]
	@id BIGINT
AS
BEGIN		
    IF (SELECT COUNT_BIG(*) ProductId FROM Refrigerator WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.Volume,
			 b.[Power],
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.QuickDefrostFunction					 
			FROM Refrigerator b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Stove WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.Volume,
			 b.[Power],
			 b.MaxTemperature,
			 b.NumberOfModes				 
			FROM Stove b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Oven WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.Volume,
			 b.[Power],
			 b.MaxTemperature,
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.GrillFunction					 
			FROM Oven b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Microwave WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,				 
			 b.Volume,
			 b.[Power],
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.GrillFunction					 
			FROM Microwave b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Multicooker WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.MaxTemperature,
			 b.NumberOfModes,
			 b.SmartHomeFunction				 
			FROM Multicooker b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Teapot WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.SmartHomeFunction					 
			FROM Teapot b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Iron WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.MaxTemperature,			 
			 b.NumberOfModes,			 
			 b.SteamGeneratorFunction					 
			FROM Iron b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM VacuumCleaner WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.NumberOfModes,
			 b.WetCleaningFunction						 
			FROM VacuumCleaner b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM RobotVacuumCleaner WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.Volume,
			 b.[Power],
			 b.BatteryCapacity,
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.WetCleaningFunction				 
			FROM RobotVacuumCleaner b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM AirConditioning WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.[Power],
			 b.MaxTemperature,
			 b.NumberOfModes,
			 b.SmartHomeFunction,
			 b.SteamGeneratorFunction					 
			FROM AirConditioning b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Television WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.[Power],
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.HDMI,
			 b.MiniJack,
			 b.SmartHomeFunction,
			 b.CameraFunction,
			 b.TvFunction					 
			FROM Television b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Monitor WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.[Power],
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.HDMI,
			 b.MiniJack,
			 b.CameraFunction,
			 b.TvFunction				 
			FROM Monitor b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Notebook WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.[Power],
			 b.BatteryCapacity,
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.HDMI,
			 b.MiniJack,
			 b.TabletMode,
			 b.DiskDrivePresence,
			 b.CameraFunction					 
			FROM Notebook b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM AudioSystem WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,					 
			 b.[Power],
			 b.MemorySize,
			 b.NumberOfModes,
			 b.Jack,
			 b.MiniJack,
			 b.DiskDrivePresence,
			 b.SmartHomeFunction				 
			FROM AudioSystem b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Smartphone WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.BatteryCapacity,
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.MiniJack,
			 b.LTE,
			 b.CameraFunction					 
			FROM Smartphone b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Tablet WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.BatteryCapacity,
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.MiniJack,
			 b.LTE,
			 b.TabletMode,
			 b.CameraFunction				 
			FROM Tablet b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
	IF (SELECT COUNT_BIG(*) ProductId FROM Camera WHERE ProductId = @id) > 0
		BEGIN
			SELECT 			     
		  	 a.[Id],
			 a.[Name],
			 a.Manufacturer,
			 a.Price,
			 a.Width,
			 a.Height,
			 a.[Length],
			 a.[Weight],
			 a.ProdYear,
			 a.Warranty,
			 b.BatteryCapacity,
			 b.MemorySize,
			 b.ScreenDiagonal,
			 b.ScreenResolutionWidth,
			 b.ScreenResolutionHeight,
			 b.NumberOfModes,
			 b.HDMI,
			 b.SmartHomeFunction,
			 b.CameraFunction					 
			FROM Camera b
			JOIN Product a ON a.Id = b.ProductId		
			WHERE a.Id = @id						
		END;
END;
GO

insert into [dbo].[DbVersion] 
	([Created], [DbVersion]) 
values
	(SYSDATETIME(), '1.1')
go