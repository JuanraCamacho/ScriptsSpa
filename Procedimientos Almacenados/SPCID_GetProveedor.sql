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
-- Author:		<ALEXIS MONTOYA>
-- Create date: <30/08/2019>
-- Description:	<Obtiene los datos del proveedor>
-- =============================================
CREATE PROCEDURE [Compra].[SPCID_GetProveedor]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
			[IdProveedor],
			[Clave],
			[NombreComercial],
			[RazonSocial],
			[Representante],
			[Direccion],
			[Telefono],
			[CorreoElectronico],
			PS.[Descripcion] AS Pais,
			E.[Descripcion] AS Estado,
			M.[Descripcion] AS Municipio

	FROM [Catalogo].[TblProveedor] AS PR
		 JOIN [General].[TblPaises] AS PS ON PR.IdPais=PS.[IdPais]
		 JOIN [General].[TblEstados] AS E ON E.[IdEstado]=PR.[IdEstado]
		 JOIN [General].[TblMunicipios] AS M ON M.[IdMunicipio]=PR.IdMunicipio
	WHERE PR.[Activo]=1 AND PS.Activo=1 AND E.Activo=1 AND M.[Activo]=1
	
END
GO
