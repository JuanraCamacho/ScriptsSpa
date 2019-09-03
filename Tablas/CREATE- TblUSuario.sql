USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Usuario].[TblUsuario]    Script Date: 03/09/2019 13:39:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [Usuario].[TblUsuario](
	[IdCuentaUsuario] [uniqueidentifier] NOT NULL,
	[LocalId] [int] IDENTITY(1,1) NOT NULL,
	[Cuenta] [varchar](20) NOT NULL,
	[PasswordHash] [varbinary](70) NOT NULL,
	[Vigente] [bit] NOT NULL,
	[Intentos] [tinyint] NOT NULL,
	[FechaSuspension] [datetime] NULL,
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[UsuarioModifico] [uniqueidentifier] NULL,
	[UsuarioAlta] [uniqueidentifier] NULL,
	[Activo] [bit] NOT NULL,
	[IdRol] [int] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TblUsuario_IdCuentaUsuario] PRIMARY KEY NONCLUSTERED 
(
	[IdCuentaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TblUsuario_LocalId] UNIQUE CLUSTERED 
(
	[LocalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [Usuario].[TblUsuario] ADD  CONSTRAINT [DF_TblUsuario_Guid]  DEFAULT (newid()) FOR [Guid]
GO

ALTER TABLE [Usuario].[TblUsuario] ADD  CONSTRAINT [DF_TblUsuario_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO

ALTER TABLE [Usuario].[TblUsuario] ADD  CONSTRAINT [DF_TblUsuario_FechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Usuario].[TblUsuario] ADD  CONSTRAINT [DF_TblUsuario_Activo]  DEFAULT ((1)) FOR [Activo]
GO

ALTER TABLE [Usuario].[TblUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TblUsuario_IdEmpleado] FOREIGN KEY([IdEmpleado])
REFERENCES [Usuario].[TblEmpleado] ([IdEmpleado])
GO

ALTER TABLE [Usuario].[TblUsuario] CHECK CONSTRAINT [FK_TblUsuario_IdEmpleado]
GO

ALTER TABLE [Usuario].[TblUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TblUsuario_IdRol] FOREIGN KEY([IdRol])
REFERENCES [Usuario].[TblRol] ([IdRol])
GO

ALTER TABLE [Usuario].[TblUsuario] CHECK CONSTRAINT [FK_TblUsuario_IdRol]
GO