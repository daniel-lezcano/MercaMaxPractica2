CREATE TABLE [dbo].[LUGAR_STOCK]
(
	[Id_lugar] INT NOT NULL PRIMARY KEY, 
    [barcode_producto] INT NOT NULL unique, 
    [cantidad_gondola] INT NOT NULL, 
    [seccion_bodega] NVARCHAR(MAX) NOT NULL, 
    [seccion_gondola] NVARCHAR(MAX) NOT NULL
)
