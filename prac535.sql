//ciclos
/*1. Visualiza todos los módulos que contengan tres letras "o" en su interior.*/
select * from ciclos_modulo where nombre_modulo like '%o%o%o%';
/*2. Visualiza los nombres y apellidos de alumnos matriculados en 1º de SMR y que hayan nacido después del año 2001, ordenados por nombre.*/
select distinct nombre_alumno from ciclos_alumno a, ciclos_curso c where fecha_nacimiento_alumno >= to_date('01/01/2002', 'dd/mm/yyyy') and c.abreviatura_ciclo like '1SMR%' and c.codigo_ciclo=a.codigo_ciclo order by nombre_alumno;
/*3. Muestra los nombres, los apellidos y la fecha de nacimiento de todos aquellos profesores que pertenezcan al mismo departamento que Marta Vidal, 
ordenados por fecha de nacimiento de forma descendente.*/
select nombre_profesor,fecha_nacimiento_profesor from ciclos_profesor p where p.departamento in (select departamento from ciclos_profesor where nombre_profesor='Marta Vidal') order by p.fecha_nacimiento_profesor desc;
/*4. Obtén los datos de los módulos con mayor número de horas que ningún otro módulo.*/
select * from ciclos_modulo m where m.numero_horas_totales =(select  max(numero_horas_totales) from ciclos_modulo);
/*5. Obtén los datos de los módulos con menor número de horas que ningún otro módulo.*/
select * from ciclos_modulo m where m.numero_horas_totales =(select  min(numero_horas_totales) from ciclos_modulo);
/*6. Obtén el nombre y apellido de los profesores cuyo jefe de departamento sea Carlos Martín Ruiz.*/
select nombre_profesor from ciclos_profesor where departamento in (select codigo_departamento from CICLOS_departamento, ciclos_profesor where jefe_departamento=dni_profesor and trim(ciclos_profesor.nombre_profesor)='Carlos Martín Ruiz' );


//conce
/*1. Obtén las ciudades en las que no haya ningún cliente ordenadas por 
nombre.*/
select c.nombre from conce_ciudad c where c.nombre not in (select ciudad from conce_cliente) order by c.nombre; 
/*2. Obtén las ciudades distintas en las que haya algún cliente ordenadas 
por nombre.*/
select distinct nombre from conce_ciudad c where c.nombre in(select ciudad from conce_cliente) order by nombre;
/*3. Selecciona el nombre de aquellos coches que se hayan vendido en
concesionarios de Alicante ordenados por nombre.*/
select nombre from conce_coche where nombre in (select v.coche
from conce_concesionario cc, conce_ventas v where v.concesionario =cc.cif 
and cc.ciudad='Alicante') order by nombre;  
/*4. Visualiza las columnas nombre, apellido y ciudad de los clientes cuyo
 apellido no esté comprendido entre la "B" y la "Q", ordenado por apellido.*/
 select nombre, apellido, ciudad from conce_cliente where substr(initcap(apellido),1,1) not between 'B' and 'Q' order by apellido;  
/*5. Visualiza las columnas nombre, apellido y ciudad de los clientes cuyo 
apellido esté comprendido entre la “B” y la “P”.*/
select nombre, apellido, ciudad from conce_cliente where substr(initcap(apellido),1,1) between 'B' and 'P' order by apellido;
/*6. Visualiza la marca, el nombre y los colores de 
los coches distintos que
han sido comprados en agosto de 2019 y cuya marca sea Kia,
Seat o BMW 
ordenado por marca y nombre del coche.*/
select distinct marca,  nombre, color from conce_ventas v, conce_coche c where c.codigo=v.coche and to_char(fecha, 'mm/yyyy')='08/2019' and marca in ('Kia', 'Seat', 'BMW') order by marca, nombre;

/*listas*/
/*1. Selecciona el nombre artístico, el nombre real y el nombre de la ciudad de los artistas independientes cuyo país sea Estados Unidos.*/
select nombreArtistico, nombreReal, nom_ciudad from listas_artistaind ai, listas_artista a where ai.cod=a.cod and a.nom_pais='Estados Unidos'; 
/*2. Muestra la posición, el nombre del artista y el nombre de la canción de la lista 7.*/
select posicion, autor, titulo from listas_lista l, listas_posicion_lista p, Listas_cancion c where l.cod =p.COD_LISTA and p.cod_lista=7 and c.cod=p.COD_CANCION;
/*3. Lista el nombre de todos los géneros ordenados alfabéticamente.*/
select nombre from Listas_genero order by nombre asc; 
/*4. Lista el nombre y el género de todas las canciones que tengan como género alguno que contenga en su interior la palabra rock (indistintamente de si está en mayúsculas 
o minúsculas).*/
select c.titulo, g.nombre from Listas_genero_cancion gc, Listas_cancion c, Listas_genero g where c.cod= gc.COD_CANCION and g.cod=gc.COD_GENERO and UPPER(g.nombre) like '%ROCK%';  
/*5. Lista el nombre artístico, la fecha de nacimiento y la fecha de la muerte de los artistas independientes que hayan muerto y que nacieron después de los años 70.*/
select NOMBREARTISTICO, fnac, fmuerte from LISTAS_ARTISTA a, listas_artistaind ai where ai.cod=a.cod and to_char(fnac, 'yyyy')>'1970';
/*6. Selecciona el nombre y la fecha de disolución de los grupos que se han disuelto ordenados por fecha de disolución.*/
select nombreArtistico, FDISOLUCION from LISTAS_GRUPO g, LISTAS_ARTISTA a where a.cod=g.cod order by FDISOLUCION;
/*7. Obtén el nombre de todos los grupos que se crearon después de la muerte de Elvis Presley ordenado por fecha de creación.*/
select nombreArtistico, FDISOLUCION from LISTAS_GRUPO g, LISTAS_ARTISTA a where a.cod=g.cod and FCREACION>(select fmuerte from listas_artista a, LISTAS_ARTISTAIND ai where a.nombreArtistico='Elvis Presley' and a.cod=ai.cod);
