CREATE TABLE [dbo].[VENTA]
(
	[Id_venta] INT NOT NULL PRIMARY KEY, 
    [barcode_producto] INT NOT NULL unique, 
    [cantidad] INT NOT NULL, 
    [Id_factura] INT NOT NULL, 
    CONSTRAINT [FK_VENTA_ToTable] FOREIGN KEY ([Id_factura]) REFERENCES [FACTURACION]([Id_facturacion]),
)
