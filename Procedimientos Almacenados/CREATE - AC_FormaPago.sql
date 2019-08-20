USE [fincamo1_naturalwuane]
GO

/****** Object:  StoredProcedure [Catalogo].[SPCID_AC_FormaPago]    Script Date: 20/08/2019 10:22:59 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JM
-- Create date: 20/08/2019
-- Description:	AC DE FORMA DE PAGOS
-- =============================================
CREATE PROCEDURE [Catalogo].[SPCID_AC_FormaPago]
	@IdFormaPago		INT,
	@Nombre				VARCHAR(80),
	@Descripcion		NVARCHAR(300),
	@Opcion				INT,
	@Usuario			INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--ALTA NUEVA FORMA DE PAGO
	 IF(@Opcion = 1)
	 BEGIN
		IF NOT EXISTS (SELECT * FROM [TblFormaPago] WHERE [Nombre] = @Nombre AND Activo = 1)
		BEGIN
			INSERT INTO [Catalogo].[TblFormaPago]
					   ([Nombre]
					   ,[Descripcion]
					   ,[UsuarioAlta]
					   ,[UsuarioModifico])
				 VALUES
					   (@Nombre
					   ,@Descripcion
					   ,@Usuario
					   ,@Usuario
					   )

			SELECT 1 -- DATOS GUARDADOS
		END
		ELSE
			SELECT 0 -- EL NOMBRE YA EXISTE EN LOS REGISTROS
	 END
	 ELSE 
	 IF(@Opcion = 2)
	 BEGIN
		IF NOT EXISTS (SELECT * FROM [TblFormaPago] WHERE [Nombre] = @Nombre AND [IdFormaPago] = @IdFormaPago AND Activo = 1)
		BEGIN

			UPDATE [Catalogo].[TblFormaPago]
			   SET [Nombre] = @Nombre
				  ,[Descripcion] = @Descripcion
				  ,[FechaModificacion] = [dbo].[FnGetCurrentDate]()
				  ,[UsuarioModifico] = @Usuario
			 WHERE [IdFormaPago] = @IdFormaPago
			
			SELECT 1 -- DATOS GUARDADOS
		END
		ELSE
			SELECT 0 -- EL NOMBRE YA EXISTE EN LOS REGISTROS
	 END
END
GO