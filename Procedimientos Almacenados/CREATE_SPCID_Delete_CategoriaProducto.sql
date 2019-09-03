USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Delete_CategoriaProducto]    Script Date: 03/09/2019 02:22:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JRCC
-- Create date: 20/08/2019
-- Description:	Elimina un categoría de productos
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Delete_CategoriaProducto]
	@idCategoria	INT,
	@user			UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @fecha DATETIME = [dbo].[FnGetCurrentDate]()
	IF NOT EXISTS(SELECT * FROM [Catalogo].[TblProducto] WHERE [IdCategoriaProducto] = @idCategoria AND [Activo] = 1)
	BEGIN
		UPDATE [Catalogo].[TblCategoriaProducto]
		   SET [FechaModificacion] = @fecha	  
			  ,[UsuarioModifico] = @user
			  ,[Activo] = 0
		 WHERE [IdCategoriaProducto] = @idCategoria	
		SELECT 1--Eliminado Correctamente		
	END
	ELSE
	BEGIN
		SELECT 0 --Categoria contiene productos
	END
END
