CREATE TABLE [dbo].[PERSONAL]
(
	[cc_personal] INT NOT NULL PRIMARY KEY, 
    [nombre_apellido_personal] VARCHAR(MAX) NOT NULL, 
    [cargo] BIT NOT NULL, 
    [telefono_personal] VARCHAR(MAX) NOT NULL, 
    [email_personal] VARCHAR(MAX) NOT NULL, 
    [direccion_personal] VARCHAR(MAX) NOT NULL, 
    [fecha_nacimiento_personal] DATE NOT NULL, 
    [password] VARCHAR(MAX) NOT NULL
)
