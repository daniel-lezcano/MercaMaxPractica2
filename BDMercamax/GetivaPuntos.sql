CREATE PROCEDURE [dbo].[GetivaPuntos]
	@id int
AS
	SELECT TIPO_PRODUCTO from iva,puntos where TIPO_PRODUCTO.Id_tipo=producto.Id_tipo 
RETURN 0
