-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristian Alexis Montoya Arguello>
-- Create date: <26/08/2019>
-- Description:	<Combo de categorias>
-- =============================================
CREATE PROCEDURE [Catalogo].[SPCID_Get_ComboIva] 
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [IdTipoIva]
      , [Porcentaje]
	FROM  [Catalogo].[TblTipoIva] WHERE [Activo] = 1

	UNION 
	SELECT  0 [IdTipoIva]
	,0 [Porcentaje]

	ORDER BY [IdTipoIva]
	
	
END