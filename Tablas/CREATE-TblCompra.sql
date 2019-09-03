USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Compra].[TblCompra]    Script Date: 03/09/2019 14:29:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [Compra].[TblCompra](
	[IdCompra] [uniqueidentifier] NOT NULL,
	[LocalId] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](20) NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[Subtotal] [money] NULL,
	[Iva] [money] NULL,
	[Efectivo] [money] NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[UsuarioModifico] [uniqueidentifier] NULL,
	[UsuarioAlta] [uniqueidentifier] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_TblCompra_IdCompra] PRIMARY KEY NONCLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TblUsuario_LocalId] UNIQUE CLUSTERED 
(
	[LocalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [Compra].[TblCompra] ADD  CONSTRAINT [DF_TblCompra_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO

ALTER TABLE [Compra].[TblCompra] ADD  CONSTRAINT [DF_TblCompra_FechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Compra].[TblCompra] ADD  CONSTRAINT [DF_TblCompra_Activo]  DEFAULT ((1)) FOR [Activo]
GO


