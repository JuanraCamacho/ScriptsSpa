CREATE TABLE [Catalogo].[TblProductos](
	[IdProductos] [INT] IDENTITY(1,1) NOT NULL  PRIMARY KEY,
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL, 
	[Clave] [INT] NOT NULL,
	[Nombre] [NVARCHAR](50) NOT NULL,
	[Descripcion] [NVARCHAR](100) NOT NULL,
	[Precio] [MONEY] NOT NULL,
	[CodigoBarras] [INT] NOT NULL,
	[UnidadMedida] [VARCHAR](50) NOT NULL,
	[ClaveSat] [INT] NULL,
	[AplicaIva] [BIT] NULL,
	[Imagen] [NVARCHAR](300) NOT NULL,
	[IEPS] [BIT] NULL,
	[CategoriaFK] [INT] NOT NULL,
	[Activo] [BIT] NOT NULL,
	[FechaAlta] [DATETIME] NOT NULL,
	[FechaModificacion] [DATETIME] NOT NULL,
	[UsuarioAlta] [INT] NULL,
	[UsuarioModifico] [INT] NULL,
)
ALTER TABLE [Catalogo].[TblProductos] ADD CONSTRAINT [GD_TblProductos_Guid] DEFAULT (NEWID()) FOR [Guid]
GO
ALTER TABLE [Catalogo].[TblProductos] ADD CONSTRAINT [GD_TblProductos_FechaModificacion] DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO
ALTER TABLE [Catalogo].[TblProductos] ADD CONSTRAINT [GD_TblProductos_fechaAlta] DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO
ALTER TABLE [Catalogo].[TblProductos] ADD CONSTRAINT [GD_TblProductos_Activo] DEFAULT ((1)) FOR [Activo]
GO





