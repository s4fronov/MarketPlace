create table [dbo].[Storehouse] (
    Id			INT			  NOT NULL,
	CityId		INT           NOT NULL,
    [Address]	NVARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED (Id ASC),
    FOREIGN KEY (CityId) REFERENCES [dbo].[City] (Id)
);