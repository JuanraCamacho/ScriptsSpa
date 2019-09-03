USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Usuario].[TblEmpleado]    Script Date: 03/09/2019 14:35:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [Usuario].[TblEmpleado](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[LocalId] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [nvarchar](10) NOT NULL,
	[Nombres] [nvarchar](80) NOT NULL,
	[ApellidoPat] [nvarchar](80) NOT NULL,
	[ApellidoMat] [nvarchar](80) NOT NULL,
	[Edad] [int] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[IdTurno] [int] NULL,
	[IdPuesto] [int] NULL,
	[Telefono] [varchar](10) NOT NULL,
	[Correo] [nvarchar](300) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[UsuarioModifico] [int] NULL,
	[UsuarioAlta] [int] NULL,
	[Activo] [bit] NOT NULL,
	[Direccion] [nvarchar](300) NULL,
	[Foto] [nvarchar](max) NULL,
	[Contraseña] [varbinary](70) NULL,
	[idSucursal] [int] NULL,
 CONSTRAINT [PK_TblEmpleado_IdEmpleado] PRIMARY KEY NONCLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TblEmpleado_LocalId] UNIQUE CLUSTERED 
(
	[LocalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [Usuario].[TblEmpleado] ADD  CONSTRAINT [DF_TblEmpleado_IdEmpleado]  DEFAULT (newid()) FOR [IdEmpleado]
GO

ALTER TABLE [Usuario].[TblEmpleado] ADD  CONSTRAINT [DF_TblEmpleado_FechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Usuario].[TblEmpleado] ADD  CONSTRAINT [DF_TblEmpleado_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO

ALTER TABLE [Usuario].[TblEmpleado] ADD  CONSTRAINT [DF_TblEmpleado_Activo]  DEFAULT ((1)) FOR [Activo]
GO

ALTER TABLE [Usuario].[TblEmpleado]  WITH CHECK ADD  CONSTRAINT [PK_IdSucursal] FOREIGN KEY([idSucursal])
REFERENCES [General].[TblSucursal] ([IdSucursal])
GO

ALTER TABLE [Usuario].[TblEmpleado] CHECK CONSTRAINT [PK_IdSucursal]
GO
