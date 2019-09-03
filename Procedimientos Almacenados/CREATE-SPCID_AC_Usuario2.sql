USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Usuario].[SPCID_AC_Usuario2]    Script Date: 03/09/2019 14:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Carlos
-- Create date: 21/08/2019
-- Description:	Altas y actualización de usuarios
-- =============================================
ALTER PROCEDURE [Usuario].[SPCID_AC_Usuario2]
    @Opcion INT,	
	@IdCuentaUsuario UNIQUEIDENTIFIER,
	@Cuenta VARCHAR(30),
	@Password NVARCHAR(70),	
	@IdUsuario UNIQUEIDENTIFIER,
	@IdRol INT,
	@IdEmpleado UNIQUEIDENTIFIER
	
AS
BEGIN
	
	SET NOCOUNT ON
	DECLARE @FechaActual DATETIME = [dbo].[FnGetCurrentDate]();
	DECLARE @Hash VARBINARY(MAX)
	DECLARE @Salt VARBINARY(4) = CRYPT_GEN_RANDOM(4)

	IF @Opcion = 1
	BEGIN
		IF NOT EXISTS (SELECT * FROM [Usuario].[TblUsuario] WHERE [Cuenta] = @Cuenta AND [Activo] = 1) 
		 BEGIN
			SET @IdCuentaUsuario = NEWID()	
			SET @Hash =  0x0200 + @Salt + HASHBYTES('SHA2_512', CAST(@Password AS VARBINARY(MAX)) + @Salt);				
			
				INSERT INTO [Usuario].[TblUsuario]
					([IdCuentaUsuario],
					[Cuenta], 
					[PasswordHash], 
					[Vigente],
					[Intentos], 
					[Guid],
					[FechaModificacion],
					[FechaAlta], 
					[UsuarioModifico],
					[UsuarioAlta],
					[IdRol],
					[IdEmpleado])		
				VALUES
	      			(@IdCuentaUsuario, 
					@Cuenta, 
					@Hash, 
					1,
					0,
					NEWID(),
					@FechaActual,
					@FechaActual,
					@IdUsuario, 
					@IdUsuario, 
					@IdRol,
					@IdEmpleado)

				--SELECT @IdCuentaUsuario -- 3. Recuperar el Id Insertado Y retorna valor indicando que todo se registró bien
				SELECT @@ROWCOUNT	
		 END
		 ELSE
		 BEGIN
			SELECT 0 --Ya existe la cuenta
		 END
	END
	ELSE IF @Opcion = 2
	BEGIN
		IF NOT EXISTS (SELECT * FROM [Usuario].[TblUsuario] WHERE [Cuenta] = @Cuenta AND [IdCuentaUsuario] = @IdCuentaUsuario)
		BEGIN
			SELECT 0--La cuenta no existe
		END
		ELSE 
		BEGIN
			--2.- Verificar si se actualizará la contraseña
			IF LEN(@Password) = 0 OR @Password IS NULL
			BEGIN
				-- 3.- Actualizar datos de la cuenta sin modificar contraseña
				UPDATE	[Usuario].[TblUsuario]
				SET		[Cuenta] = @Cuenta,
						[FechaModificacion] = [dbo].[FnGetCurrentDate](),
						[UsuarioModifico] = @IdUsuario,
						[IdRol] = @IdRol,
						[IdEmpleado] = @IdEmpleado
				WHERE	[IdCuentaUsuario] = @IdCuentaUsuario	
				SELECT  1				
			END
			ELSE
			BEGIN
				-- 3.- Actualizar datos de la cuenta modificando contraseña
				SET @Salt = CRYPT_GEN_RANDOM(4);
				SET @Hash =  0x0200 + @Salt + HASHBYTES('SHA2_512', CAST(@Password AS VARBINARY(MAX)) + @Salt);

     			UPDATE	[Usuario].[TblUsuario]
				SET    [Cuenta] = @Cuenta,
					[PasswordHash] = @Hash,
					[FechaModificacion] = [dbo].[FnGetCurrentDate](),
					[UsuarioModifico] = @IdUsuario,
					[IdRol] = @IdRol,
					[IdEmpleado] = @IdEmpleado
					WHERE	[IdCuentaUsuario] = @IdCuentaUsuario
					SELECT 1
			END	
		END												 
	END
END



	
	