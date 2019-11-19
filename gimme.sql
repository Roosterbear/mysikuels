USE [sito_utags]
GO
/****** Object:  StoredProcedure [dbo].[gimme]    Script Date: 01/09/2016 13:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		LUIS FERNANDO PEREA GALLOSSO
-- Create date: 02 DE SEPTIEMBRE DEL 2016
-- Description:	LE DAS EL USUARIO Y TE DA SU PASSWORD
--				SU NOMBRE Y SU CLAVE PERSONA
-- =================================================
ALTER PROCEDURE [dbo].[gimme]
	@usuario int
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	select top 1 p.cve_persona as id, p.nombre, p.apellido_paterno + ' '+p.apellido_materno as apellidos, e.cve_empleado as empleado, u.[password] as 'password'
	from persona p
	inner join empleado e on p.cve_persona = e.cve_persona
	inner join usuario u on u.cve_persona = p.cve_persona
	where e.cve_empleado = @usuario
	
	
END
