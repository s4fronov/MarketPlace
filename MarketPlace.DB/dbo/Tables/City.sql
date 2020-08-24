create table [dbo].[City] (
    Id INT					NOT NULL,
    [Name] NVARCHAR (30)	NOT NULL,
    PRIMARY KEY CLUSTERED (Id ASC),
    UNIQUE NONCLUSTERED ([Name] ASC)
);