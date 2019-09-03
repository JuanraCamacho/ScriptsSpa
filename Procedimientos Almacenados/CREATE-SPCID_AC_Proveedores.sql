USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_AC_Proveedores]    Script Date: 03/09/2019 14:39:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Carlos
-- Create date: 28/08/2019
-- Description:	Altas y actualización de proveedores
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_AC_Proveedores]
    @Opcion             INT,
    @IdProveedor		UNIQUEIDENTIFIER,
	@Clave				NVARCHAR (15),
	@NombreComercial	NVARCHAR (200),
	@RazonSocial		NVARCHAR (300),
	@Representante		NVARCHAR (150),
	@RFC				NVARCHAR (25),
	@Direccion			NVARCHAR (200),
	@Telefono			NVARCHAR (10),
	@CorreoElectronico  NVARCHAR (45),
	@CodigoPostal       NVARCHAR (45),
	@IdPais             INT,
	@IdEstado           INT,
	@IdMunicipio        INT,
	@IdUsuario          UNIQUEIDENTIFIER


AS

  BEGIN
      SET NOCOUNT ON 
	     DECLARE @FechaActual DATETIME = [dbo].[FnGetCurrentDate]();

		 IF NOT EXISTS ( SELECT * FROM [Catalogo].[TblProveedor] WHERE [NombreComercial] = @NombreComercial AND [Activo] = 1)
		   

		   BEGIN
		       IF @Opcion = 1
			     BEGIN
				   -- 2.- Insertar en cuenta 		
							   SET @IdProveedor = NEWID();
							   
									INSERT INTO [Catalogo].[TblProveedor]
									   (
									   [IdProveedor],
									   [Clave],
									   [NombreComercial],
									   [RazonSocial],
									   [Representante],
									   [RFC],
									   [Direccion],
									   [Telefono],
									   [CorreoElectronico],
									   [CodigoPostal],
									   [IdPais],
									   [IdEstado],
									   [IdMunicipio],
									   [FechaAlta],
									   [FechaModificacion],
									   [UsuarioModifico],
									   [UsuarioAlta],
									   [Activo]

									   )
		
									VALUES
	      							   (
									   @IdProveedor,
									   @Clave,
									   @NombreComercial,
									   @RazonSocial,
									   @Representante,
									   @RFC,
									   @Direccion,
									   @Telefono,
									   @CorreoElectronico,
									   @CodigoPostal,
									   @IdPais,
									   @IdEstado,
									   @IdMunicipio,
									   @FechaActual,
									   @FechaActual,
									   @IdUsuario,
									   @IdUSuario,
									   1
									   )

								-- 3.Retorna valor indicando que todo se registró bien
									SELECT 1	
                  END    
				END
					     ELSE
						   BEGIN
						       IF @Opcion = 2

							   BEGIN
							       --IF NOT EXISTS (SELECT * FROM [Catalogo].[TblProveedor] WHERE [IdProveedor] = @IdProveedor)
								     -- BEGIN
									  UPDATE	[Catalogo].[TblProveedor]
												SET	
												 [IdProveedor] = @IdProveedor,
												 [Clave] = @Clave,
												 [NombreComercial] = @NombreComercial,
												 [RazonSocial] = @RazonSocial,
												 [Representante] = @Representante,
												 [RFC] = @RFC,
												 [Direccion] = @Direccion,
												 [Telefono] = @Telefono,
												 [CorreoElectronico] = @CorreoElectronico,
												 [CodigoPostal] = @CodigoPostal,
												 [IdPais] = @IdPais,
												 [IdEstado] = @IdEstado,
												 [IdMunicipio] = @IdMunicipio,
												 [FechaModificacion] = @FechaActual,
												 [UsuarioModifico] = @IdUsuario
				
												 WHERE	[IdProveedor] = @IdProveedor AND [Activo] = 1
												
												 SELECT 1
									  --END
								   
							  END
					     END
END

	