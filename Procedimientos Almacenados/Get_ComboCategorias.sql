USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Get_ComboCategoria]    Script Date: 27/08/2019 12:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristian Alexis Montoya Arguello>
-- Create date: <26/08/2019>
-- Description:	<Combo de categorias>
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Get_ComboCategoria] 
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [IdCategoriaProducto] IdCategoria
      ,[Nombre] Nombre
	FROM [Catalogo].[TblCategoriaProducto] WHERE [Activo] = 1

	UNION 
	SELECT  0 IdCategoria
	,'SELECCIONE' Nombre

	ORDER BY IdCategoria
	
	
END