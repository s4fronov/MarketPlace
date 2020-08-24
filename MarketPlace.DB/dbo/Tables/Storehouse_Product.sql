create table [dbo].[Storehouse_Product] (
    [Id]        INT      IDENTITY (1, 1) NOT NULL,
    [StorehouseId]   INT NULL,
    [ProductId] bigint   NULL,
    [Quantity]  SMALLINT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    FOREIGN KEY ([StorehouseId]) REFERENCES [dbo].[Storehouse] ([Id])
);