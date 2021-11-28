CREATE TABLE [dbo].[FACTURACION]
(
	[Id_facturacion] INT NOT NULL PRIMARY KEY, 
    [monto_total] DECIMAL(18, 2) NOT NULL, 
    [fecha] DATE NOT NULL, 
    [monto_iva] DECIMAL(18, 2) NOT NULL, 
    [cc_cliente] INT NOT NULL, 
    [cc_personal] INT NOT NULL, 
    [Id_venta] INT NOT NULL, 
    CONSTRAINT [FK_FACTURACION_ToTable] FOREIGN KEY ([cc_cliente]) REFERENCES [CLIENTE]([cc_cliente]), 
    CONSTRAINT [FK_FACTURACION_ToTable_1] FOREIGN KEY ([cc_personal]) REFERENCES [PERSONAL]([cc_personal]), 
    CONSTRAINT [FK_FACTURACION_ToTable_2] FOREIGN KEY ([Id_venta]) REFERENCES [VENTA]([Id_venta])
)
