1.  SELECT producto.nombre FROM producto;
2.  SELECT producto.nombre,producto.precio FROM producto;
3.  SHOW COLUMNS from producto;
4.  SELECT producto.nombre,producto.precio,(producto.precio * 1.05) FROM producto;
5.  SELECT producto.nombre AS producto,producto.precio AS euros,(producto.precio * 1.05) AS dolars FROM producto;
6.  SELECT UPPER(producto.nombre) AS producto,producto.precio AS euros FROM producto;
7.  SELECT LOWER(producto.nombre) AS producto,producto.precio AS euros FROM producto;
8.  SELECT fabricante.nombre,UPPER(SUBSTRING(fabricante.nombre,1,2)) FROM fabricante;
9.  SELECT producto.nombre,ROUND(producto.precio) FROM producto;
10. SELECT producto.nombre,TRUNCATE(producto.precio,0) FROM producto;
11. SELECT DISTINCT codigo_fabricante FROM producto JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo;
12. 
