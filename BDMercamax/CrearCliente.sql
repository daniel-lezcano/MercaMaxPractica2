CREATE PROCEDURE [dbo].[CrearCliente]
	@cc int,
	@nombre nvarchar(max),
	@telefono nvarchar(max),
	@email    nvarchar(max),
	@direccion nvarchar(max),
	@fecha date


	
AS
 INSERT INTO CLIENTE (cc_cliente,nombre_apellido_cliente,telefono_cliente,email_cliente,direccion_cliente,fecha_nacimiento_cliente)
  VALUES ( @cc,@nombre,@telefono,@email,@direccion,@fecha);
RETURN 0
