USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Catalogo].[TblServicio]    Script Date: 03/09/2019 02:03:39 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Catalogo].[TblServicio](
	[IdServicio] [INT] IDENTITY(1,1) NOT NULL,
	[IdTipoServicio] [INT] NULL,
	[IdTipoIva] [INT] NOT NULL,
	[Clave] [NVARCHAR](20) NOT NULL,
	[Nombre] [NVARCHAR](200) NOT NULL,
	[Descripcion] [NVARCHAR](300) NOT NULL,
	[Precio] [MONEY] NOT NULL,
	[Duracion] [TIME](7) NULL,
	[AplicaIva] [BIT] NOT NULL,
	[AplicaIEPS] [BIT] NOT NULL,
	[IEPSMonto] [BIT] NOT NULL,
	[IEPS] [DECIMAL](4, 2) NULL,
	[FechaAlta] [DATETIME] NOT NULL,
	[FechaModificacion] [DATETIME] NOT NULL,
	[UsuarioAlta] [UNIQUEIDENTIFIER] NOT NULL,
	[UsuarioModifico] [UNIQUEIDENTIFIER] NOT NULL,
	[Activo] [BIT] NOT NULL,
 CONSTRAINT [PK_TblServicio] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Catalogo].[TblServicio] ADD  CONSTRAINT [GD_TblServicio_FechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Catalogo].[TblServicio] ADD  CONSTRAINT [GD_TblServicio_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO

ALTER TABLE [Catalogo].[TblServicio] ADD  CONSTRAINT [GD_TblServicio_Activo]  DEFAULT ((1)) FOR [Activo]
GO


