select 
/* HAY APELLIDOS QUE SALEN CON UN GUION, SE LOS QUITO PARA QUE NO DEN PROBLEMAS CON EXCEL */
(replace(p.apellido_paterno,'-','')+' '+apellido_materno+' '+p.nombre) as nombre
,p.curp
,bs.matricula
/* CONVIERTO LA FECHA A UN FORMATO MAS BONITO Y SIN LA HORA */
,CONVERT(VARCHAR(10), p.fecha_nacimiento, 103) as fecha_nacimiento
/* DE LA CURP SACO EL ESTADO DONDE NACIO */
,SUBSTRING(p.curp,12,2) as lugar_nacimiento
,colonia.nombre as fraccionamiento
,dg.calle
,dg.numeroExterior as numero_exterior
,colonia.codigo_postal as codigo_postal

/* CONVIERTO LA FECHA A UN FORMATO MAS BONITO Y SIN LA HORA */
,CONVERT(VARCHAR(10), bs.fecha_solicitud, 103) as fecha_solicitud
from beca_solicitud as bs
inner join alumno a on a.matricula = bs.matricula
inner join persona p on p.cve_persona = a.cve_alumno
inner join beca_convocatoria bc on bc.id = bs.id_convocatoria_beca
inner join [admision].[dbo].[datosGenerales] dg on dg.idAdmision = p.cve_persona
/* DE AQUI SACO EL NOMBRE DE LA COLONIA Y EL CP, ES OUTER PORQUE NO TODOS TIENEN */
left outer join colonia colonia on colonia.cve_colonia = dg.cve_colonia
/* EL REPORTE ES POR A�O, DEBEMOS COMPARARLO CON EL FORMATO ORIGINAL QUE TRAE LA FECHA */
where fecha_solicitud between '2019-01-01 00:00:00.000' and '2019-12-31 23:59:59.000'
/* LO ORDENO POR CURP PORQUE EL APELLIDO TRAE PROBLEMAS */
order by 2 asc








