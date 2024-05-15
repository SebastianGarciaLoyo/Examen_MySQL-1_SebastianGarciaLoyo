-- ########################
-- ##### Filtro MYSQL #####
-- ########################

-- comandos para mostrar todas la tablas

select * from complejo_deportivo;
select * from complejo_polideportivo;
select * from deportes;
select * from equipamiento;
select * from evento_complejo_deportivo;
select * from evento_complejo_poli;
select * from evento_equipo;
select * from eventos;
select * from info_complejo;
select * from jefes;
select * from sede;
select * from comisario;
select * from evento_comisario;

-- Consulta #1
-- Consulta de Todos los Eventos en un Complejo Deportivo Específico.

select e.id_evento, e.nombre, cd.id_complejo_deportivo, cd.nombre
from eventos as e
right join complejo_deportivo as cd on cd.id_complejo_deportivo = e.id_evento
where cd.id_complejo_deportivo = 1;

-- Consulta #2
-- Consulta de Comisarios Asignados a un Evento en Particular.

select c.id_comisario, c.nombre, c.tipo, e.id_evento, e.nombre
from comisario as c
right join eventos as e on e.id_evento = c.id_comisario
where e.id_evento = 1;

-- Consulta #3
-- Consulta de Todos los Eventos en un Rango de Fechas.
 
 select * from eventos
 where year(fecha) = 2023;

-- Consulta #4
-- Consulta del Número Total de Comisarios Asignados a Eventos.

select count(c.id_comisario), e.id_evento
from comisario as c
right join eventos as e on e.id_evento = c.id_comisario
where c.id_comisario
group by c.id_comisario, e.id_evento;

-- Consulta #5
-- Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.

select p.id_complejo, i.area_complejo
from evento_complejo_poli as p
left join info_complejo as i on i.id_complejo = p.id_evento_complejo
;

-- Consulta #6
-- Consulta de Eventos con Número de Participantes Mayor que la Media.

select nombre, num_participantes
from eventos
where num_participantes > 80 
group by nombre, num_participantes;

-- Consulta#7
-- Consulta de Equipamiento Necesario para un Evento Específico.

select e.nombre, q.nombre_equipos, q.stock
from eventos as e
right join equipamiento as q on q.id_equipamiento = e.id_evento
where e.id_evento = 6;


-- Consulta#8
-- Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.

 select d.id_evento_complejo_deportivo, d.id_evento, c.id_complejo, c.id_jefe
 from evento_complejo_deportivo as d
 right join info_complejo as c on d.id_complejo = d.id_evento;

-- Consulta#9
-- Consulta de Complejos Polideportivos sin Eventos Celebrados.

select id_evento_complejo as evento_complejo_poli, id_evento, id_complejo
from evento_complejo_poli
where id_evento is null;

-- Consulta#10
-- Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.

select c.nombre, c.tipo, e.id_evento, e.nombre
from comisario as c
right join eventos as e on e.id_evento = c.id_comisario
where c.tipo = "juez";

-- Hecho por Sebastian Garcia Loyo C.C 1116780130