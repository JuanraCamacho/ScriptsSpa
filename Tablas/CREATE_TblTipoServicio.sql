USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Catalogo].[TblTipoServicio]    Script Date: 03/09/2019 02:06:27 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Catalogo].[TblTipoServicio](
	[IdTipoServicio] [INT] IDENTITY(1,1) NOT NULL,
	[Nombre] [NVARCHAR](200) NOT NULL,
	[Descripcion] [NVARCHAR](300) NOT NULL,
	[FechaAlta] [DATETIME] NOT NULL,
	[FechaModificacion] [DATETIME] NOT NULL,
	[UsuarioAlta] [UNIQUEIDENTIFIER] NOT NULL,
	[UsuarioModifico] [UNIQUEIDENTIFIER] NOT NULL,
	[Activo] [BIT] NOT NULL,
 CONSTRAINT [PK_TblTipoServicio] PRIMARY KEY CLUSTERED 
(
	[IdTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


