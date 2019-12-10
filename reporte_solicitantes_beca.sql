select (p.apellido_paterno+' '+apellido_materno+' '+p.nombre) as nombre
,p.curp
,bs.matricula
/* CONVIERTO LA FECHA A UN FORMATO MAS BONITO Y SIN LA HORA */
,CONVERT(VARCHAR(10), p.fecha_nacimiento, 103) as 'fecha nacimiento'
/* DE LA CURP SACO EL ESTADO DONDE NACIO */
,SUBSTRING(p.curp,12,2) as 'lugar nacimiento'
,colonia.nombre as fraccionamiento
,dg.calle
,dg.numeroExterior as 'numero exterior'
,colonia.codigo_postal as 'codigo postal'

/* CONVIERTO LA FECHA A UN FORMATO MAS BONITO Y SIN LA HORA */
,CONVERT(VARCHAR(10), bs.fecha_solicitud, 103) as 'fecha solicitud'
from beca_solicitud as bs
inner join alumno a on a.matricula = bs.matricula
inner join persona p on p.cve_persona = a.cve_alumno
inner join beca_convocatoria bc on bc.id = bs.id_convocatoria_beca
inner join [admision].[dbo].[datosGenerales] dg on dg.idAdmision = p.cve_persona
/* DE AQUI SACO EL NOMBRE DE LA COLONIA Y EL CP, ES OUTER PORQUE NO TODOS TIENEN */
left outer join colonia colonia on colonia.cve_colonia = dg.cve_colonia
order by 1 asc





