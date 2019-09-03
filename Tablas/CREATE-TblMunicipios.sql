USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [General].[TblMunicipios]    Script Date: 03/09/2019 14:33:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [General].[TblMunicipios](
	[IdMunicipio] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
	[IdPais] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TblCMunicipio] PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC,
	[IdEstado] ASC,
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [General].[TblMunicipios]  WITH NOCHECK ADD  CONSTRAINT [FK_TblCMunicipio_TblCEstados] FOREIGN KEY([IdEstado], [IdPais])
REFERENCES [General].[TblEstados] ([IdEstado], [IdPais])
GO

ALTER TABLE [General].[TblMunicipios] NOCHECK CONSTRAINT [FK_TblCMunicipio_TblCEstados]
GO


