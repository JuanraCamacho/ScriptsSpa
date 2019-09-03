USE [fincamo1_naturalwuane]
GO
/****** Object:  StoredProcedure [Catalogo].[SPCID_Get_Servicio]    Script Date: 03/09/2019 03:05:33 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JRCC
-- Create date: 27/08/2019
-- Description:	Muestra los servicios activos
-- =============================================
ALTER PROCEDURE [Catalogo].[SPCID_Get_Servicio]
AS
BEGIN
	SELECT 
	   A.[IdServicio]
      ,A.[IdTipoServicio]
      ,A.[IdTipoIva]
	  ,A.[Clave]
	  ,B.[Nombre] TipoServicio
	  ,A.[Nombre]
	  ,A.[Precio]
	  ,CONVERT(NVARCHAR(8), A.[Duracion]) Duracion
	  --,A.[Duracion]
	  ,A.[Descripcion]
	  ,C.[Porcentaje]
	  ,C.[Descripcion] DescIva                            
      ,A.[AplicaIva]
      ,A.[AplicaIEPS]
      ,A.[IEPSMonto] 
      ,A.[IEPS]    
	  ,ISNULL (D.[FotoBase64],'') FotoBase64
	  ,ISNULL (D.[UrlLocalImagen],'') UrlLocalImagen
	FROM [Catalogo].[TblServicio] A
	JOIN [Catalogo].[TblTipoServicio] B ON A.IdTipoServicio = B.IdTipoServicio
	JOIN [Catalogo].[TblTipoIva] C ON A.[IdTipoIva] = C.[IdTipoIva]
	LEFT JOIN [Catalogo].[TblServicioFoto] D ON A.[IdServicio] = D.[IdServicio]
	WHERE A.[Activo] = 1		  
END


