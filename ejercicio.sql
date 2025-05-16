-- Crear la tabla 'fabricante'
CREATE TABLE fabricante (
  id SERIAL PRIMARY KEY,  
  nombre VARCHAR(100) NOT NULL
);


-- Crear la tabla 'producto'
CREATE TABLE producto (
  id SERIAL PRIMARY KEY,  
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE PRECISION NOT NULL,  
  id_fabricante INT NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);


-- Insertar datos en la tabla 'fabricante'
INSERT INTO fabricante (nombre) VALUES
('Asus'),
('Lenovo'),
('Hewlett-Packard'),
('Samsung'),
('Seagate'),
('Crucial'),
('Gigabyte'),
('Huawei'),
('Xiaomi');


-- Insertar datos en la tabla 'producto'
INSERT INTO producto (nombre, precio, id_fabricante) VALUES
('Disco duro SATA3 1TB', 86.99, 5),
('Memoria RAM DDR4 8GB', 120, 6),
('Disco SSD 1 TB', 150.99, 4),
('GeForce GTX 1050Ti', 185, 7),
('GeForce GTX 1080 Xtreme', 755, 6),
('Monitor 24 LED Full HD', 202, 1),
('Monitor 27 LED Full HD', 245.99, 1),
('Portátil Yoga 520', 559, 2),
('Portátil Ideapd 320', 444, 2),
('Impresora HP Deskjet 3720', 59.99, 3),
('Impresora HP Laserjet Pro M26nw', 180, 3);




-- consultas

	
	-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

	SELECT 
	    p.nombre AS nombre_producto, 
	    p.precio, 
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
--    Ordene el resultado por el nombre del fabricante, por orden alfabético.

	   
	SELECT 
	    p.nombre AS nombre_producto, 
	    p.precio, 
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	ORDER BY 
	    f.nombre ASC;

-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, 
--    de todos los productos de la base de datos.
	   
	   
	SELECT 
	    p.id AS id_producto,
	    p.nombre AS nombre_producto,
	    f.id AS id_fabricante,
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
	   
	   
	SELECT 
	    p.nombre AS nombre_producto, 
	    p.precio, 
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	ORDER BY 
	    p.precio ASC
	LIMIT 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.


	SELECT 
	    p.nombre AS nombre_producto, 
	    p.precio, 
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	ORDER BY 
	    p.precio DESC
	LIMIT 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.


	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
	   
	   
	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre = 'Crucial' AND p.precio > 200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
	   
	   
	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio,
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Utilizando el operador IN.
	   
	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio,
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
	   
	   
	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio,
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre LIKE '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
	   
	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio,
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre LIKE '%w%'; 

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€.
--     Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
	   
	   
	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio,
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    p.precio >= 180
	ORDER BY 
	    p.precio DESC,
	    p.nombre ASC;

-- 13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos
	   
	   
	SELECT DISTINCT
	    f.id AS id_fabricante,
	    f.nombre AS nombre_fabricante
	FROM 
	    fabricante f
	INNER JOIN 
	    producto p ON f.id = p.id_fabricante;



-- 14. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos.
--     El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados
	   
	   
	   
	SELECT 
	    f.nombre AS nombre_fabricante,
	    p.nombre AS nombre_producto,
	    p.precio
	FROM 
	    fabricante f
	LEFT JOIN 
	    producto p ON f.id = p.id_fabricante
	ORDER BY
	    f.nombre, p.nombre;

-- 15. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
	   
	   
	SELECT 
	    f.nombre AS nombre_fabricante
	FROM 
	    fabricante f
	LEFT JOIN 
	    producto p ON f.id = p.id_fabricante
	WHERE 
	    p.id IS NULL;

-- 16. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

-- RTA: No, en el esquema de base de datos proporcionado, no pueden existir productos que no estén relacionados con un fabricante.
-- Justificación: La tabla `producto` tiene una columna `id_fabricante` que está definida como `INT NOT NULL` 
-- y además tiene una `FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)`.
-- La restricción `NOT NULL` asegura que cada producto debe tener un valor en `id_fabricante`.
-- La `FOREIGN KEY` asegura que este valor debe corresponder a un `id` existente en la tabla `fabricante`.
-- Por lo tanto, cada producto está obligatoriamente asociado a un fabricante existente.

-- 17. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
	   
	   
	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio
	FROM 
	    producto p,
	    fabricante f
	WHERE 
	    p.id_fabricante = f.id AND f.nombre = 'Lenovo';


-- 18. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. 
	   
	   
--     
	SELECT *
	FROM producto
	WHERE precio = (
	    SELECT MAX(p.precio)
	    FROM producto p, fabricante f
	    WHERE p.id_fabricante = f.id AND f.nombre = 'Lenovo'
	);

-- 19. Lista el nombre del producto más caro del fabricante Lenovo.



	SELECT 
	    p.nombre AS nombre_producto
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre = 'Lenovo'
	ORDER BY 
	    p.precio DESC
	LIMIT 1;

-- 20. Lista el nombre del producto más barato del fabricante Hewlett-Packard.



	SELECT 
	    p.nombre AS nombre_producto
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre = 'Hewlett-Packard'
	ORDER BY 
	    p.precio ASC
	LIMIT 1;

-- 21. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio,
	    f.nombre AS nombre_fabricante
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    p.precio >= (
	        SELECT MAX(prod.precio)
	        FROM producto prod
	        INNER JOIN fabricante fab ON prod.id_fabricante = fab.id
	        WHERE fab.nombre = 'Lenovo'
	    );

-- 22. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
	   
	   
	SELECT 
	    p.nombre AS nombre_producto,
	    p.precio
	FROM 
	    producto p
	INNER JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.nombre = 'Asus' AND p.precio > (
	        SELECT AVG(prod.precio)
	        FROM producto prod
	        INNER JOIN fabricante fab ON prod.id_fabricante = fab.id
	        WHERE fab.nombre = 'Asus'
	    );

-- 23. Devuelve un listado con los productos que tienen fabricantes asociados y los fabricantes que tienen productos asociados, 
--     pero también incluye productos o fabricantes sin asociación.

SELECT 
    f.nombre AS nombre_fabricante,
    p.nombre AS nombre_producto,
    p.precio
FROM 
    fabricante f
FULL OUTER JOIN 
    producto p ON f.id = p.id_fabricante
ORDER BY
    f.nombre, p.nombre;

-- 24. Devuelve un listado con todos los fabricantes y todos los productos, 
--     excluyendo aquellos casos en los que un fabricante esté relacionado con un producto.
	SELECT 
	    f.nombre AS nombre_fabricante,
	    NULL AS nombre_producto,
	    NULL AS precio
	FROM 
	    fabricante f
	LEFT JOIN 
	    producto p ON f.id = p.id_fabricante
	WHERE 
	    p.id IS NULL
	UNION ALL 
	SELECT 
	    NULL AS nombre_fabricante,
	    p.nombre AS nombre_producto,
	    p.precio
	FROM 
	    producto p
	LEFT JOIN 
	    fabricante f ON p.id_fabricante = f.id
	WHERE 
	    f.id IS NULL; 
	   
	   
	   
-- V2
	   
SELECT 
    f.nombre AS nombre_fabricante,
    p.nombre AS nombre_producto
FROM 
    fabricante f
FULL OUTER JOIN 
    producto p ON f.id = p.id_fabricante
WHERE 
    p.id_fabricante IS NULL OR f.id IS NULL; 
