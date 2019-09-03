USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Get_ComboCategoria]    Script Date: 27/08/2019 12:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristian Alexis Montoya Arguello>
-- Create date: <27/08/2019>
-- Description:	<Combo de Unidad de Medida>
-- =============================================
CREATE PROCEDURE [Catalogo].[SPCID_Get_ComboUnidadMedida] 
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [IdUnidaMedida]  IdUnidadMedida
      ,[Nombre] Nombre
	FROM [Catalogo].[TblUnidadMedida] WHERE [Activo] = 1

	UNION 
	SELECT  0 IdUnidadMedida
	,'SELECCIONE' Nombre

	ORDER BY IdUnidadMedida
	
	
END