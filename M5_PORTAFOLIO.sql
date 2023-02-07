--Borrar tablas en caso de que existan
DROP TABLE IF EXISTS  usuarios, direccion_usuario, productos, carrito, metodo_pago, detalle_pago, compra, detalle_compra;

--Creacion de tablas e inserts
--  Tabla usuarios
CREATE TABLE usuarios
(
    id_usuarios SERIAL PRIMARY KEY,
    rut character varying (15) UNIQUE ,
    nombre_cliente character varying(50),
    apellido_cliente character varying(50),
    email VARCHAR(50) NOT NULL,
    contraseña character varying(20)
);

-- INSERT USUARIOS
INSERT INTO usuarios(id_usuarios, rut, nombre_cliente, apellido_cliente, email, contraseña) VALUES(1, '1.111.111-1', 'Daniel', 'Astudillo', 'danielastudillo@gmail.com', '1234');
INSERT INTO usuarios(id_usuarios, rut, nombre_cliente, apellido_cliente, email, contraseña) VALUES(2, '2.222.222-2', 'Rodrigo', 'Salas', 'rsalas@gmail.com', '5678');
INSERT INTO usuarios(id_usuarios, rut, nombre_cliente, apellido_cliente, email, contraseña) VALUES(3, '3.333.333-3', 'Carmen', 'Urrutia', 'carmenurrutia@gmail.com', '9012');
INSERT INTO usuarios(id_usuarios, rut, nombre_cliente, apellido_cliente, email, contraseña) VALUES(4, '4.444.444-4', 'Alejandra', 'Parraguez', 'aleparraguez@gmail.com', '3456');
INSERT INTO usuarios(id_usuarios, rut, nombre_cliente, apellido_cliente, email, contraseña) VALUES(5, '5.555.555-5', 'Natasha', 'Ilufi', 'natailufi@gmail.com', '7890');

SELECT * FROM usuarios;

