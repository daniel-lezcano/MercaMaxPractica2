﻿/*
Script de implementación para BDMercamax

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "BDMercamax"
:setvar DefaultFilePrefix "BDMercamax"
:setvar DefaultDataPath "C:\Users\camilo lopez\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\camilo lopez\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creando Procedimiento [dbo].[login]...';


GO
CREATE PROCEDURE [dbo].[login]
	@user int,
	@pass nvarchar(max)
AS
	SELECT	cc_personal.PERSONAL, cargo.PERSONAL, nombre_apellido_personal.PERSONAL FROM PERSONAL where cc_personal=@user and password=@pass
RETURN 0
GO
PRINT N'Creando Procedimiento [dbo].[loginCliente]...';


GO
CREATE PROCEDURE [dbo].[loginCliente]
	@user int ,
	@param2 int
AS
	SELECT cc_cliente , nombre_apellido_cliente  from CLIENTE WHERE cc_cliente=@user
RETURN 0
GO
PRINT N'Actualización completada.';


GO
