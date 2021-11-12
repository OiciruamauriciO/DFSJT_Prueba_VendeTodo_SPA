CREATE TABLE empleados(
  idempleados NUMBER(10) PRIMARY KEY NOT NULL,
  nombre VARCHAR2(100) NOT NULL,
  apellido VARCHAR2(200) NOT NULL,
  fecha_nacimiento VARCHAR2(150) NOT NULL,
  dirección VARCHAR2(100) NULL,
  región NUMBER(10) NULL,
  ciudad VARCHAR2(45) NULL,
  país VARCHAR2(45) NULL,
  teléfono VARCHAR2(45) NULL,
  cargo VARCHAR2(100) NOT NULL
);

CREATE TABLE clientes(
  idclientes NUMBER(10) PRIMARY KEY NOT NULL,
  nombre_empresa VARCHAR2(150) NOT NULL,
  nombre_contacto VARCHAR2(200) NOT NULL,
  email VARCHAR2(100) NOT NULL,
  dirección VARCHAR2(45) NOT NULL,
  región NUMBER(10) NULL,
  ciudad VARCHAR2(45) NULL,
  país VARCHAR2(45) NULL,
  código_postal NUMBER(10) NOT NULL,
  teléfono VARCHAR2(45) NOT NULL
);

CREATE TABLE despachadores(
  iddespachadores NUMBER(10) PRIMARY KEY NOT NULL,
  nombre VARCHAR2(150) NOT NULL,
  teléfono_empresa VARCHAR2(45) NOT NULL
);

CREATE TABLE categoría(
  idcategoría NUMBER(10) PRIMARY KEY NOT NULL,
  nombre_categoría VARCHAR2(45) NOT NULL
);

CREATE TABLE órdenes(
  idórdenes NUMBER(10) PRIMARY KEY NOT NULL,
  fecha_requerimiento DATE NOT NULL,
  fecha_envío DATE NOT NULL,
  nombre_destinatario VARCHAR2(200) NOT NULL,
  dirección VARCHAR2(150) NOT NULL,
  código_postal NUMBER(10) NOT NULL,
  ciudad VARCHAR2(45) NULL,
  región NUMBER(2) NOT NULL,
  país VARCHAR2(45) NULL,
  vía_envío NUMBER(10) NOT NULL,
  clientes_idclientes NUMBER(10) NOT NULL
);

CREATE TABLE compra(
  idcompra NUMBER(10) PRIMARY KEY NOT NULL,
  valor NUMBER(10) NOT NULL,
  cantidad_productos NUMBER(10) NOT NULL,
  descuentos NUMBER(10) NOT NULL
);

CREATE TABLE productos(
  idproductos NUMBER(10) PRIMARY KEY NOT NULL,
  precio NUMBER(10) NOT NULL,
  stock NUMBER(10) NOT NULL,
  descontinuado NUMBER(1) NOT NULL 
);

CREATE TABLE proveedores(
  idproveedores NUMBER(10) PRIMARY KEY  NOT NULL,
  nombre_compañía VARCHAR2(150) NOT NULL,
  nombre_contacto VARCHAR2(200) NOT NULL,
  dirección VARCHAR2(45) NOT NULL,
  región NUMBER(2) NOT NULL,
  teléfono VARCHAR2(45) NOT NULL
);

CREATE TABLE detalle_compra(
  iddetallecompra NUMBER(10) PRIMARY KEY NOT NULL,
  ref_orden NUMBER(10) NOT NULL,
  cantidad_productos NUMBER(10) NOT NULL, 
  ref_lista_productos VARCHAR(45) NOT NULL
); 

CREATE TABLE lista_productos(
    idlistaproducto NUMBER(10) PRIMARY KEY NOT NULL, 
    ref_producto NUMBER(10) NOT NULL, 
    cantidad NUMBER(10) NOT NULL, 
    ref_detalle NUMBER(10) NOT NULL
);

--esta después se eliminó por una nueva referencia, ir a apartado del ejericio 4, casi al final de este script
ALTER TABLE despachadores ADD CONSTRAINT fk_desp_empl FOREIGN KEY (iddespachadores) REFERENCES empleados(idempleados);

--esta después se eliminó por una nueva referencia, ir a apartado del ejericio 4, casi al final de este script
ALTER TABLE productos ADD CONSTRAINT fk_prod_cat FOREIGN KEY (idproductos) REFERENCES categoría(idcategoría);

