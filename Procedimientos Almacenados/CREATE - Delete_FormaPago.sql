USE [fincamo1_naturalwuane]
GO

/****** Object:  StoredProcedure [Catalogo].[SPCID_DELETE_FormaPago]    Script Date: 20/08/2019 10:22:59 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JM
-- Create date: 20/08/2019
-- Description:	ELIMINAR UNA FORMA DE PAGOS
-- =============================================
CREATE PROCEDURE [Catalogo].[SPCID_Delete_FormaPago]
	@IdFormaPago		INT,
	@Usuario			INT
AS
BEGIN
			UPDATE [Catalogo].[TblFormaPago]
			   SET [Activo] = 0
				  ,[FechaModificacion] = [dbo].[FnGetCurrentDate]()
				  ,[UsuarioModifico] = @Usuario
			 WHERE [IdFormaPago] = @IdFormaPago
END
GO