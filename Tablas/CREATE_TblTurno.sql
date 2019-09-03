CREATE TABLE [Usuario].[TblTurno]
(
	[IdTurnoHorario] [INT]IDENTITY (1,1),
	[Turno] [NVARCHAR](50),
	[Descripcion] [NVARCHAR](100)
	CONSTRAINT [PK_IdTurno] PRIMARY KEY  ([IdTurnoHorario])
)