--esta después se eliminó por una nueva referencia, ir a apartado del ejericio 4, casi al final de este script
ALTER TABLE proveedores ADD CONSTRAINT fk_prov_prod FOREIGN KEY (idproveedores) REFERENCES productos(idproductos);

--esta después se eliminó por una nueva referencia, ir a apartado del ejericio 4, casi al final de este script
ALTER TABLE compra ADD CONSTRAINT fk_comp_cli FOREIGN KEY (idcompra) REFERENCES clientes(idclientes);

--esta después se eliminó por una nueva referencia, ir a apartado del ejericio 4, casi al final de este script
ALTER TABLE órdenes ADD CONSTRAINT fk_órd_desp FOREIGN KEY (idórdenes) REFERENCES despachadores(iddespachadores);

ALTER TABLE detalle_compra ADD CONSTRAINT fk_det_comp FOREIGN KEY (iddetallecompra) REFERENCES compra(idcompra);

--esta después se eliminó por una nueva referencia, ir a apartado del ejericio 4, casi al final de este script
ALTER TABLE detalle_compra ADD CONSTRAINT fk_det_órd FOREIGN KEY (iddetallecompra) REFERENCES órdenes(idórdenes);

ALTER TABLE lista_productos ADD CONSTRAINT fk_lis_det FOREIGN KEY (ref_detalle) REFERENCES detalle_compra(iddetallecompra);

ALTER TABLE lista_productos ADD CONSTRAINT fk_lis_prod FOREIGN KEY (ref_producto) REFERENCES productos(idproductos);

--es menester, insertar datos de prueba primero en las entidades fuertes, luego en todas las demás según las relaciones entre tablas
--INSERT INTO despachadores VALUES (1, 'Despachador 001','+56978452154');
INSERT INTO empleados VALUES (1,'NombreEmpleado 001', 'ApellidoEmpleado 001', '84-mar-15', 'Dirección empleado 001', 11, 'Ciudad empleado 001', 'Chile', '+56978456577', 'Cargo empleado 001');
INSERT INTO empleados VALUES (2,'NombreEmpleado 002', 'ApellidoEmpleado 002', '87-dec-08', 'Dirección empleado 002', 4, 'Ciudad empleado 002', 'Chile', '+56978234619', 'Cargo empleado 002');
INSERT INTO empleados VALUES (3,'NombreEmpleado 003', 'ApellidoEmpleado 003', '95-jun-22', 'Dirección empleado 003', 7, 'Ciudad empleado 003', 'Chile', '+56998096587', 'Cargo empleado 003');
INSERT INTO empleados VALUES (4,'NombreEmpleado 004', 'ApellidoEmpleado 004', '73-feb-11', 'Dirección empleado 004', 1, 'Ciudad empleado 004', 'Chile', '+56971221512', 'Cargo empleado 004');
INSERT INTO empleados VALUES (5,'NombreEmpleado 005', 'ApellidoEmpleado 005', '95-sep-01', 'Dirección empleado 005', 8, 'Ciudad empleado 005', 'Chile', '+56978123554', 'Cargo empleado 005');

/*
SELECT * FROM empleados;

idempleados nombre                 apellido                fecha_nacimiento     dirección                   región      ciudad                  país        teléfono        cargo
1           NombreEmpleado 001      ApellidoEmpleado 001    84-mar-15           Dirección empleado 001      11          Ciudad empleado 001     Chile       +56978456512    Cargo empleado 001
2           NombreEmpleado 002      ApellidoEmpleado 002    87-dec-08           Dirección empleado 002      4           Ciudad empleado 002     Chile       +56978234619    Cargo empleado 002
3           NombreEmpleado 003      ApellidoEmpleado 003    95-jun-22           Dirección empleado 003      7           Ciudad empleado 003     Chile       +56998096587    Cargo empleado 003
4           NombreEmpleado 004      ApellidoEmpleado 004    73-feb-11           Dirección empleado 004      1           Ciudad empleado 004     Chile       +56971221512    Cargo empleado 004
5           NombreEmpleado 005      ApellidoEmpleado 005    95-sep-01           Dirección empleado 005      8           Ciudad empleado 005     Chile       +56978123554    Cargo empleado 005
*/


