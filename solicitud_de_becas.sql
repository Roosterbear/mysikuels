select a.matricula 
,p.apellido_materno + ' ' + p.apellido_materno + ' ' + p.nombre as nombre
,c.nombre
,g.numero_cuatrimestre
from beca_solicitud bs
inner join alumno a on bs.matricula = a.matricula
inner join persona p on p.cve_persona = a.cve_alumno
inner join grupo g on g.cve_grupo = (select max(cve_grupo) from alumno_grupo where matricula = bs.matricula)
inner join carrera c on c.cve_carrera = g.cve_carrera
where bs.id_periodo_aplicacion = 24



