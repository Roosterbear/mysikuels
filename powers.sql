USE [sito_utags]
GO
/****** Object:  StoredProcedure [dbo].[powers]    Script Date: 20/01/2020 8:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================
-- Author:		LUIS FERNANDO PEREA GALLOSSO
-- Create date: 20 DE ENERO DEL 2020
-- Description:	LE DAS 0 PARA QUITAR PERMISO O 1 PARA AGREGAR
--				LE DAS USUARIO Y PERMISO
-- ============================================================
ALTER PROCEDURE [dbo].[powers] 
	@accion int,
	@usuario int,
	@permiso int
	
AS
BEGIN	
	SET NOCOUNT ON;		
	declare @cve int;
	select @cve = cve_persona from empleado where cve_empleado = @usuario;
	
	if @accion > 0
		insert into usuario_grupo_seguridad (cve_persona,cve_grupo_seguridad) values  (@cve,@permiso)
	else
		delete from usuario_grupo_seguridad where cve_persona =  @cve and cve_grupo_seguridad = @permiso
END
