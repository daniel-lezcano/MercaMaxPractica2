CREATE PROCEDURE [dbo].[login]
	@user int,
	@pass nvarchar(max)
AS
	SELECT	cc_personal , cargo, nombre_apellido_personal FROM PERSONAL where cc_personal=@user and password=@pass
RETURN 0