--  Tabla direccion_usuario
CREATE TABLE direccion_usuario
(
    id_direccion SERIAL NOT NULL,
    direccion character varying(50),
	comuna character varying(50),
	ciudad character varying(50),
	region character varying(50),
	usuario_rut character varying (15),
    FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

-- INSERT direccion_usuario
INSERT INTO direccion_usuario  (id_direccion, direccion, comuna, ciudad, region, usuario_rut) values(1, 'Av. El Rosario 890','Lo Prado','Santiago','RM','1.111.111-1');
INSERT INTO direccion_usuario  (id_direccion, direccion, comuna, ciudad, region, usuario_rut) values(2, 'Pasaje Sinfonia Eterna 465','Iquique','Iquique','I','2.222.222-2');
INSERT INTO direccion_usuario  (id_direccion, direccion, comuna, ciudad, region, usuario_rut) values(3, 'Av. Alameda de Orione 876','Antofagasta','Antofagasta','II','3.333.333-3');
INSERT INTO direccion_usuario  (id_direccion, direccion, comuna, ciudad, region, usuario_rut) values(4, 'Av. Colon 9652','Coquimbo','Atacama','III','4.444.444-4');
INSERT INTO direccion_usuario  (id_direccion, direccion, comuna, ciudad, region, usuario_rut) values(5, 'Maipu 2658','Arica','Santiago','RM','5.555.555-5');


SELECT * FROM direccion_usuario;

--  Tabla productos
CREATE TABLE productos
(   
    id integer NOT NULL,
    nombre_producto character varying(50),
    descripcion character varying(100),
    precio integer,
	stock integer,
    PRIMARY KEY (id)
);

-- INSERT productos
INSERT INTO productos (id, nombre_producto, descripcion, precio, stock) values (1,'Black Oracle', 'Lentes sol marco negro, protecciòn UV/UVA', 78990, 6);
INSERT INTO productos (id, nombre_producto, descripcion, precio, stock) values (2,'Green Paradise', 'Lentes sol marco verde, protecciòn UV/UVA', 81570, 6);
INSERT INTO productos (id, nombre_producto, descripcion, precio, stock) values (3,'Yellow sing', 'Lentes sol marco amarillo, protecciòn UV/UVA', 122000, 10);
INSERT INTO productos (id, nombre_producto, descripcion, precio, stock) values (4,'Red Universe', 'Lentes sol marco rojo, protecciòn UV/UVA', 105990, 8);
INSERT INTO productos (id, nombre_producto, descripcion, precio, stock) values (5,'Clear Sky', 'Lentes sol marco transparente, protecciòn UV/UVA', 93990, 13);

SELECT * FROM productos;

--  Tabla carrito
CREATE TABLE carrito
(
    id_carrito serial NOT NULL,
	cantidad integer,
	producto_id integer,
	usuario_rut character varying(15),
    PRIMARY KEY (id_carrito),
	FOREIGN KEY (producto_id) REFERENCES productos(id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

-- INSERT carrito
INSERT INTO carrito (id_carrito, cantidad, producto_id, usuario_rut) values(1, 1, 1,'1.111.111-1');
INSERT INTO carrito (id_carrito, cantidad, producto_id, usuario_rut) values(2, 1, 2,'2.222.222-2');
INSERT INTO carrito (id_carrito, cantidad, producto_id, usuario_rut) values (3, 1, 3,'3.333.333-3');
INSERT INTO carrito (id_carrito, cantidad, producto_id, usuario_rut) values (4, 1, 4,'4.444.444-4');
INSERT INTO carrito (id_carrito, cantidad, producto_id, usuario_rut) values (5, 1, 5, '5.555.555-5');

SELECT * FROM carrito;

--  Tabla metodo_pago
CREATE TABLE metodo_pago
(   
    id_metodo SERIAL PRIMARY KEY,
    metodo character varying(20),
	usuario_rut character varying(15),
    FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

-- INSERT metodo_pago
INSERT INTO metodo_pago (id_metodo, metodo, usuario_rut) values (1, 'credito','1.111.111-1');
INSERT INTO metodo_pago (id_metodo, metodo, usuario_rut) values (2, 'debito','2.222.222-2');
INSERT INTO metodo_pago (id_metodo, metodo, usuario_rut) values (3, 'transferencia','3.333.333-3');
INSERT INTO metodo_pago (id_metodo, metodo, usuario_rut) values (4, 'debito','4.444.444-4');
INSERT INTO metodo_pago (id_metodo, metodo, usuario_rut) values (5, 'debito','5.555.555-5');

SELECT * FROM metodo_pago;

/*Tablas principalmente asociadas a la compra*/

--  Tabla detalle_pago
CREATE TABLE detalle_pago
(
    id_detalle serial NOT NULL,
	estado character varying(12),
	metodo character varying(20),
    PRIMARY KEY (id_detalle)
);

-- INSERT detalle_pago
INSERT INTO detalle_pago (id_detalle, estado, metodo) values (default,'finalizado','credito');
INSERT INTO detalle_pago (id_detalle, estado, metodo) values (default,'finalizado','debito');
INSERT INTO detalle_pago (id_detalle, estado, metodo) values (default,'finalizado','transferencia');
INSERT INTO detalle_pago (id_detalle, estado, metodo) values (default,'finalizado','debito');
INSERT INTO detalle_pago (id_detalle, estado, metodo) values (default,'finalizado','debito');

SELECT * FROM detalle_pago;

--  Tabla compra
CREATE TABLE compra
(
    id_compras serial NOT NULL,
	usuario_rut character varying(15),
	fecha date,
	detalle_pago_id_detalle integer,
    PRIMARY KEY (id_compras),
	FOREIGN KEY (detalle_pago_id_detalle) REFERENCES detalle_pago(id_detalle),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

-- INSERT compra
INSERT INTO compra (id_compras, usuario_rut, fecha, detalle_pago_id_detalle ) values (default,'1.111.111-1','12-12-2022',1);
INSERT INTO compra (id_compras, usuario_rut, fecha, detalle_pago_id_detalle ) values (default,'2.222.222-2','12-12-2022',2);
INSERT INTO compra (id_compras, usuario_rut, fecha, detalle_pago_id_detalle ) values (default,'3.333.333-3','5-1-2023',3);
INSERT INTO compra (id_compras, usuario_rut, fecha, detalle_pago_id_detalle ) values (default,'4.444.444-4','27-12-2022',4);
INSERT INTO compra (id_compras, usuario_rut, fecha, detalle_pago_id_detalle ) values (default,'5.555.555-5','15-1-2023',5);

SELECT * FROM compra;

--  Tabla detalle_compra
CREATE TABLE detalle_compra
(
    id_detallecompra serial NOT NULL,
	productos_id integer,
	cantidad_compra integer,
	compras_id integer,
    PRIMARY KEY (id_detallecompra),
	FOREIGN KEY (productos_id) REFERENCES productos(id),
	FOREIGN KEY (compras_id) REFERENCES compra(id_compras)
);

-- INSERT detalle_compra
INSERT INTO detalle_compra (id_detallecompra, productos_id, cantidad_compra,compras_id) values (default,1,1,1);
INSERT INTO detalle_compra (id_detallecompra, productos_id, cantidad_compra,compras_id) values (default,2,2,2);
INSERT INTO detalle_compra (id_detallecompra, productos_id, cantidad_compra,compras_id) values (default,3,3,4);
INSERT INTO detalle_compra (id_detallecompra, productos_id, cantidad_compra,compras_id) values (default,4,4,4);
INSERT INTO detalle_compra (id_detallecompra, productos_id, cantidad_compra,compras_id) values (default,5,5,5);

SELECT * FROM detalle_compra;

--Preguntas del Portafolio

--Rebaja del 20%
UPDATE productos SET precio=round(precio*0.8,0);

-- LISTAR TODOS LOS PRODCUTOS CON STOCK MENOR O IGUAL A 5
SELECT *
FROM productos
WHERE stock <= 5;

-- SIMULAR LA COMPRA DE AL MENOS 3 PRODUCTOS, CALCULAR SUBTOTAL, AGREGAR EL IVA Y MOSTRAR EL TOTAL DE LA COMPRA
INSERT INTO compra (id_compras, usuario_rut, fecha, detalle_pago_id_detalle ) values (default,'1.111.111-1','17-1-2023', 5);
INSERT INTO detalle_compra (id_detallecompra, productos_id, cantidad_compra,compras_id) values (default,1,1,5);
INSERT INTO detalle_compra (id_detallecompra, productos_id, cantidad_compra,compras_id) values (default,3,1,4);
INSERT INTO detalle_compra (id_detallecompra, productos_id, cantidad_compra,compras_id) values (default,5,1,3);
INSERT INTO detalle_pago values (default,'finalizado','debito');

SELECT c.id_compras, c.fecha, sum(dc.cantidad_compra * p.precio) AS subtotal, 
(sum(dc.cantidad_compra * p.precio) * 0.19) AS IVA, 
sum(dc.cantidad_compra * p.precio) + (sum(dc.cantidad_compra * p.precio) * 0.19) AS total 
FROM compra c 
JOIN detalle_compra dc ON c.id_compras = dc.compras_id 
JOIN productos p ON dc.productos_id = p.id 
GROUP BY c.id_compras, c.fecha;

-- MOSTAR EL TOTAL DE VENTAS DE MES DE DICIEMBRE DE 2022
SELECT count(id_compras) as Total_de_ventas, sum(d.cantidad_compra * p.precio) as Total_diciembre_2022
FROM compra c
JOIN detalle_compra d ON c.id_compras = d.compras_id
JOIN productos p ON d.productos_id = p.id
WHERE date_part('month', fecha) = 12
AND date_part('year', fecha) = 2022;

-- Listar el comportamiento del usuario que mas compras realizo en 2022
SELECT usuario_rut AS max_comprador
FROM( SELECT usuario_rut,COUNT(usuario_rut) AS n_compras
	FROM compra
	group by usuario_rut
	order by n_compras desc
	limit 1) as tabla_calculada;
	
INSERT INTO usuarios(nombre, email, password) VALUES('Carmen', 'carmenurrutia@mail.com', '123456');
INSERT INTO usuarios(nombre, email, password) VALUES('Rodrigo', 'rsalas@gmail.com', '123456');

--SIMULAR COMPRA 2 PRODUCTOS
SELECT * FROM PRODUCTOS;
BEGIN
--CREAMOS BOLETA 10001
INSERT INTO boletas(numero_boleta, fecha, id_usuario) VALUES (10001, '01/02/2023', 1);

SELECT * FROM boletas;
--AGREGAREMOS LOS SIGUIENTES PRODUCTOS AL DETALLE:
-- ID: 1, CANTIDAD: 5, PRECIO: 1500 -> PAN
-- ID: 2, CANTIDAD: 3, PRECIO: 1800 -> BEBIDA 2 LITROS FANTA
INSERT INTO detalles_boletas(numero_boleta, id_producto, cantidad, precio) VALUES
(10001, 1, 5, 1500),
(10001, 2, 3, 1800);
select * from detalles_boletas;
--DESCONTAR STOCKS A LOS PRODUCTOS VENDIDOS
UPDATE productos SET stock = stock -5 where id = 1;
UPDATE productos SET stock = stock -3 where id = 2;
select * from productos;
COMMIT;

--CONSULTA BOLETA 10001
SELECT numero_boleta, nombre, (bd.cantidad * bd.precio) subtotal, ((bd.cantidad * bd.precio) * 1.19) FROM detalles_boletas bd
join productos p
ON bd.id_producto = p.id;

SELECT numero_boleta, SUM(((bd.cantidad * bd.precio) * 1.19)) FROM detalles_boletas bd
join productos p
ON bd.id_producto = p.id
group by numero_boleta;

SELECT * FROM boletas where fecha between '01/02/2023' AND '28/02/2023';

SELECT * FROM DETALLES_BOLETAS;

