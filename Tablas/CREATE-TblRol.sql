USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [Usuario].[TblRol]    Script Date: 03/09/2019 14:36:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Usuario].[TblRol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](300) NOT NULL,
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[UsuarioModifico] [uniqueidentifier] NULL,
	[UsuarioAlta] [uniqueidentifier] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_TblRoles_IdRol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [Usuario].[TblRol] ADD  CONSTRAINT [DF_TblRol_Guid]  DEFAULT (newid()) FOR [Guid]
GO

ALTER TABLE [Usuario].[TblRol] ADD  CONSTRAINT [DF_TblRol_FechaAlta]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO

ALTER TABLE [Usuario].[TblRol] ADD  CONSTRAINT [DF_TblRol_FechaModificacion]  DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO

ALTER TABLE [Usuario].[TblRol] ADD  CONSTRAINT [DF_TblRol_Activo]  DEFAULT ((1)) FOR [Activo]
GO


