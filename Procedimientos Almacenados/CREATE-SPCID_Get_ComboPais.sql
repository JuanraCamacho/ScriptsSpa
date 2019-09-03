USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [General].[SPCID_Get_ComboPais]    Script Date: 03/09/2019 14:50:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Carlos
-- Create date: 01/09/2019
-- Description:	Obtiene el combo de pais
-- =============================================
ALTER PROCEDURE [General].[SPCID_Get_ComboPais]
	
AS
BEGIN

	SET NOCOUNT ON;
	SELECT
			[IdPais],
			[Descripcion]
	FROM	[General].[TblPaises] WHERE [Activo] = 1
	UNION 
	SELECT  0 IdPais
	,'SELECCIONE' Descripcion

	ORDER BY IdPais
		
END