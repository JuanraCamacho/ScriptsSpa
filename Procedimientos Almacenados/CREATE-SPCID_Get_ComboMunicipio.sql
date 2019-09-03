USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [General].[SPCID_Get_ComboMunicipio]    Script Date: 03/09/2019 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Carlos
-- Create date: 01/09/2019
-- Description:	Obtiene el combo de municipio
-- =============================================
ALTER PROCEDURE [General].[SPCID_Get_ComboMunicipio]
	@IdEstado  INT
	

AS
BEGIN

	SET NOCOUNT ON;
	SELECT
			[IdMunicipio],
			[Descripcion]
	FROM	[General].[TblMunicipios] WHERE [Activo] = 1 AND [IdEstado] = @IdEstado
	UNION 
	SELECT  0 IdMunicipio
	,'SELECCIONE' Descripcion

	ORDER BY IdMunicipio

END