USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Catalogo].[TblProveedor]    Script Date: 03/09/2019 14:37:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Catalogo].[TblProveedor](
	[IdProveedor] [uniqueidentifier] NOT NULL,
	[LocalId] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [nvarchar](15) NOT NULL,
	[NombreComercial] [nvarchar](200) NOT NULL,
	[RazonSocial] [nvarchar](300) NOT NULL,
	[Representante] [nvarchar](150) NOT NULL,
	[RFC] [nvarchar](25) NOT NULL,
	[Direccion] [nvarchar](200) NULL,
	[Telefono] [nvarchar](10) NOT NULL,
	[CorreoElectronico] [nvarchar](45) NULL,
	[CodigoPostal] [nvarchar](45) NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
	[IdMunicipio] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[UsuarioModifico] [uniqueidentifier] NULL,
	[UsuarioAlta] [uniqueidentifier] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_TblProveedor_IdProveedor] PRIMARY KEY NONCLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TblProveedor_LocalId] UNIQUE CLUSTERED 
(
	[LocalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [Catalogo].[TblProveedor] ADD  CONSTRAINT [DF_TblProveedor_IdProveedor]  DEFAULT (newid()) FOR [IdProveedor]
GO

ALTER TABLE [Catalogo].[TblProveedor] ADD  CONSTRAINT [DF_TblProveedor_FechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Catalogo].[TblProveedor] ADD  CONSTRAINT [DF_TblProveedor_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO

ALTER TABLE [Catalogo].[TblProveedor] ADD  CONSTRAINT [DF_TblProveedor_Activo]  DEFAULT ((1)) FOR [Activo]
GO

ALTER TABLE [Catalogo].[TblProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TblProveedor_IdEstado_IdPais] FOREIGN KEY([IdEstado], [IdPais])
REFERENCES [General].[TblEstados] ([IdEstado], [IdPais])
GO

ALTER TABLE [Catalogo].[TblProveedor] CHECK CONSTRAINT [FK_TblProveedor_IdEstado_IdPais]
GO

ALTER TABLE [Catalogo].[TblProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TblProveedor_IdMunicipio_IdEstado_IdPais] FOREIGN KEY([IdMunicipio], [IdEstado], [IdPais])
REFERENCES [General].[TblMunicipios] ([IdMunicipio], [IdEstado], [IdPais])
GO

ALTER TABLE [Catalogo].[TblProveedor] CHECK CONSTRAINT [FK_TblProveedor_IdMunicipio_IdEstado_IdPais]
GO

ALTER TABLE [Catalogo].[TblProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TblProveedor_IdPais] FOREIGN KEY([IdPais])
REFERENCES [General].[TblPaises] ([IdPais])
GO

ALTER TABLE [Catalogo].[TblProveedor] CHECK CONSTRAINT [FK_TblProveedor_IdPais]
GO


