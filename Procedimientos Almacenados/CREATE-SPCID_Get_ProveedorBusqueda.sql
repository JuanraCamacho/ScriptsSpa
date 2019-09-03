USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Get_ProveedorBusqueda]    Script Date: 03/09/2019 14:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Carlos
-- Create date: 29/08/2019
-- Description:	Obtener proveedores para buscar 
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Get_ProveedorBusqueda]
	 @Buscar 	NVARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	
    -- Insert statements for procedure here
	SELECT 
          A.[IdProveedor],
          [Clave],
          [NombreComercial],
          [RazonSocial],
          [Representante],
          [RFC],
          [Direccion],
          [Telefono],
          [CorreoElectronico],
          [CodigoPostal],
	      B.[IdPais],
		  B.[Descripcion] AS Pais,
		  C.[IdEstado],
          C.[Descripcion] AS Estado,
		  D.[IdMunicipio],
		  D.[Descripcion] AS Municipio

	FROM [Catalogo].[TblProveedor] A 
	JOIN [General].[TblPaises]B ON A.[IdPais] = B.[IdPais]
	JOIN [General].[TblEstados]C  ON A.[IdEstado] = C.[IdEstado] AND A.[IdPais] = C.[IdPais]
	JOIN [General].[TblMunicipios]D  ON A.[IdMunicipio] = D.[IdMunicipio] AND A.[IdEstado] = D.[IdEstado] AND A.[IdPais] = D.[IdPais]
	WHERE ([Clave] LIKE '%' + @Buscar + '%' OR ISNULL([NombreComercial], '') LIKE '%' + @Buscar + '%') AND A.[Activo] = 1
	ORDER BY [FechaAlta] ASC
END

