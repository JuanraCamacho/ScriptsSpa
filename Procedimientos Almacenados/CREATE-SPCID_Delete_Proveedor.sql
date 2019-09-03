USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Delete_Proveedor]    Script Date: 03/09/2019 14:41:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Carlos
-- Create date: 28/08/2019
-- Description:	Eliminar un proveedor
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Delete_Proveedor]
	@IdProveedor	    UNIQUEIDENTIFIER,
	@IdUsuario		    UNIQUEIDENTIFIER
AS
BEGIN
	
	SET NOCOUNT ON;

   DECLARE @FechaActual DATETIME = [dbo].[FnGetCurrentDate]()
		
		UPDATE [Catalogo].[TblProveedor]
		   SET [FechaModificacion] = @FechaActual	  
			  ,[UsuarioModifico] = @IdUsuario
			  ,[Activo] = 0
		 WHERE [IdProveedor] = @IdProveedor

	 SELECT @@ROWCOUNT --Eliminado Correctamente					
END