select 
/* HAY APELLIDOS QUE SALEN CON UN GUION, SE LOS QUITO PARA QUE NO DEN PROBLEMAS CON EXCEL */
(replace(p.apellido_paterno,'-','')+' '+apellido_materno+' '+p.nombre) as nombre
,p.curp
,ba.matricula
/* CONVIERTO LA FECHA A UN FORMATO MAS BONITO Y SIN LA HORA */
,CONVERT(VARCHAR(10), p.fecha_nacimiento, 103) as fecha_nacimiento
/* DE LA CURP SACO EL ESTADO DONDE NACIO */
,SUBSTRING(p.curp,12,2) as lugar_nacimiento
,colonia.nombre as fraccionamiento
,dg.calle
,dg.numeroExterior as numero_exterior
,colonia.codigo_postal as codigo_postal
,bc.porcentaje
,CONVERT(VARCHAR(10), ba.fecha, 103) as fecha_inicio
from beca_asignada as ba
inner join alumno a on a.matricula = ba.matricula
inner join persona p on p.cve_persona = a.cve_alumno
inner join [admision].[dbo].[datosGenerales] dg on dg.idAdmision = p.cve_persona
inner join beca_cat bc on ba.cve_beca_cat = bc.cve_beca_cat
/* DE AQUI SACO EL NOMBRE DE LA COLONIA Y EL CP, ES OUTER PORQUE NO TODOS TIENEN */
left outer join colonia colonia on colonia.cve_colonia = dg.cve_colonia
/* EL REPORTE ES POR AÑO, DEBEMOS COMPARARLO CON EL FORMATO ORIGINAL QUE TRAE LA FECHA */
where ba.fecha between '2019-01-01 00:00:00.000' and '2019-12-31 23:59:59.000'
/* LO ORDENO POR CURP PORQUE EL APELLIDO TRAE PROBLEMAS */
and bc.cve_beca_cat < 7
order by 2 asc


--select * from beca_asignada
--select * from beca_cat




