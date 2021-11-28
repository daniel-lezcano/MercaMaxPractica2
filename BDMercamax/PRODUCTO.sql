CREATE TABLE [dbo].[PRODUCTO]
(
	[Id_producto] INT NOT NULL PRIMARY KEY, 
    [nombre_producto] NVARCHAR(MAX) NOT NULL, 
    [fecha_llegada] DATE NOT NULL, 
    [fecha_vencimiento] DATE NOT NULL, 
    [barcode] INT NOT NULL, 
    [precio] DECIMAL(18, 2) NOT NULL, 
    [nit] INT NOT NULL, 
    [Id_tipo] INT NOT NULL, 
    CONSTRAINT [FK_PRODUCTO_TIPO_PRODUCTO] FOREIGN KEY ([Id_tipo]) REFERENCES [TIPO_PRODUCTO]([Id_tipo]), 
    CONSTRAINT [FK_PRODUCTO_ToTable] FOREIGN KEY ([nit]) REFERENCES [PROVEDOR]([nit]),
)
