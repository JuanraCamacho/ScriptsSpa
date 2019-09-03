USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_AC_CategoriaProducto]    Script Date: 03/09/2019 02:20:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JRCC
-- Create date: 20/08/2019
-- Description:	Altas y cambios del catalogo de categorias de productos
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_AC_CategoriaProducto]
	@opcion			INT,
	@idCategoria	INT,
	@nombre			VARCHAR(200),
	@desc			VARCHAR(300),
	@user			UNIQUEIDENTIFIER
AS
BEGIN
	
	SET NOCOUNT ON;	
	DECLARE @fecha DATETIME = [dbo].[FnGetCurrentDate]()
	IF @opcion = 1--Altas
	BEGIN
		IF NOT EXISTS (SELECT * FROM [Catalogo].[TblCategoriaProducto] WHERE [Nombre] = @nombre AND Activo = 1)
		BEGIN
			INSERT INTO [Catalogo].[TblCategoriaProducto]
			   ([Nombre]
			   ,[Descripcion]           
			   ,[UsuarioAlta]
			   ,[UsuarioModifico]
			   )
			VALUES
			   (@nombre
			   ,@desc           
			   ,@user
			   ,@user
			   )
			   SELECT 1 --CORRECTO
		END
		ELSE
		BEGIN
			SELECT 0-- Ya existe esta categoria
		END
	END
	ELSE
	IF @opcion = 2 --Cambios
	BEGIN
		--IF NOT EXISTS (SELECT * FROM [Catalogo].[TblCategoriaProducto] WHERE [Nombre] = @nombre AND Activo = 1)
		--BEGIN
			UPDATE [Catalogo].[TblCategoriaProducto]
			   SET [Nombre] = @nombre
				  ,[Descripcion] = @desc			  
				  ,[FechaModificacion] = @fecha			  
				  ,[UsuarioModifico] = @user			  
			 WHERE [IdCategoriaProducto] = @idCategoria
			 SELECT 1 --Datos Modificados Correctamente
		--END
		--ELSE
		--BEGIN		
		--	SELECT 0 --El nombre ya existe	
		--END
	END	    
END
