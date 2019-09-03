USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [General].[TblEstados]    Script Date: 03/09/2019 14:30:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [General].[TblEstados](
	[IdEstado] [int] NOT NULL,
	[IdPais] [int] NOT NULL,
	[Descripcion] [nvarchar](150) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TblCEstados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC,
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [General].[TblEstados]  WITH CHECK ADD  CONSTRAINT [FK_TblCEstados_TblCPaises] FOREIGN KEY([IdPais])
REFERENCES [General].[TblPaises] ([IdPais])
GO

ALTER TABLE [General].[TblEstados] CHECK CONSTRAINT [FK_TblCEstados_TblCPaises]
GO