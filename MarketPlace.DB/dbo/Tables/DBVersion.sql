create table [dbo].[DBVersion] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Created]   DATETIME2 (0) NOT NULL,
    [DbVersion] NVARCHAR (8)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);