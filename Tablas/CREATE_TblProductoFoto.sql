CREATE TABLE [Catalogo].[TblProductoFoto](
	[IdProducto][INT] NOT NULL,
	[FotoBase64][VARCHAR](MAX) NOT NULL,
	[UrlLocalImagen][NVARCHAR](300) NOT NULL,
	[Activo] [BIT] NOT NULL,
	[FechaAlta] [DATETIME] NOT NULL,
	[FechaModificacion] [DATETIME] NOT NULL,
	[UsuarioAlta] [UNIQUEIDENTIFIER] NOT NULL,
	[UsuarioModifico] [UNIQUEIDENTIFIER] NOT NULL,
	CONSTRAINT [PK_IdProductoFoto] PRIMARY KEY  ([IdProducto]),
	CONSTRAINT [FK_IdProductoFoto] FOREIGN KEY  ([IdProducto]) REFERENCES [Catalogo].[TblProducto] ([IdProducto])
)
ALTER TABLE [Catalogo].[TblProductoFoto] ADD CONSTRAINT [CT_TblProductoFoto_FechaModificacion] DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO
ALTER TABLE [Catalogo].[TblProductoFoto] ADD CONSTRAINT [CT_TblProductoFoto_fechaAlta] DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO
ALTER TABLE [Catalogo].[TblProductoFoto] ADD CONSTRAINT [CT_TblProductoFoto_Activo] DEFAULT ((1)) FOR [Activo]
GO
