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
-- Create date: <20/08/2019>
-- Description:	<Muestra los productos activos>
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Get_ProductoXId] 
	-- Add the parameters for the stored procedure here
	@IdProducto INT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.[IdProducto]
		  ,CP.[Nombre]
		  ,[Clave]
		  ,A.[Nombre]
		  ,A.[Descripcion]
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
		  ,IIF(B.[FotoBase64] IS NULL, '', B.[FotoBase64]) AS FotoBase64
		 ,IIF(B.[UrlLocalImagen] IS NULL, '', B.[UrlLocalImagen]) AS UrlLocalImagen
	FROM   [Catalogo].[TblProducto] AS A LEFT JOIN [Catalogo].[TblProductoFoto] B
			ON A.[IdProducto] = B.[IdProducto]
		JOIN [Catalogo].[TblCategoriaProducto] CP ON A.[IdCategoriaProducto] = CP.[IdCategoriaProducto]
	WHERE A.[Activo] = 1 AND A.[IdProducto] = @IdProducto


END
GO
--exec [Catalogo].[SPCID_Get_ProductoXId] 1