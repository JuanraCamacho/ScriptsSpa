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
-- Author:		<cristian alexis montoya arguello>
-- Create date: <21/08/2019>
-- Description:	<Muestra los productos activos>
-- =============================================
CREATE PROCEDURE [Catalogo].[SPCID_Get_Producto] 
	-- Add the parameters for the stored procedure here
	--@IdProducto INT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdProducto]
		  ,CP.[Nombre]
		  ,[Clave]
		  ,P.[Nombre]
		  ,P.[Descripcion]
		  ,[Stock]
		  ,[StockMax]
		  ,[StockMin]
		  ,[PrecioPublico]
		  ,[PrecioMayoreo]
		  ,[PrecioMenudeo]
		  ,[CodigoBarras]
		  ,[UnidadMedida]
		  ,[ClaveSat]
		  ,[AplicaIva]
	FROM   [Catalogo].[TblProducto] AS P 
		JOIN [Catalogo].[TblCategoriaProducto] AS CP ON P.[IdCategoriaProducto] = CP.[IdCategoriaProducto]
	WHERE P.[Activo] = 1 AND CP.[Activo] = 1


END
GO
--exec [Catalogo].[SPCID_Get_Producto]
