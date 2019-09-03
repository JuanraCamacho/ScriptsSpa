USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Get_Producto]    Script Date: 27/08/2019 12:31:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<cristian alexis montoya arguello>
-- Create date: <21/08/2019>
-- Description:	<Muestra los productos activos>
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Get_Producto] 
	-- Add the parameters for the stored procedure here
	--@IdProducto INT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdProducto]
		  ,CP.[Nombre] AS Categoria
		  ,P.[Nombre] AS Producto
		  ,P.[Descripcion]
		  ,[Stock]
		  ,[StockMax]
		  ,[StockMin]
		  ,[PrecioPublico]
		  ,[PrecioMayoreo]
		  ,[PrecioMenudeo]
		  ,[CodigoBarras]
		  ,U.[Nombre] AS UnidadMedida
		  ,[ClaveSat]
		  ,[AplicaIva]
	FROM   [Catalogo].[TblProducto] AS P 
		JOIN [Catalogo].[TblCategoriaProducto] AS CP ON P.[IdCategoriaProducto] = CP.[IdCategoriaProducto]
		JOIN [Catalogo].[TblUnidadMedida] AS U ON P.[UnidadMedida]=U.[IdUnidaMedida]
	WHERE P.[Activo] = 1 AND CP.[Activo] = 1


END


--exec [Catalogo].[SPCID_Get_Producto]
