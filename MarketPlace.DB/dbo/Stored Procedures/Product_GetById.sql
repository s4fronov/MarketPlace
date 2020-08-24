CREATE PROCEDURE [dbo].[Product_GetById]
	@id BIGINT
AS
BEGIN
	SELECT
		[Id],
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
		NumberOfModes tinyint,
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
	FROM Product
	WHERE Id = @id
END;