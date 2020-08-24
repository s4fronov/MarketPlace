DECLARE @currentDBVersion NVARCHAR(10);
SET @currentDBVersion = (SELECT TOP(1) DBVersion FROM [dbo].[DBVersion] ORDER BY Created DESC)

IF @currentDBVersion < '1.1'

ALTER TABLE Product
ADD CategoryId TINYINT REFERENCES [Category] (Id) NULL
GO

UPDATE Product
SET CategoryId = 1
WHERE QuickDefrostFunction IS NOT NULL
GO
UPDATE Product
SET CategoryId = 2
WHERE MaxTemperature IS NOT NULL
AND GrillFunction IS NULL
AND SmartHomeFunction IS NULL
GO
UPDATE Product
SET CategoryId = 3
WHERE MaxTemperature IS NOT NULL
AND GrillFunction IS NOT NULL
GO
UPDATE Product
SET CategoryId = 4
WHERE MaxTemperature IS NULL
AND GrillFunction IS NOT NULL
GO
UPDATE Product
SET CategoryId = 5
WHERE MaxTemperature IS NOT NULL
AND GrillFunction IS NULL
AND SmartHomeFunction IS NOT NULL
GO
UPDATE Product
SET CategoryId = 6
WHERE NumberOfModes IS NULL
AND MiniJack IS NULL
GO
UPDATE Product
SET CategoryId = 7
WHERE SteamGeneratorFunction IS NOT NULL
AND SmartHomeFunction IS NULL
GO
UPDATE Product
SET CategoryId = 8
WHERE WetCleaningFunction IS NOT NULL
AND SmartHomeFunction IS NULL
GO
UPDATE Product
SET CategoryId = 9
WHERE WetCleaningFunction IS NOT NULL
AND SmartHomeFunction IS NOT NULL
GO
UPDATE Product
SET CategoryId = 10
WHERE SteamGeneratorFunction IS NOT NULL
AND SmartHomeFunction IS NOT NULL
GO
UPDATE Product
SET CategoryId = 11
WHERE TvFunction IS NOT NULL
AND MemorySize IS NOT NULL
GO
UPDATE Product
SET CategoryId = 12
WHERE TvFunction IS NOT NULL
AND MemorySize IS NULL
GO
UPDATE Product
SET CategoryId = 13
WHERE Jack IS NOT NULL
GO
UPDATE Product
SET CategoryId = 14
WHERE LTE IS NOT NULL
AND TabletMode IS NULL
GO
UPDATE Product
SET CategoryId = 15
WHERE LTE IS NOT NULL
AND TabletMode IS NOT NULL
GO
UPDATE Product
SET CategoryId = 16
WHERE LTE IS NULL
AND TabletMode IS NOT NULL
GO
UPDATE Product
SET CategoryId = 17
WHERE CameraFunction IS NOT NULL
AND MiniJack IS NULL
GO

ALTER TABLE Product
DROP COLUMN  
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
GO