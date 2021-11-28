CREATE PROCEDURE [dbo].[CrearFactura]
	@id int,
	@monto decimal(18,2),
	@date date,
	@montolva decimal(18,2),
	@cliente int ,
	@personal int

AS
  INSERT INTO FACTURACION (Id_facturacion,monto_iva,fecha,monto_total,cc_cliente,cc_personal)
  VALUES ( @id,@monto,@date,@montolva,@cliente,@personal);
RETURN 0
