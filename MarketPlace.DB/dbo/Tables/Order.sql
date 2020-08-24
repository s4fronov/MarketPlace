create table [dbo].[Order] (
    Id              BIGINT        IDENTITY (1, 1) NOT NULL,
    FirstName       NVARCHAR (30)	NOT NULL,
    LastName        NVARCHAR (30)	NOT NULL,
    Patronymic      NVARCHAR (30)	NULL,
    Email           NVARCHAR (30)	NOT NULL,
    Phone           NVARCHAR (20)	NULL,
    CityId          INT				NULL,
	[Address]		NVARCHAR (30)	NULL,
    TotalAmount		MONEY			NOT NULL,
	OrderDate       DATETIME2 (7)	NOT NULL,
	DeliveryDate	DATETIME2 (7),
	IsDelivered		BIT DEFAULT 0,
    PRIMARY KEY CLUSTERED (Id ASC),
    FOREIGN KEY (CityId) REFERENCES [dbo].[City] (Id),
	UNIQUE NONCLUSTERED (Email ASC)
);