INSERT INTO clientes VALUES (1, 'Empresa 001', 'Contacto 001', 'correo001@correo.com', 'Dirección 001', 3,'Ciudad 001', 'Chile', 1234567890, '+569987654321');
INSERT INTO clientes VALUES (2, 'Empresa 002', 'Contacto 002', 'correo002@correo.com', 'Dirección 002', 7,'Ciudad 002', 'Chile', 1534567890, '+569923654321');
INSERT INTO clientes VALUES (3, 'Empresa 003', 'Contacto 003', 'correo003@correo.com', 'Dirección 003', 3,'Ciudad 003', 'Chile', 1237667890, '+569984354321');
INSERT INTO clientes VALUES (4, 'Empresa 004', 'Contacto 004', 'correo004@correo.com', 'Dirección 004', 9,'Ciudad 004', 'Chile', 1234587890, '+569922654321');
INSERT INTO clientes VALUES (5, 'Empresa 005', 'Contacto 005', 'correo005@correo.com', 'Dirección 005', 11,'Ciudad 005', 'Chile', 1234561290, '+569247654321');

/*
SELECT * FROM clientes;
idclientes  nombre_empresas nombre_contacto     email                   dirección       región  ciudad      país    código_postal   teléfono
1           Empresa 001     Contacto 001        correo001@correo.com    Dirección 001   3       Ciudad 001  Chile   1234567890      +569987654321
2           Empresa 002     Contacto 002        correo002@correo.com    Dirección 002   7       Ciudad 002  Chile   1534567890      +569923654321
3           Empresa 003     Contacto 003        correo003@correo.com    Dirección 003   3       Ciudad 003  Chile   1237667890      +569984354321
4           Empresa 004     Contacto 004        correo004@correo.com    Dirección 004   9       Ciudad 004  Chile   1234587890      +569922654321
5           Empresa 005     Contacto 005        correo005@correo.com    Dirección 005   11      Ciudad 005  Chile   1234561290      +569247654321
*/

INSERT INTO categoría VALUES (1,'Frutas');
INSERT INTO categoría VALUES (2,'Verduras');
INSERT INTO categoría VALUES (3,'Tecnología');
INSERT INTO categoría VALUES (4,'Hogar');
INSERT INTO categoría VALUES (5,'Construcción');

/*
SELECT * FROM categoría;

idcategoría     nombre_categoria
1               Frutas
2               Verduras
3               Tecnología
4               Hogar
5               Construcción
*/

--0 es descontinuado false
INSERT INTO productos VALUES(1, 1999, 10, 0);
INSERT INTO productos VALUES(2, 2999, 9, 0);
INSERT INTO productos VALUES(3, 3999, 8, 0);
INSERT INTO productos VALUES(4, 4999, 8, 0);
INSERT INTO productos VALUES(5, 5999, 6, 0);

/*
SELECT * FROM productos;

idproductos    precio  stock    descontinuado
1              1999    10       0
2              2999    9        0
3              3999    8        0
4              4999    8        0
5              5999    6        0
*/

INSERT INTO proveedores VALUES (1,'Compañía 001', 'Contacto 001', 'Dirección 001', 1, '987654321');
INSERT INTO proveedores VALUES (2,'Compañía 002', 'Contacto 002', 'Dirección 002', 2, '987654987');
INSERT INTO proveedores VALUES (3,'Compañía 003', 'Contacto 003', 'Dirección 003', 3, '987654879');
INSERT INTO proveedores VALUES (4,'Compañía 004', 'Contacto 004', 'Dirección 004', 13, '987654999');
INSERT INTO proveedores VALUES (5,'Compañía 005', 'Contacto 005', 'Dirección 005', 5, '987654454');

/*
SELECT * FROM proveedores;
idproveedores   nombre_compañía     nombre_contacto     dirección       región  teléfono
1               Compañía 001        Contacto 001        Dirección 001   1       987654321
2               Compañía 002        Contacto 002        Dirección 002   2       987654987
3               Compañía 003        Contacto 003        Dirección 003   3       987654879
4               Compañía 004        Contacto 004        Dirección 004   13      987654999
5               Compañía 005        Contacto 005        Dirección 005   5       987654454
*/


--se efectúa una compra, notar que al principio, tal compra no tiene definido el valor, la cantidad de productos, ni los descuentos, como son not null, se establecen en cero
--dando inicio a la compra, luego se usa update para actualizar, cuando ya se han establecido las relaciones de acuerdo al mer y alas fk entre tablas, 0 se entiende como valor temporal

