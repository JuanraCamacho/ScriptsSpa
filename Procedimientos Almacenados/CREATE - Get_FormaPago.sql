USE [fincamo1_naturalwuane]
GO

/****** Object:  StoredProcedure [Catalogo].[SPCID_GET_FormaPago]    Script Date: 20/08/2019 10:22:59 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JM
-- Create date: 20/08/2019
-- Description:	MOSTRAR LAS FORMAS DE PAGO ACTIVAS
-- =============================================
CREATE PROCEDURE [Catalogo].[SPCID_Get_FormaPago]
AS
BEGIN
		SELECT [IdFormaPago]
			  ,[Nombre]
			  ,[Descripcion]
		FROM [Catalogo].[TblFormaPago]
		WHERE [Activo] = 1
END
GO