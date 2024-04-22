/*1. Obtén las ciudades en las que no haya ningún cliente ordenadas por 
nombre.*/
select c.nombre from conce_ciudad c where c.nombre not in (select ciudad from conce_cliente) order by c.nombre; 
/*2. Obtén las ciudades distintas en las que haya algún cliente ordenadas 
por nombre.*/
select distinct nombre from conce_ciudad c where c.nombre in(select ciudad from conce_cliente) order by nombre;
/*3. Selecciona el nombre de aquellos coches que se hayan vendido en
concesionarios de Alicante ordenados por nombre.*/
select nombre from conce_coche, where coche.nombre in (select v.nombre 
from conce_concesionario cc, conce_ventas v where v.conce_concesionario=cc.cif 
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
select marca, distinct(nombre), color from conce_ventas v, conce_coche c where c.codigo=v.coche and to_char(fecha, 'mm/yyyy')='08/2019' and marca in ('Kia', 'Seat', 'BMW') order by marca, nombre;