USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Catalogo].[TblFormaPago]    Script Date: 20/08/2019 09:46:24 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Catalogo].[TblFormaPago](
	[IdFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[Descripcion] [nvarchar](300) NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[UsuarioAlta] [int] NOT NULL,
	[UsuarioModifico] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Catalogo].[TblFormaPago] ADD  CONSTRAINT [GD_TblFormaPago_Activo]  DEFAULT ((1)) FOR [Activo]
GO

ALTER TABLE [Catalogo].[TblFormaPago] ADD  CONSTRAINT [GD_TblFormaPago_fechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Catalogo].[TblFormaPago] ADD  CONSTRAINT [GD_TblFormaPago_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO


