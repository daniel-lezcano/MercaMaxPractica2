CREATE TABLE [dbo].[PROVEDOR]
(
	[nit] INT NOT NULL PRIMARY KEY, 
    [nombre_provedor] NVARCHAR(MAX) NULL, 
    [telefono_provedor] NVARCHAR(MAX) NULL, 
    [email_provedor] NVARCHAR(MAX) NULL, 
    [direccion_provedor] NVARCHAR(MAX) NULL, 
    [agente_ventas] NVARCHAR(MAX) NULL, 
   
)