INSERT INTO compra VALUES (1,0,0,0);

/*
SELECT * FROM compra;
idcompra    valor   cantidad_productos  descuentos
1           0       0                   0
*/

--0 se entiende como valor temporal, los valores para la órden relacionada, para la lista de productos relacionada se definen en este punto
INSERT INTO despachadores VALUES (1, 'Despachador 001','+56978452154');
/*
SELECT * FROM despachadores;
iddespachadores     Nombre              teléfono_empresa
1                   Despachador 001     +56978452154
*/
INSERT INTO órdenes VALUES(1, '21-jan-01', '21-jan-02', 'Contacto 001', 'Dirección 002', 9876543210, 'Ciudad 019', 4, 'Chile', 7654321980);
/*
SELECT * FROM órdenes;

idórdenes   fecha_requerimiento     fecha_envío     nombre_destinatario     dirección       código_postal       ciudad      región      país        vía_envío
1           21/01/2001              21/01/2002      Contacto 001            Dirección 002   9876543210          Ciudad 019  4           Chile       7654321980
*/
INSERT INTO detalle_compra VALUES (1, 1, 0, 1);
/*
SELECT * FROM detalle_compra;

iddetallecompra ref_orden   cantidad_productos  ref_list_productos
1               1           0                   1
*/

--ya se puede según el modelo creado, definir la lista de productos en relación a los productos que se vayan comprando, para finalmente actualizar las tablas
--por ahora a menos que se exiga otra cosa, se realizarán insert y update "conociendo de antemano" la situación del stock, a futuro puede mejorarse esto 
--de varias maneras, controlando con objetos y métodos java por ejemplo o con lógica SQL en procedimietnos almacenados, restricciones, etc.


--se compran en este ejemplo, ciertas cantidades de tres productos en particular
INSERT INTO lista_productos VALUES (1,1,3,1);
INSERT INTO lista_productos VALUES (2,5,2,1);
INSERT INTO lista_productos VALUES (3,2,6,1);

SELECT * FROM productos;

/*
SELECT * FROM lista_productos WHERE idlistaproducto IN (1,2,3);

idlistaproducto     ref_producto    cantidad    ref_detalle
1                   1               3           1
2                   5               2           1
3                   2               6           1
*/

--los updates del caso 

/*
SELECT * FROM productos;

1    1999    10    0
2    2999    9    0
3    3999    8    0
4    4999    8    0
5    5999    6    0
*/

UPDATE productos SET stock = stock - 3 WHERE idproductos = 1;
UPDATE productos SET stock = stock - 2 WHERE idproductos = 5;
UPDATE productos SET stock = stock - 6 WHERE idproductos = 2;

/*
SELECT * FROM productos;

1    1999    7    0
2    2999    3    0
3    3999    8    0
4    4999    8    0
5    5999    4    0
*/

--se actualiza en reverso 

/*
SELECT SUM(cantidad) FROM lista_productos WHERE idlistaproducto IN (1,2,3);
-> 11

SELECT * FROM detalle_compra;
*/

UPDATE detalle_compra SET cantidad_productos = 11 WHERE iddetallecompra = 1;

/*
SELECT cantidad_productos FROM detalle_compra WHERE iddetallecompra = 1;
-> 11

SELECT * FROM compra WHERE idcompra = 1;
 
*/

UPDATE compra SET cantidad_productos = 11 WHERE idcompra = 1;
--por alguna lógica se retorna el total, puede como se mencionó, ser por java, u ota lógica, transacción, procedimiento almacenado, declare, etc , solo para el ejercicio se realiza de la siguiente manera

UPDATE compra SET valor = (
SELECT SUM(a.cantidad * b.precio) AS Total
FROM lista_productos a
INNER JOIN productos b
ON a.ref_producto = b.idproductos
WHERE a.idlistaproducto IS NOT NULL
)
WHERE idcompra = 1;

/*
SELECT * FROM compra WHERE idcompra = 1;

idcompra    valor       cantidad_productos  descuentos
1           35989       11                  0

INSERT INTO compra VALUES (2,0,0,0,0);
*/

