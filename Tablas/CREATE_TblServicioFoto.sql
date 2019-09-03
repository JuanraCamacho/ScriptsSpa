USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Catalogo].[TblServicioFoto]    Script Date: 03/09/2019 02:04:37 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Catalogo].[TblServicioFoto](
	[IdServicio] [INT] NOT NULL,
	[FotoBase64] [VARCHAR](MAX) NOT NULL,
	[UrlLocalImagen] [NVARCHAR](300) NOT NULL,
	[Activo] [BIT] NOT NULL,
	[FechaAlta] [DATETIME] NOT NULL,
	[FechaModificacion] [DATETIME] NOT NULL,
	[UsuarioAlta] [UNIQUEIDENTIFIER] NOT NULL,
	[UsuarioModifico] [UNIQUEIDENTIFIER] NOT NULL,
 CONSTRAINT [PK_TblServicioFoto] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [Catalogo].[TblServicioFoto] ADD  CONSTRAINT [CT_TblServicioFoto_Activo]  DEFAULT ((1)) FOR [Activo]
GO

ALTER TABLE [Catalogo].[TblServicioFoto] ADD  CONSTRAINT [CT_TblServicioFoto_fechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Catalogo].[TblServicioFoto] ADD  CONSTRAINT [CT_TblServicioFoto_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO

ALTER TABLE [Catalogo].[TblServicioFoto]  WITH NOCHECK ADD  CONSTRAINT [FK_IdFotoServicio] FOREIGN KEY([IdServicio])
REFERENCES [Catalogo].[TblServicio] ([IdServicio])
GO

ALTER TABLE [Catalogo].[TblServicioFoto] CHECK CONSTRAINT [FK_IdFotoServicio]
GO


