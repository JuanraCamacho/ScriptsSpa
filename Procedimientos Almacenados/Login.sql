USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [dbo].[SPCID_Login]    Script Date: 20/08/2019 10:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JLGG
-- Create date: 19/08/2019
-- Description:	LOGIN
-- =============================================
ALTER PROCEDURE [dbo].[SPCID_Login]
	@Cuenta		VARCHAR(20),
	@Password	VARCHAR(70)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IdCuentaUsuario INT = 0,
			@IdRol			 INT = 0,
			@FechaSistema	 DATETIME = GETDATE(),
			@IdEmpleado		 UNIQUEIDENTIFIER 
	
	
    SELECT @IdCuentaUsuario = A.[IdCuentaUsuario] FROM [Usuario].[TblCuentaUsuario] A WHERE PWDCOMPARE(@Password, A.[PasswordHash]) = 1 AND [Cuenta] = @Cuenta AND [Vigente] = 1
	IF @IdCuentaUsuario <> 0
	BEGIN
		SELECT @IdEmpleado = [IdEmpleado] FROM [Usuario].[TblCuentaUsuario] 
		WHERE PWDCOMPARE(@Password, [PasswordHash]) = 1 AND [Vigente] = 1
		IF @IdEmpleado <> NULL
		BEGIN
			SELECT @IdCuentaUsuario = [IdCuentaUsuario], @IdRol = [IdRol] FROM [Usuario].[TblCuentaUsuario]
			WHERE PWDCOMPARE(@Password, [PasswordHash]) = 1 AND [Vigente] = 1

			SELECT CONVERT(INT, 1) IsValid,
					@IdCuentaUsuario,
					@IdRol,
					[IdEmpleado],
					[Nombres]
					FROM [Usuario].[TblEmpleado]
					WHERE [IdEmpleado] = @IdEmpleado
		END
		ELSE
		BEGIN
			--EL USUARIO NO ESTA ASIGNADO A UN EMPLEADO
			SELECT 10 IsValid
		END
	END
	ELSE
	BEGIN

		SELECT @IdCuentaUsuario = A.[IdCuentaUsuario] FROM [Usuario].[TblCuentaUsuario] A WHERE [Cuenta] = @Cuenta
		IF @IdCuentaUsuario <> 0
		BEGIN
			UPDATE [Usuario].[TblCuentaUsuario] SET [Intentos] = [Intentos] + 1 WHERE [IdCuentaUsuario] = @IdCuentaUsuario
			IF(SELECT [Intentos] FROM [Usuario].[TblCuentaUsuario] WHERE [IdCuentaUsuario] = @IdCuentaUsuario) = 20
			BEGIN
				SELECT 8 IsValid --LA CUENTA HA SIDO BLOQUEADA
			END
			ELSE 
			BEGIN
				SELECT -7 IsValid --CONTRASEÑA INCORRECTA
			END
		END
		ELSE
			SELECT 9 IsValid --LA CUENTA NO EXISTE
	END
END
