CREATE TABLE [dbo].[TIPO_PRODUCTO]
(
	[Id_tipo] INT NOT NULL PRIMARY KEY, 
    [categoria] VARCHAR(MAX) NULL, 
    [perecedero] BIT NULL, 
    [iva] INT NULL, 
    [puntos] INT NULL
)
