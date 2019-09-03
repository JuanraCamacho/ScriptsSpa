USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_AC_Servicio]    Script Date: 03/09/2019 02:21:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JRCC
-- Create date: 28/08/2019
-- Description:	Altas y cambios del catalogo de servicio
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_AC_Servicio]
	@opcion				INT,	
	@idServicio			INT,
	@idTipoServicio		INT,
	@idTipoIva			INT,
	@clave				NVARCHAR(20),
	@nombre				NVARCHAR(200),
	@desc				NVARCHAR(300),
	@precio				MONEY,
	@duracion			TIME(7),
	@aplicaIva			BIT,
	@aplicaIEPS			BIT,
	@iEPSMonto			BIT,
	@iEPS				DECIMAL(4,2),
	@user				UNIQUEIDENTIFIER,
	@UpdateFoto			BIT,
	@fotob64			NVARCHAR(MAX),
	@urlFoto			NVARCHAR(300)

AS
BEGIN

	SET NOCOUNT ON;	
	DECLARE @fecha DATETIME = [dbo].[FnGetCurrentDate]()
	DECLARE @idSFoto INT 
	SET @idSFoto = (SELECT MAX([IdServicio])  FROM Catalogo.TblServicio)+1	
	BEGIN TRY
		BEGIN TRAN
			IF @opcion = 1
			BEGIN
				IF NOT EXISTS (SELECT * FROM [Catalogo].TblServicio WHERE [Nombre] = @nombre AND [Activo] = 1)
				BEGIN
					INSERT INTO Catalogo.TblServicio
					(
					IdTipoServicio,
					IdTipoIva,
					Clave,
					Nombre,
					Descripcion,
					Precio,
					Duracion,
					AplicaIva,
					AplicaIEPS,
					IEPSMonto,
					IEPS,
					FechaAlta,
					FechaModificacion,
					UsuarioAlta,
					UsuarioModifico	    
					)
					VALUES
					(   @idTipoServicio,         -- IdTipoServicio - int
					@idTipoIva,         -- IdTipoIva - int
					@clave,       -- Clave - nvarchar(15)
					@nombre,       -- Nombre - nvarchar(200)
					@desc,       -- Descripcion - nvarchar(300)
					@precio,      -- Precio - money
					@duracion,      -- Duracion - decimal(4, 2)
					@aplicaIva,      -- AplicaIva - bit
					@aplicaIEPS,      -- AplicaIEPS - bit
					@iEPSMonto,      -- IEPSMonto - bit
					@iEPS,      -- IEPS - decimal(4, 2)
					@fecha, -- FechaAlta - datetime
					@fecha, -- FechaModificacion - datetime
					@user,      -- UsuarioAlta - uniqueidentifier
					@user      -- UsuarioModifico - uniqueidentifier
					)

					INSERT INTO [Catalogo].[TblServicioFoto]
				   ([IdServicio]
				   ,[FotoBase64]
				   ,[UrlLocalImagen]				   
				   ,[FechaAlta]
				   ,[FechaModificacion]
				   ,[UsuarioAlta]
				   ,[UsuarioModifico])
					VALUES
				   (@idSFoto
				   ,@fotob64
				   ,@urlFoto			  
				   ,@fecha
				   ,@fecha
				   ,@user
				   ,@user)
					SELECT 1
				END	
				ELSE
				BEGIN
					SELECT 0 -- Ya existe el servicio
				END						
			END
			ELSE IF @opcion = 2
				BEGIN
					UPDATE [Catalogo].[TblServicio]
					   SET [IdTipoServicio] = @idTipoServicio
						  ,[IdTipoIva] = @idTipoIva
						  ,[Clave] = @clave
						  ,[Nombre] = @nombre
						  ,[Descripcion] = @desc
						  ,[Precio] = @precio
						  ,[Duracion] = @duracion
						  ,[AplicaIva] = @aplicaIva
						  ,[AplicaIEPS] = @aplicaIEPS
						  ,[IEPSMonto] = @iEPSMonto
						  ,[IEPS] = @iEPS			  
						  ,[FechaModificacion] = @fecha			  
						  ,[UsuarioModifico] = @user			 
					 WHERE [IdServicio] = @idServicio

					 UPDATE [Catalogo].[TblServicioFoto]
					   SET [IdServicio] = @idServicio
						  ,[FotoBase64] = @fotob64
						  ,[UrlLocalImagen] = @urlFoto							  						 
						  ,[FechaModificacion] = @fecha			  
						  ,[UsuarioModifico] = @user
					 WHERE [IdServicio] = @idServicio
					SELECT 1
				END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH
END
