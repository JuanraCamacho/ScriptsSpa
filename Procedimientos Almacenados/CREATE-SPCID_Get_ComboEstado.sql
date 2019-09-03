USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [General].[SPCID_Get_ComboEstado]    Script Date: 03/09/2019 14:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Carlos
-- Create date: 01/09/2019
-- Description:	Obtiene el combo de estado
-- =============================================
ALTER PROCEDURE [General].[SPCID_Get_ComboEstado]
	@IdPais  INT
AS
BEGIN

	SET NOCOUNT ON;
	SELECT
			[IdEstado],
			[Descripcion]
	FROM	[General].[TblEstados] WHERE [Activo] = 1 AND [IdPais] = @IdPais
	UNION 
	SELECT  0 IdEstado
	,'SELECCIONE' Descripcion

	ORDER BY IdEstado
		
END