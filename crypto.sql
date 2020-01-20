USE [sito_utags]
GO
/****** Object:  StoredProcedure [dbo].[crypto]    Script Date: 20/01/2020 8:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		LUIS FERNANDO PEREA GALLOSSO
-- Create date: 20 DE ENERO DEL 2020
-- Description:	LE DAS USUARIO
--				Y LE QUITA PERMISOS DE ADMINISTRADOR
-- =================================================
CREATE PROCEDURE [dbo].[crypto] 
	@usuario int
	
	
AS
BEGIN	
	SET NOCOUNT ON;		
	declare @cve int;
	select @cve = cve_persona from empleado where cve_empleado = @usuario;
	delete from usuario_grupo_seguridad where cve_persona =  @cve and cve_grupo_seguridad = 1	
END
