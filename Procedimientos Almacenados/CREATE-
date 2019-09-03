USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Usuario].[SPCID_Get_Usuario]    Script Date: 03/09/2019 14:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Carlos
-- Create date: 22/08/2019
-- Description:	Obtener usuarios
-- =============================================
ALTER PROCEDURE [Usuario].[SPCID_Get_Usuario]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	  A.[IdCuentaUsuario],
	  [Cuenta],
	  [PasswordHash],
	  [PasswordHash] AS ContraseniaDos,
	  B.[IdRol],
	  B.[Nombre],
	  C.[IdEmpleado],
	  C.[Nombres]+ ' ' +[ApellidoPat]+' '+[ApellidoMat] AS Nombres


	FROM [Usuario].[TblUsuario] A 
	JOIN [Usuario].[TblRol]B ON A.[IdRol] = B.[IdRol]
	JOIN [Usuario].[TblEmpleado]C  ON A.[IdEmpleado] = C.[IdEmpleado]
	WHERE A.[Activo] = 1  

END


