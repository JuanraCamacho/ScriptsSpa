CREATE TABLE [Usuario].[TblPuesto]
(
	[IdPuesto] [INT]IDENTITY (1,1),
	[Turno] [NVARCHAR](50),
	[Descripcion] [NVARCHAR](100),
	[Activo] [BIT] NOT NULL,
	[FechaAlta] [DATETIME] NOT NULL,
	[FechaModificacion] [DATETIME] NOT NULL,
	[UsuarioAlta] [UNIQUEIDENTIFIER] NOT NULL,
	[UsuarioModifico] [UNIQUEIDENTIFIER] NOT NULL,
	CONSTRAINT [PK_IdPuesto] PRIMARY KEY  ([IdPuesto])
)
ALTER TABLE [Usuario].[TblPuesto] ADD CONSTRAINT [FM_TblPuesto_FechaModificacion] DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaModificacion]
GO
ALTER TABLE [Usuario].[TblPuesto] ADD CONSTRAINT [FA_TblPuesto_fechaAlta] DEFAULT ([dbo].[FnGetCurrentDate]()) FOR [FechaAlta]
GO
ALTER TABLE [Usuario].[TblPuesto] ADD CONSTRAINT [A_TblPuesto_Activo] DEFAULT ((1)) FOR [Activo]