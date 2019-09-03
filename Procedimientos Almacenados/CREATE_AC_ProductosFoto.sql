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
-- Description:	<ALTAS Y CAMBIOS DE FOTO>
-- =============================================
CREATE PROCEDURE [Catalogo].[SPCID_AC_ProductoFoto]
	-- Add the parameters for the stored procedure here
	--@Opcion	INT, -- opc 1 actualizar,  opc 2 crear
	@IdUsuario	UNIQUEIDENTIFIER,
	@FotoBase64 VARCHAR(MAX),
	@UrlLocalImagen NVARCHAR(300)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorMessage NVARCHAR(4000),
			@ErrorSeverity INT,
			@ErrorState INT;
	DECLARE @Guid INT
	BEGIN TRAN
	BEGIN TRY
	

    -- Insert statements for procedure here
	--IF(@Opcion = 1)
		--BEGIN
		SET @Guid = (SELECT [IdProducto] FROM [Catalogo].[TblProducto] WHERE [Clave] = @Clave)
		IF EXISTS (SELECT [IdProducto] FROM [Catalogo].[TblProductoFoto] WHERE [IdProducto] = @Guid)
			BEGIN
				UPDATE [Catalogo].[TblProductoFoto]
					SET [FotoBase64] = @FotoBase64
					,[UrlLocalImagen] = @UrlLocalImagen
					,[FechaModificacion] = [dbo].[FnGetCurrentDate]()
					,[UsuarioModifico] = @IdUsuario
				WHERE [IdProducto] = @Guid

				SELECT 1
			END
			ELSE
			BEGIN
				INSERT INTO [Catalogo].[TblProductoFoto]
						   ([IdProducto],[FotoBase64],[UrlLocalImagen],[FechaModificacion],[UsuarioAlta],[UsuarioModifico])

					VALUES(@Guid,@FotoBase64,@UrlLocalImagen,[dbo].[FnGetCurrentDate](),@IdUsuario,@IdUsuario)

			SELECT 1
		END
			COMMIT TRAN
			END TRY
			BEGIN CATCH
				IF (@@TRANCOUNT > 0)
				BEGIN
					ROLLBACK TRAN
					END
					SET @ErrorMessage = ERROR_MESSAGE()
						SET @ErrorSeverity = ERROR_SEVERITY()
						SET @ErrorState = ERROR_STATE()
						RAISERROR ( @ErrorMessage,
									@ErrorSeverity,
									@ErrorState);
	END CATCH	
END
	
--exec [Catalogo].[SPCID_AC_ProductoFoto] 15,1,'imagenbase64','urldeimagen'
