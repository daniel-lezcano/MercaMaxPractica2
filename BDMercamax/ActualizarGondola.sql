CREATE PROCEDURE [dbo].[ActualizarGondola]
	@id int ,
	@n int
AS
	UPdate LUGAR_STOCK set cantidad_gondola=cantidad_gondola-@n where barcode_producto=(select barcode from PRODUCTO where Id_producto=@id)
RETURN 0
   