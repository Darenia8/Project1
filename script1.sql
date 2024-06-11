Select * from inmuebles;

-- Propiedades más vistas por barrio y tipo de inmueble

select Zona2, Tipo, max(Visualizaciones) 
from inmuebles 
group by Zona2, Tipo
having max(Visualizaciones) > 0
order by 3 desc;

-- Promedio de precio en cada barrio por tipo de operación y tipo de inmueble

select Zona2, round(avg(Precio_USD),2) Precio_promedio, Tipo, Operacion
from inmuebles
group by Zona2, Tipo, Operacion
order by Zona2, 2;

-- Total de propiedades por barrio

select Zona2, count(*) Total_propiedades
from inmuebles
group by Zona2
order by 2 desc;

-- Análisis temporal del precio promedio de venta por barrio

select Zona2, date_format(Fecha_publicacion, '%Y-%m') MesAnio, round(avg(Precio_USD),0) Promedio_USD
from inmuebles
where Operacion = 'Venta'
group by Zona2, 2
order by 2, 3;

-- Propiedades con mayor relación precio/dimensión en venta

select Zona2, Tipo, Precio_USD, Dimension_propiedad, round((Precio_USD/Dimension_propiedad),0) Precio_m2 
from inmuebles
where Operacion = 'Venta'
having Dimension_propiedad > 0
and Precio_USD > 0
order by 5, Zona2;