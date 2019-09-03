USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_AC_Producto]    Script Date: 27/08/2019 11:51:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristian Alexis Montoya Arguello>
-- Create date: <20/08/2019>
-- Description:	<Altas y Cambios de productos>
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_AC_Producto]
	-- Add the parameters for the stored procedure here
	@Opcion			 INT,--Opcion=1 Alta, opcion 2= Cambios
	@IdProducto		 INT,
	@Categoria		 INT,
	@Nombre			 NVARCHAR(200),
	@Descripcion	 NVARCHAR(300),
	@Stock			 BIT,
	@StockMax		 MONEY,
	@StockMin		 MONEY,
	@PrecioPublico   MONEY,
	@PrecioMayoreo   MONEY,
	@PrecioMenudeo   MONEY,
	@CodigoBarras	 NVARCHAR(50),
	@UnidadMedida	 INT,
	@ClaveSat		 INT,
	@AplicaIva		 BIT,
	--@IEPS			 BIT,
	--@Activo			 BIT,
	@Usuario	     UNIQUEIDENTIFIER

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	IF (@Opcion = 1) --Alta
		BEGIN
		IF NOT EXISTS (SELECT * FROM [Catalogo].[TblProducto] WHERE [Nombre]=@Nombre AND [Activo]=1)
			BEGIN
				INSERT INTO [Catalogo].[TblProducto](
							[IdCategoriaProducto],
							[Nombre],
							[Descripcion],
							[Stock],
							[StockMax],
							[StockMin],
							[PrecioPublico],
							[PrecioMayoreo],
							[PrecioMenudeo],
							[CodigoBarras],
							[UnidadMedida],
							[ClaveSat],
							[AplicaIva],
							[UsuarioAlta],
							[UsuarioModifico])
					VALUES (
							@Categoria,
							@Nombre,
							@Descripcion,
							@Stock,
							@StockMax,
							@StockMin,
							@PrecioPublico,
							@PrecioMayoreo,
							@PrecioMenudeo,
							@CodigoBarras,
							@UnidadMedida,
							@ClaveSat,
							@AplicaIva,
							@Usuario,
							@Usuario)

				SELECT 1 --DATOS GUARDADOS
		END 
		ELSE 
			SELECT 0 --DATOS NO GUARDADOS
	END
	ELSE
	IF (@Opcion = 2)--CAMBIOS
	BEGIN
		IF NOT EXISTS (SELECT * FROM [Catalogo].[TblProducto] WHERE [Nombre]=@Nombre AND [Activo]=1)
		BEGIN
			UPDATE	[Catalogo].[TblProducto]
			SET		[IdCategoriaProducto]=@Categoria,
					[Nombre]=@Nombre,
					[Descripcion]=@Descripcion,
					[Stock]=@Stock,
					[StockMax]=@StockMax,
					[StockMin]=@StockMin,
					[PrecioPublico]=@PrecioPublico,
					[PrecioMayoreo]=@PrecioMayoreo,
					[PrecioMenudeo]=@PrecioMenudeo,
					[CodigoBarras]=@CodigoBarras,
					[UnidadMedida]=@UnidadMedida,
					[ClaveSat]=@ClaveSat,
					[AplicaIva]=@AplicaIva,
					[UsuarioModifico]=@Usuario

			WHERE	[IdProducto]=@IdProducto AND [Activo]=1

			SELECT 1 --DATOS GUARDADOS
			
		END
		ELSE
		SELECT 0 --EL NOMBRE YA EXISTE
	END
END


--exec [Catalogo].[SPCID_AC_Producto] 2,3,1,15,'testnom3','testdesc',1,50,10,20,30,40,4687,'kilo',79989,1,1,1