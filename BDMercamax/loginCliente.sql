CREATE PROCEDURE [dbo].[loginCliente]
	@user int ,
	@param2 int
AS
	SELECT cc_cliente , nombre_apellido_cliente  from CLIENTE WHERE cc_cliente=@user
RETURN 0