--en este ejemplo no se aplican descuentos y no se aplica nada más que este registro (el cliente dejó pendiente el despacho y se le contactará para definir la orden de despacho con mayor detalle...


/*
4. Formular y ejecutar las consultas que correspondan, para obtener la siguiente
información:

b. Se necesita saber los nombre de los distribuidores de los productos más
vendidos, esto permitirá evaluar comprar por volumen. Solo es necesario que
se listen los nombres de todos los registros que cumplan con la solicitud
(?2 Puntos?)
*/

--se debería relacionar al cliente con la compra con alguna tabla intermedia como entidad que identique ambas tablas respecto de la compra, o en su defecto 
--controlar este particular con lógica java, parece ser mejor, por temas de seguridad y otros, realizar la lógica que permite esto o que altere la tabla clientes para incorporar 
--un atributo que identifique a la compra citada con el cliente, se elije esta, y se añade un alter table para un nuevo atributo ref_cliente en la tabla compra

SELECT * FROM compra;
 
ALTER TABLE compra ADD ref_cliente NUMBER(10);
ALTER TABLE compra DROP CONSTRAINT fk_comp_cli;
ALTER TABLE compra ADD CONSTRAINT fk_comp_cli FOREIGN KEY (ref_cliente) REFERENCES clientes(idclientes);

/*
SELECT * FROM clientes;
1    Empresa 001    Contacto 001    correo001@correo.com    Dirección 001    3    Ciudad 001    Chile    1234567890    +569987654321
2    Empresa 002    Contacto 002    correo002@correo.com    Dirección 002    7    Ciudad 002    Chile    1534567890    +569923654321
3    Empresa 003    Contacto 003    correo003@correo.com    Dirección 003    3    Ciudad 003    Chile    1237667890    +569984354321
4    Empresa 004    Contacto 004    correo004@correo.com    Dirección 004    9    Ciudad 004    Chile    1234587890    +569922654321
5    Empresa 005    Contacto 005    correo005@correo.com    Dirección 005    11    Ciudad 005    Chile    1234561290    +569247654321

SELECT * FROM compra
idcompra    valor   cantidad_productos  descuentos  ref_cliente
1           35989   11                  0           0
2           0       0                   0           0

UPDATE compra SET ref_cliente = 1 WHERE idcompra=1;
UPDATE compra SET ref_cliente = 2 WHERE idcompra=2;  

INSERT INTO compra VALUES(3,35989, 11, 0, 3);
INSERT INTO compra VALUES(4,24999, 8, 0, 4);

SELECT * FROM compra;
 
idcompra    valor   cantidad_productos  descuentos  ref_cliente
1           35989   11                  0           1
2           0       0                   0           2
*/


/*
a. Determinar cuál o cuáles son los clientes con las compras más altas y a qué
ciudad corresponden los mismos. Esto permitirá en un futuro que VendeTodo
SPA pueda buscar convenios con algunas empresas despachadoras. (?2
Puntos?)
*/
--devolvemos todos los que tengan el máximo valor 

SELECT a.nombre_contacto AS Cliente, a.ciudad AS Ciudad
FROM clientes a
INNER JOIN compra b
ON A.IDCLIENTES = b.ref_cliente
WHERE B.VALOR = (SELECT MAX(valor) FROM compra);

/*
Cliente         Ciudad
Contacto 001    Ciudad 001
Contacto 003    Ciudad 003
*/

/*
Se necesita saber los nombre de los distribuidores de los productos más
vendidos, esto permitirá evaluar comprar por volumen. Solo es necesario que
se listen los nombres de todos los registros que cumplan con la solicitud
(?2 Puntos?)
*/

--se eliminan las llaves foráneas anteriores asociadas a la llave primaria de las tablas órdenes y despachadores 
--para asignar llaves foráneas en el mismo contexto pero en dos nuevos atributos que alberguen dicha relación para 
--cada una de las tablas, se considera dejar este registro ya que el modelo está en construcción y estos cambios deben 
--ser evidenciados para el desafio

/*
ALTER TABLE despachadores ADD CONSTRAINT fk_desp_empl FOREIGN KEY (iddespachadores) REFERENCES empleados(idempleados);
ALTER TABLE órdenes ADD CONSTRAINT fk_órd_desp FOREIGN KEY (idórdenes) REFERENCES despachadores(iddespachadores);
ALTER TABLE detalle_compra ADD CONSTRAINT fk_det_órd FOREIGN KEY (iddetallecompra) REFERENCES órdenes(idórdenes);

*/

ALTER TABLE despachadores DROP CONSTRAINT fk_desp_empl;
ALTER TABLE órdenes DROP CONSTRAINT fk_órd_desp;
ALTER TABLE detalle_compra DROP CONSTRAINT fk_det_órd;

ALTER TABLE detalle_compra ADD ref_órdenes NUMBER(10);
ALTER TABLE detalle_compra ADD CONSTRAINT fk_det_órd FOREIGN KEY (ref_órdenes) REFERENCES órdenes(idórdenes);
ALTER TABLE órdenes ADD ref_despachadores NUMBER(10);
ALTER TABLE órdenes ADD CONSTRAINT fk_órd_desp FOREIGN KEY (ref_despachadores) REFERENCES despachadores(iddespachadores);
ALTER TABLE despachadores ADD ref_empleados NUMBER(10);
ALTER TABLE despachadores ADD CONSTRAINT fk_desp_empl FOREIGN KEY (ref_empleados) REFERENCES empleados(idempleados);

UPDATE órdenes SET ref_despachadores = 1 WHERE idórdenes = 1;
UPDATE despachadores SET ref_empleados = 1 WHERE iddespachadores = 1;

--con estas modificaciones queda así la consulta para la respuesta solicitada por el desafio en este modelo entidad relación
--los más vendidos serían entonces los que están primeros en la lista 

SELECT SUM(b.cantidad * c.precio) AS Total, c.idproductos AS Producto, e.nombre AS Despachador
FROM detalle_compra a
INNER JOIN lista_productos b
ON a.ref_lista_productos = b.ref_detalle
INNER JOIN productos c
ON b.ref_producto = c.idproductos
INNER JOIN órdenes d
ON a.ref_orden = d.idórdenes
INNER JOIN despachadores e
ON d.ref_despachadores = e.iddespachadores
GROUP BY c.idproductos, e.nombre
ORDER BY SUM(b.cantidad * c.precio) DESC;

/*
TOTAL   PRODUCTO    DESPACHADOR
17994   2           Despachador 001
11998   5           Despachador 001
5997    1           Despachador 001
*/

--se considera apropiado romper las relaciones de llaves foráneas referidas desde las llaves primarias para las tablas proveedores y productos
--siendo esta la última acción para este scrip, no pedido por el desafío pero encontrado como "razonable de realizar"

/*
ALTER TABLE productos ADD CONSTRAINT fk_prod_cat FOREIGN KEY (idproductos) REFERENCES categoría(idcategoría);
ALTER TABLE proveedores ADD CONSTRAINT fk_prov_prod FOREIGN KEY (idproveedores) REFERENCES productos(idproductos);
*/

ALTER TABLE productos DROP CONSTRAINT fk_prod_cat;
ALTER TABLE proveedores DROP CONSTRAINT fk_prov_prod;
ALTER TABLE productos ADD ref_categoría NUMBER(10);
ALTER TABLE proveedores ADD ref_productos NUMBER(10);
ALTER TABLE productos ADD CONSTRAINT fk_prod_cat FOREIGN KEY (ref_categoría) REFERENCES categoría(idcategoría);
ALTER TABLE proveedores ADD CONSTRAINT fk_prov_prod FOREIGN KEY (ref_productos) REFERENCES productos(idproductos);

UPDATE productos SET ref_categoría = 1 WHERE idproductos = 1;
UPDATE productos SET ref_categoría = 2 WHERE idproductos = 2;
UPDATE productos SET ref_categoría = 3 WHERE idproductos = 3;
UPDATE productos SET ref_categoría = 4 WHERE idproductos = 4;
UPDATE productos SET ref_categoría = 5 WHERE idproductos = 5;

UPDATE proveedores SET ref_productos = 1 WHERE idproveedores = 1;
UPDATE proveedores SET ref_productos = 2 WHERE idproveedores = 2;
UPDATE proveedores SET ref_productos = 3 WHERE idproveedores = 3;
UPDATE proveedores SET ref_productos = 4 WHERE idproveedores = 4;
UPDATE proveedores SET ref_productos = 5 WHERE idproveedores = 5;

--se considera que, para el ejercicio es correcto el modelo, sin embargo, es susceptible de correciones de acuerdo a la complejidad de la realidad que modela, como por ejemplo, añadir una vista o una nueva tabla para disminuir
--los joins entre entidades, cambiar la llave foránea refiriendo a un atgributo distinto de la llave primaria para aquellas tablas que aún tengan esta condición, etc.  