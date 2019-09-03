USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Get_CategoriaProducto]    Script Date: 03/09/2019 02:25:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JRCC
-- Create date: 22/08/2019
-- Description:	Muestra las categorías de productos que estan activas
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Get_CategoriaProducto]
AS
BEGIN
	SELECT [IdCategoriaProducto]
		  ,[Nombre]
		  ,[Descripcion]
		  --,[FechaAlta]
		  --,[FechaModificacion]
		  --,[UsuarioAlta]
		  --,[UsuarioModifico]
		  --,[Activo]
	  FROM [Catalogo].[TblCategoriaProducto]
	  WHERE [Activo] = 1
	  ORDER BY [FechaAlta] DESC
END
