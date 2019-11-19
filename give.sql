USE [sito_utags]
GO
/****** Object:  StoredProcedure [dbo].[give]    Script Date: 27/03/2017 13:47:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		LUIS FERNANDO PEREA GALLOSSO
-- Create date: 27 DE MARZO DEL 2017
-- Description:	LE DAS EL ALUMNO Y TE DA SU PASSWORD
--				SU NOMBRE Y SU CLAVE PERSONA
-- =================================================
ALTER PROCEDURE [dbo].[give]
	@matricula int
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	select top 1 p.cve_persona as id, p.nombre, p.apellido_paterno + ' '+p.apellido_materno  as apellidos, a.matricula as matricula, u.[password] as 'password'
	from persona p
	inner join alumno a on p.cve_persona = a.cve_alumno
	inner join usuario u on u.cve_persona = p.cve_persona
	where a.matricula = @matricula
	
	
END
