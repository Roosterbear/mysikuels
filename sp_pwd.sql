USE [sito_utags]
GO
/****** Object:  StoredProcedure [dbo].[pwd]    Script Date: 21/09/2018 8:21:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		LUIS FERNANDO PEREA GALLOSSO
-- Create date: 21 DE SEPTIEMBRE DEL 2018
-- Description:	LE DAS LA MATRICULA Y OBTIENE 
--				LA CLAVE PARA SISTEMAS CON MD5
-- =================================================
ALTER PROCEDURE [dbo].[pwd] 
	@matricula int
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	declare @alumnada varchar(20);
	declare @cve int;
	set @alumnada = 'alumnada';
	select @cve = isnull(cve_alumno,0) from alumno where matricula = @matricula
	if @cve > 0
		select substring(master.dbo.fn_varbintohexstr(HashBytes('md5',@alumnada+convert(varchar,cve_alumno))),5,8) as clave from alumno where matricula = @matricula
	else
		select 'fuck'	
END
