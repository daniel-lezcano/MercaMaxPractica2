CREATE PROCEDURE [dbo].[ActualizarPuntos]
	@id int,
 	@n int
AS
	update CLIENTE set puntos_acumulados=puntos_acumulados+@n where cc_cliente=@id
RETURN 0
