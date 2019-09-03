USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Get_ComboTipoServicio]    Script Date: 03/09/2019 03:04:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JRCC
-- Create date: 30/08/2019
-- Description:	Combo de tipos de servicios
-- =============================================
ALTER  PROCEDURE [Catalogo].[SPCID_Get_ComboTipoServicio] 
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [IdTipoServicio]
      , [Nombre] NombreTipoServicio
	FROM  [Catalogo].[TblTipoServicio] WHERE [Activo] = 1	

	UNION 
	SELECT  1 [IdTipoServicio]
	,  'Sin asignar' NombreTipoServicio
	ORDER BY [IdTipoServicio]
	
	
END