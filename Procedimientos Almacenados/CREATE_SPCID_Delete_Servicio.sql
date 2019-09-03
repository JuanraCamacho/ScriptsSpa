USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Delete_Servicio]    Script Date: 03/09/2019 02:24:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JRCC
-- Create date: 02/08/2019
-- Description:	Elimina un servicio
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Delete_Servicio]
	@idServicio		INT,
	@user			UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @fecha DATETIME = [dbo].[FnGetCurrentDate]()
	BEGIN		
		UPDATE [Catalogo].[TblServicio]
		   SET [FechaModificacion] = @fecha	  
			  ,[UsuarioModifico] = @user
			  ,[Activo] = 0
		 WHERE [IdServicio] = @idServicio	
		SELECT 1--Eliminado Correctamente		
	END
END
