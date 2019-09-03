CREATE TABLE [Catalogo].[TblProducto](
	[IdProducto] [INT] IDENTITY(1,1) NOT NULL, 
	[IdCategoriaProducto] [INT] NOT NULL,
	[Nombre] [NVARCHAR](200) NOT NULL,
	[Descripcion] [NVARCHAR](300) NOT NULL,
	[Stock] [BIT] NULL,
	[StockMax][INT] NULL,
	[StockMin][INT] NULL,
	[PrecioPublico][MONEY] NOT NULL,
	[PrecioMayoreo][MONEY] NOT NULL,
	[PrecioMenudeo][MONEY] NOT NULL,
	[CodigoBarras] [NVARCHAR](50) NOT NULL,
	[UnidadMedida] [INT] NOT NULL,
	[ClaveSat] [INT] NULL,
	[AplicaIva] [BIT] NULL,
	[IEPS] [BIT] NULL,
	[Activo] [BIT] NOT NULL,
	[FechaAlta] [DATETIME] NOT NULL,
	[FechaModificacion] [DATETIME] NOT NULL,
	[UsuarioAlta] [UNIQUEIDENTIFIER] NOT NULL,
	[UsuarioModifico] [UNIQUEIDENTIFIER] NOT NULL,
	CONSTRAINT [PK_Producto_IdProducto] PRIMARY KEY  ([IdProducto]),
	CONSTRAINT [FK_Producto_CategoriaFK] FOREIGN KEY  ([IdCategoriaProducto]) REFERENCES [Catalogo].[TblCategoriaProducto] ([IdCategoriaProducto]),
	CONSTRAINT [FK_Producto_UnidadMedida] FOREIGN KEY  ([UnidadMedida]) REFERENCES [Catalogo].[TblUnidadMedida] ([IdUnidaMedida])
)

ALTER TABLE [Catalogo].[TblProducto] ADD CONSTRAINT [CT_TblProducto_FechaModificacion] DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO
ALTER TABLE [Catalogo].[TblProducto] ADD CONSTRAINT [CT_TblProducto_fechaAlta] DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO
ALTER TABLE [Catalogo].[TblProducto] ADD CONSTRAINT [CT_TblProducto_Activo] DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [Catalogo].[TblProducto] ADD CONSTRAINT [CT_TblProducto_IEPS] DEFAULT ((0)) FOR [IEPS]
GO





