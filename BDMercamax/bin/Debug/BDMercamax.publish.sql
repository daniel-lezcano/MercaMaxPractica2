/*
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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creando la base de datos $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creando Tabla [dbo].[CLIENTE]...';


GO
CREATE TABLE [dbo].[CLIENTE] (
    [cc_cliente]               INT            NOT NULL,
    [nombre_apellido_cliente]  NVARCHAR (MAX) NOT NULL,
    [telefono_cliente]         NVARCHAR (MAX) NOT NULL,
    [email_cliente]            NVARCHAR (MAX) NOT NULL,
    [direccion_cliente]        NVARCHAR (MAX) NOT NULL,
    [fecha_nacimiento_cliente] DATE           NOT NULL,
    [puntos_acumulados]        INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([cc_cliente] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[FACTURACION]...';


GO
CREATE TABLE [dbo].[FACTURACION] (
    [Id_facturacion] INT             NOT NULL,
    [monto_total]    DECIMAL (18, 2) NOT NULL,
    [fecha]          DATE            NOT NULL,
    [monto_iva]      DECIMAL (18, 2) NOT NULL,
    [cc_cliente]     INT             NOT NULL,
    [cc_personal]    INT             NOT NULL,
    [Id_venta]       INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_facturacion] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[LUGAR_STOCK]...';


GO
CREATE TABLE [dbo].[LUGAR_STOCK] (
    [Id_lugar]         INT            NOT NULL,
    [barcode_producto] INT            NOT NULL,
    [cantidad_gondola] INT            NOT NULL,
    [seccion_bodega]   NVARCHAR (MAX) NOT NULL,
    [seccion_gondola]  NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_lugar] ASC),
    UNIQUE NONCLUSTERED ([barcode_producto] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[PERSONAL]...';


GO
CREATE TABLE [dbo].[PERSONAL] (
    [cc_personal]               INT           NOT NULL,
    [nombre_apellido_personal]  VARCHAR (MAX) NOT NULL,
    [cargo]                     BIT           NOT NULL,
    [telefono_personal]         VARCHAR (MAX) NOT NULL,
    [email_personal]            VARCHAR (MAX) NOT NULL,
    [direccion_personal]        VARCHAR (MAX) NOT NULL,
    [fecha_nacimiento_personal] DATE          NOT NULL,
    [password]                  VARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([cc_personal] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[PRODUCTO]...';


GO
CREATE TABLE [dbo].[PRODUCTO] (
    [Id_producto]       INT             NOT NULL,
    [nombre_producto]   NVARCHAR (MAX)  NOT NULL,
    [fecha_llegada]     DATE            NOT NULL,
    [fecha_vencimiento] DATE            NOT NULL,
    [barcode]           INT             NOT NULL,
    [precio]            DECIMAL (18, 2) NOT NULL,
    [nit]               INT             NOT NULL,
    [Id_tipo]           INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_producto] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[PROVEDOR]...';


GO
CREATE TABLE [dbo].[PROVEDOR] (
    [nit]                INT            NOT NULL,
    [nombre_provedor]    NVARCHAR (MAX) NULL,
    [telefono_provedor]  NVARCHAR (MAX) NULL,
    [email_provedor]     NVARCHAR (MAX) NULL,
    [direccion_provedor] NVARCHAR (MAX) NULL,
    [agente_ventas]      NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([nit] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[TIPO_PRODUCTO]...';


GO
CREATE TABLE [dbo].[TIPO_PRODUCTO] (
    [Id_tipo]    INT           NOT NULL,
    [categoria]  VARCHAR (MAX) NULL,
    [perecedero] BIT           NULL,
    [iva]        INT           NULL,
    [puntos]     INT           NULL,
    PRIMARY KEY CLUSTERED ([Id_tipo] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[VENTA]...';


GO
CREATE TABLE [dbo].[VENTA] (
    [Id_venta]         INT NOT NULL,
    [barcode_producto] INT NOT NULL,
    [cantidad]         INT NOT NULL,
    [Id_factura]       INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_venta] ASC),
    UNIQUE NONCLUSTERED ([barcode_producto] ASC)
);


GO
PRINT N'Creando Clave externa [dbo].[FK_FACTURACION_ToTable]...';


GO
ALTER TABLE [dbo].[FACTURACION]
    ADD CONSTRAINT [FK_FACTURACION_ToTable] FOREIGN KEY ([cc_cliente]) REFERENCES [dbo].[CLIENTE] ([cc_cliente]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FACTURACION_ToTable_1]...';


GO
ALTER TABLE [dbo].[FACTURACION]
    ADD CONSTRAINT [FK_FACTURACION_ToTable_1] FOREIGN KEY ([cc_personal]) REFERENCES [dbo].[PERSONAL] ([cc_personal]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FACTURACION_ToTable_2]...';


GO
ALTER TABLE [dbo].[FACTURACION]
    ADD CONSTRAINT [FK_FACTURACION_ToTable_2] FOREIGN KEY ([Id_venta]) REFERENCES [dbo].[VENTA] ([Id_venta]);


GO
PRINT N'Creando Clave externa [dbo].[FK_PRODUCTO_TIPO_PRODUCTO]...';


GO
ALTER TABLE [dbo].[PRODUCTO]
    ADD CONSTRAINT [FK_PRODUCTO_TIPO_PRODUCTO] FOREIGN KEY ([Id_tipo]) REFERENCES [dbo].[TIPO_PRODUCTO] ([Id_tipo]);


GO
PRINT N'Creando Clave externa [dbo].[FK_PRODUCTO_ToTable]...';


GO
ALTER TABLE [dbo].[PRODUCTO]
    ADD CONSTRAINT [FK_PRODUCTO_ToTable] FOREIGN KEY ([nit]) REFERENCES [dbo].[PROVEDOR] ([nit]);


GO
PRINT N'Creando Clave externa [dbo].[FK_VENTA_ToTable]...';


GO
ALTER TABLE [dbo].[VENTA]
    ADD CONSTRAINT [FK_VENTA_ToTable] FOREIGN KEY ([Id_factura]) REFERENCES [dbo].[FACTURACION] ([Id_facturacion]);


GO
-- Paso de refactorización para actualizar el servidor de destino con los registros de transacciones implementadas

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c1457c52-da19-41da-bef8-3f8b7d025445')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c1457c52-da19-41da-bef8-3f8b7d025445')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '749ade90-65c9-44d8-bd2a-a0279e930cf9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('749ade90-65c9-44d8-bd2a-a0279e930cf9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e1288280-1521-4be4-8c93-4b6a5940fe2d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e1288280-1521-4be4-8c93-4b6a5940fe2d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '03d70dc1-5c46-4bba-a9b9-a341beb0605b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('03d70dc1-5c46-4bba-a9b9-a341beb0605b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1d7fb8e7-af4b-40c3-ac6d-8e03728173ed')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1d7fb8e7-af4b-40c3-ac6d-8e03728173ed')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ea7081a3-465c-4c96-8b74-746da21c5b41')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ea7081a3-465c-4c96-8b74-746da21c5b41')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '206c09f9-3599-476e-8c5d-69fc095f1435')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('206c09f9-3599-476e-8c5d-69fc095f1435')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '37584570-bd01-4ef4-bd69-7651475e434d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('37584570-bd01-4ef4-bd69-7651475e434d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4e3baf07-eab4-4c28-ac28-9d10f61b97b7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4e3baf07-eab4-4c28-ac28-9d10f61b97b7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bb9e9b08-050d-4452-b8f7-3aecf37b0b15')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bb9e9b08-050d-4452-b8f7-3aecf37b0b15')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7b1ac1da-29d8-4a54-9f0f-b9b9f225ea38')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7b1ac1da-29d8-4a54-9f0f-b9b9f225ea38')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '33710d01-4cc5-4730-bc54-05a0821d452a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('33710d01-4cc5-4730-bc54-05a0821d452a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'eba5bfaa-dcd6-48a1-b9b0-ecef223396e5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('eba5bfaa-dcd6-48a1-b9b0-ecef223396e5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5b3cb008-73ba-49c2-9858-be49fbec8014')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5b3cb008-73ba-49c2-9858-be49fbec8014')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Actualización completada.';


GO
