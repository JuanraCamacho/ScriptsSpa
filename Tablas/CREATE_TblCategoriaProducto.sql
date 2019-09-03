USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Catalogo].[TblCategoriaProducto]    Script Date: 03/09/2019 02:01:46 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Catalogo].[TblCategoriaProducto](
	[IdCategoriaProducto] [INT] IDENTITY(1,1) NOT NULL,
	[Nombre] [NVARCHAR](200) NOT NULL,
	[Descripcion] [NVARCHAR](300) NOT NULL,
	[FechaAlta] [DATETIME] NOT NULL,
	[FechaModificacion] [DATETIME] NOT NULL,
	[UsuarioAlta] [UNIQUEIDENTIFIER] NOT NULL,
	[UsuarioModifico] [UNIQUEIDENTIFIER] NOT NULL,
	[Activo] [BIT] NOT NULL,
 CONSTRAINT [PK_TblCategoriaProducto] PRIMARY KEY CLUSTERED 
(
	[IdCategoriaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Catalogo].[TblCategoriaProducto] ADD  CONSTRAINT [GD_TblCategoriaProducto_FechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Catalogo].[TblCategoriaProducto] ADD  CONSTRAINT [GD_TblCategoriaProducto_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO

ALTER TABLE [Catalogo].[TblCategoriaProducto] ADD  CONSTRAINT [GD_TblCategoriaProducto_Activo]  DEFAULT ((1)) FOR [Activo]
GO


