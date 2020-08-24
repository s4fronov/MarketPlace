CREATE PROCEDURE [dbo].[Product_GetAll]
AS
BEGIN
	SELECT
		p.[Id],
		p.[Name],
    	p.Manufacturer,
		p.Price,
		p.Width,
		p.Height,
		p.[Length],
		p.[Weight],
		p.ProdYear,
		p.Warranty,
		p.Volume,
		p.[Power],
		p.MaxTemperature,
		p.BatteryCapacity,
		p.MemorySize,
		p.ScreenDiagonal,
		p.ScreenResolutionWidth,
		p.ScreenResolutionHeight,
		p.NumberOfModes tinyint,
		p.HDMI,
		p.Jack,
		p.MiniJack,
		p.LTE,
		p.TabletMode,
		p.DiskDrivePresence,
		p.SmartHomeFunction,
		p.SteamGeneratorFunction,
		p.WetCleaningFunction,
		p.QuickDefrostFunction,
		p.CameraFunction,
		p.TvFunction,
		p.GrillFunction
	FROM dbo.Product p
	ORDER BY [Name] 
END;