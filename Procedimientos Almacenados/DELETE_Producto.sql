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
-- Author:		<CRISTIAN ALEXIS MONTOYA ARGUELLO>
-- Create date: <20/08/2019>
-- Description:	<ELIMINA PRODUCTOS>
-- =============================================
CREATE PROCEDURE [Catalogo].[SPCID_Delete_Producto]
	@IdProducto		INT,
	@Usuario		INT
AS
BEGIN
			UPDATE [Catalogo].[TblProducto]
			   SET [Activo] = 0
				  ,[FechaModificacion] = [dbo].[FnGetCurrentDate]()
				  ,[UsuarioModifico] = @Usuario
			 WHERE [IdProducto]=@IdProducto
			 SELECT 1 --SE ELIMINO
END

--exec [Catalogo].[SPCID_Delete_Producto] 2,1