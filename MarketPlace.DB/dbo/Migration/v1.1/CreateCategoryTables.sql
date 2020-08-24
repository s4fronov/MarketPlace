DECLARE @currentDBVersion NVARCHAR(10);
SET @currentDBVersion = (SELECT TOP(1) DBVersion FROM [dbo].[DBVersion] ORDER BY Created DESC)

IF @currentDBVersion < '1.1'

CREATE TABLE dbo.Category                            
([Id]    TINYINT PRIMARY KEY NOT NULL,
[Name]   NVARCHAR(25) UNIQUE NOT NULL)
GO
	 
INSERT INTO Category (Id, [Name])
    VALUES
		(1, 'Refrigerator'),
		(2, 'Stove'),
		(3, 'Oven'),
		(4, 'Microwave'),
		(5, 'Multicooker'),
		(6, 'Teapot'),
		(7, 'Iron'),
		(8, 'VacuumCleaner'),
		(9, 'RobotVacuumCleaner'),
		(10, 'AirConditioning'),
		(11, 'Television'),
		(12, 'Monitor'),
		(13, 'AudioSystem'),
		(14, 'Smartphone'),
		(15, 'Tablet'),
		(16, 'Notebook'),
		(17, 'Camera')
GO

CREATE TABLE dbo.Refrigerator           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	NumberOfModes				tinyint,
	SmartHomeFunction			bit,
	QuickDefrostFunction		bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Refrigerator
	(
	ProductId,
	Volume,
	[Power],
	NumberOfModes,
	SmartHomeFunction,
	QuickDefrostFunction	
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.NumberOfModes,
		p.SmartHomeFunction,
		p.QuickDefrostFunction	
	FROM dbo.Product p 
	WHERE p.QuickDefrostFunction IS NOT NULL
GO

CREATE TABLE dbo.Stove           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	MaxTemperature				decimal,
	NumberOfModes				tinyint,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Stove
	(
	ProductId,
	Volume,
	[Power],
	MaxTemperature,
	NumberOfModes
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.MaxTemperature,
		p.NumberOfModes
	FROM dbo.Product p 
	WHERE p.MaxTemperature IS NOT NULL
	AND p.GrillFunction IS NULL
	AND p.SmartHomeFunction IS NULL
GO

CREATE TABLE dbo.Oven           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	MaxTemperature				decimal,
	NumberOfModes				tinyint,
	SmartHomeFunction			bit,
	GrillFunction				bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Oven
	(
	ProductId,
	Volume,
	[Power],
	MaxTemperature,
	NumberOfModes,
	SmartHomeFunction,
	GrillFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.MaxTemperature,
		p.NumberOfModes,
		p.SmartHomeFunction,
		p.GrillFunction
	FROM dbo.Product p 
	WHERE p.MaxTemperature IS NOT NULL
	AND p.GrillFunction IS NOT NULL
GO

CREATE TABLE dbo.Microwave           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	NumberOfModes				tinyint,
	SmartHomeFunction			bit,
	GrillFunction				bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Microwave
	(
	ProductId,
	Volume,
	[Power],
	NumberOfModes,
	SmartHomeFunction,
	GrillFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.NumberOfModes,
		p.SmartHomeFunction,
		p.GrillFunction
	FROM dbo.Product p 
	WHERE p.MaxTemperature IS NULL
	AND p.GrillFunction IS NOT NULL
GO

CREATE TABLE dbo.Multicooker           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	MaxTemperature				decimal,
	NumberOfModes				tinyint,
	SmartHomeFunction			bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Multicooker
	(
	ProductId,
	Volume,
	[Power],
	MaxTemperature,
	NumberOfModes,
	SmartHomeFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.MaxTemperature,
		p.NumberOfModes,
		p.SmartHomeFunction
	FROM dbo.Product p 
	WHERE p.MaxTemperature IS NOT NULL
	AND p.GrillFunction IS NULL
	AND p.SmartHomeFunction IS NOT NULL
GO

CREATE TABLE dbo.Teapot           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	SmartHomeFunction			bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Teapot
	(
	ProductId,
	Volume,
	[Power],
	SmartHomeFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.SmartHomeFunction
	FROM dbo.Product p 
	WHERE p.NumberOfModes IS NULL
	AND p.MiniJack IS NULL
GO

CREATE TABLE dbo.Iron           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	MaxTemperature				decimal,
	NumberOfModes				tinyint,
	SteamGeneratorFunction		bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Iron
	(
	ProductId,
	Volume,
	[Power],
	MaxTemperature,			 
	NumberOfModes,			 
	SteamGeneratorFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.MaxTemperature,			 
		p.NumberOfModes,			 
		p.SteamGeneratorFunction
	FROM dbo.Product p 
	WHERE p.SteamGeneratorFunction IS NOT NULL
	AND p.SmartHomeFunction IS NULL
GO

CREATE TABLE dbo.VacuumCleaner           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	NumberOfModes				tinyint,
	WetCleaningFunction			bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.VacuumCleaner
	(
	ProductId,
	Volume,
	[Power],
	NumberOfModes,
	WetCleaningFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.NumberOfModes,
		p.WetCleaningFunction
	FROM dbo.Product p 
	WHERE p.WetCleaningFunction IS NOT NULL
	AND p.SmartHomeFunction IS NULL
GO

CREATE TABLE dbo.RobotVacuumCleaner           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	BatteryCapacity				decimal,
	NumberOfModes				tinyint,
	SmartHomeFunction			bit,
	WetCleaningFunction			bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.RobotVacuumCleaner
	(
	ProductId,
	Volume,
	[Power],
	BatteryCapacity,
	NumberOfModes,
	SmartHomeFunction,
	WetCleaningFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.Volume,
		p.[Power],
		p.BatteryCapacity,
		p.NumberOfModes,
		p.SmartHomeFunction,
		p.WetCleaningFunction	
	FROM dbo.Product p 
	WHERE p.WetCleaningFunction IS NOT NULL
	AND p.SmartHomeFunction IS NOT NULL
GO

CREATE TABLE dbo.AirConditioning           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	[Power]						decimal,
	MaxTemperature				decimal,
	NumberOfModes				tinyint,
	SmartHomeFunction			bit,
	SteamGeneratorFunction		bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.AirConditioning
	(
	ProductId,
	[Power],
	MaxTemperature,
	NumberOfModes,
	SmartHomeFunction,
	SteamGeneratorFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.[Power],
		p.MaxTemperature,
		p.NumberOfModes,
		p.SmartHomeFunction,
		p.SteamGeneratorFunction
	FROM dbo.Product p 
	WHERE p.SteamGeneratorFunction IS NOT NULL
	AND p.SmartHomeFunction IS NOT NULL
GO

CREATE TABLE dbo.Television           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	Volume						decimal,
	[Power]						decimal,
	MemorySize					decimal,
	ScreenDiagonal				decimal,
	ScreenResolutionWidth		smallint,
	ScreenResolutionHeight		smallint,
	HDMI						bit,
	MiniJack					bit,
	SmartHomeFunction			bit,
	CameraFunction				bit,
	TvFunction					bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Television
	(
	ProductId,
	[Power],
	MemorySize,
	ScreenDiagonal,
	ScreenResolutionWidth,
	ScreenResolutionHeight,
	HDMI,
	MiniJack,
	SmartHomeFunction,
	CameraFunction,
	TvFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.[Power],
		p.MemorySize,
		p.ScreenDiagonal,
		p.ScreenResolutionWidth,
		p.ScreenResolutionHeight,
		p.HDMI,
		p.MiniJack,
		p.SmartHomeFunction,
		p.CameraFunction,
		p.TvFunction
	FROM dbo.Product p 
	WHERE p.TvFunction IS NOT NULL
	AND p.MemorySize IS NOT NULL
GO

CREATE TABLE dbo.Monitor           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	[Power]						decimal,
	ScreenDiagonal				decimal,
	ScreenResolutionWidth		smallint,
	ScreenResolutionHeight		smallint,
	HDMI						bit,
	MiniJack					bit,
	CameraFunction				bit,
	TvFunction					bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Monitor
	(
	ProductId,
	[Power],
	ScreenDiagonal,
	ScreenResolutionWidth,
	ScreenResolutionHeight,
	HDMI,
	MiniJack,
	CameraFunction,
	TvFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.[Power],
		p.ScreenDiagonal,
		p.ScreenResolutionWidth,
		p.ScreenResolutionHeight,
		p.HDMI,
		p.MiniJack,
		p.CameraFunction,
		p.TvFunction
	FROM dbo.Product p 
	WHERE p.TvFunction IS NOT NULL
	AND p.MemorySize IS NULL
GO

CREATE TABLE dbo.AudioSystem           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	[Power]						decimal,
	MemorySize					decimal,
	NumberOfModes				tinyint,
	Jack						bit,
	MiniJack					bit,
	DiskDrivePresence			bit,
	SmartHomeFunction			bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.AudioSystem
	(
	ProductId,
	[Power],
	MemorySize,
	NumberOfModes,
	Jack,
	MiniJack,
	DiskDrivePresence,
	SmartHomeFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.[Power],
		p.MemorySize,
		p.NumberOfModes,
		p.Jack,
		p.MiniJack,
		p.DiskDrivePresence,
		p.SmartHomeFunction
	FROM dbo.Product p 
	WHERE p.Jack IS NOT NULL
GO

CREATE TABLE dbo.Smartphone           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	BatteryCapacity				decimal,
	MemorySize					decimal,
	ScreenDiagonal				decimal,
	ScreenResolutionWidth		smallint,
	ScreenResolutionHeight		smallint,
	MiniJack					bit,
	LTE							bit,
	CameraFunction				bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Smartphone
	(
	ProductId,
	BatteryCapacity,
	MemorySize,
	ScreenDiagonal,
	ScreenResolutionWidth,
	ScreenResolutionHeight,
	MiniJack,
	LTE,
	CameraFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.BatteryCapacity,
		p.MemorySize,
		p.ScreenDiagonal,
		p.ScreenResolutionWidth,
		p.ScreenResolutionHeight,
		p.MiniJack,
		p.LTE,
		p.CameraFunction
	FROM dbo.Product p 
	WHERE p.LTE IS NOT NULL
	AND p.TabletMode IS NULL
GO

CREATE TABLE dbo.Tablet           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	BatteryCapacity				decimal,
	MemorySize					decimal,
	ScreenDiagonal				decimal,
	ScreenResolutionWidth		smallint,
	ScreenResolutionHeight		smallint,
	MiniJack					bit,
	LTE							bit,
	TabletMode					bit,
	CameraFunction				bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Tablet
	(
	ProductId,
	BatteryCapacity,
	MemorySize,
	ScreenDiagonal,
	ScreenResolutionWidth,
	ScreenResolutionHeight,
	MiniJack,
	LTE,
	TabletMode,
	CameraFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.BatteryCapacity,
		p.MemorySize,
		p.ScreenDiagonal,
		p.ScreenResolutionWidth,
		p.ScreenResolutionHeight,
		p.MiniJack,
		p.LTE,
		p.TabletMode,
		p.CameraFunction
	FROM dbo.Product p 
	WHERE p.LTE IS NOT NULL
	AND p.TabletMode IS NOT NULL
GO

CREATE TABLE dbo.Notebook           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	[Power]						decimal,
	BatteryCapacity				decimal,
	MemorySize					decimal,
	ScreenDiagonal				decimal,
	ScreenResolutionWidth		smallint,
	ScreenResolutionHeight		smallint,
	HDMI						bit,
	MiniJack					bit,
	TabletMode					bit,
	DiskDrivePresence			bit,
	CameraFunction				bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Notebook
	(
	ProductId,
	[Power],
	BatteryCapacity,
	MemorySize,
	ScreenDiagonal,
	ScreenResolutionWidth,
	ScreenResolutionHeight,
	HDMI,
	MiniJack,
	TabletMode,
	DiskDrivePresence,
	CameraFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.[Power],
		p.BatteryCapacity,
		p.MemorySize,
		p.ScreenDiagonal,
		p.ScreenResolutionWidth,
		p.ScreenResolutionHeight,
		p.HDMI,
		p.MiniJack,
		p.TabletMode,
		p.DiskDrivePresence,
		p.CameraFunction
	FROM dbo.Product p 
	WHERE p.LTE IS NULL
	AND p.TabletMode IS NOT NULL
GO

CREATE TABLE dbo.Camera           
	(
	Id							int PRIMARY KEY IDENTITY NOT NULL,
	[ProductId]					bigint NOT NULL,
	BatteryCapacity				decimal,
	MemorySize					decimal,
	ScreenDiagonal				decimal,
	ScreenResolutionWidth		smallint,
	ScreenResolutionHeight		smallint,
	NumberOfModes				tinyint,
	HDMI						bit,
	SmartHomeFunction			bit,
	CameraFunction				bit,
	FOREIGN KEY (ProductId)		REFERENCES Product (Id)
	 )
GO
INSERT INTO dbo.Camera
	(
	ProductId,
	BatteryCapacity,
	MemorySize,
	ScreenDiagonal,
	ScreenResolutionWidth,
	ScreenResolutionHeight,
	NumberOfModes,
	HDMI,
	SmartHomeFunction,
	CameraFunction
	 )	 
	SELECT
		p.Id AS ProductId,
		p.BatteryCapacity,
		p.MemorySize,
		p.ScreenDiagonal,
		p.ScreenResolutionWidth,
		p.ScreenResolutionHeight,
		p.NumberOfModes,
		p.HDMI,
		p.SmartHomeFunction,
		p.CameraFunction
	FROM dbo.Product p 
	WHERE p.CameraFunction IS NOT NULL
	AND p.MiniJack IS NULL
GO
