USE [fincamo1_naturalwuane]
GO

/****** Object:  Table [General].[TblPaises]    Script Date: 03/09/2019 14:33:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [General].[TblPaises](
	[IdPais] [int] NOT NULL,
	[A2] [nvarchar](2) NULL,
	[A3] [nvarchar](3) NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TblCPaises] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
