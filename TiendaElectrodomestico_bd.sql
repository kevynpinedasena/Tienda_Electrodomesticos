CREATE SCHEMA tienda_Tecnologica;

USE tienda_Tecnologica;

CREATE TABLE producto (
	id_pro varchar(10) primary key not null,
    nombre_pro varchar (100),
    precio_pro double,
    marca_pro varchar(50),
    tipo_pro varchar(50)
);

CREATE TABLE cliente (
	documento_cli varchar(15) primary key not null,
    nombre_cli varchar(50),
    apellido_cli varchar(50),
    telefono_cli varchar(50),
    direccion_cli varchar(50),
    ciudad_cli varchar(50)
);

CREATE TABLE proveedores (
	nit_provee varchar(15) primary key not null,
    razon_social varchar(50),
    nombre_provee varchar(20),
    apellido_provee varchar(20),
    direccion_provee varchar(20),
    ciudad_provee varchar(20),
    telefono_provee varchar(15)
);

CREATE TABLE venta (
	fecha_venta date,
    producto_id varchar(10),
    documento_clien varchar(15),
    FOREIGN KEY (producto_id) REFERENCES producto (id_pro),
    FOREIGN KEY (documento_clien) REFERENCES cliente (documento_cli)
);

CREATE TABLE provee_produc (
	doc_provee varchar(15),
    id_produc varchar(10),
    FOREIGN KEY (doc_provee) REFERENCES proveedores(nit_provee),
    FOREIGN KEY (id_produc) REFERENCES producto(id_pro)
);

/*----------------------- PROCEDIMIENTO ALMACENADOS -----------------------------*/

DELIMITER $$
CREATE PROCEDURE sp_Insertar_Clientclientee (documento_cli VARCHAR(15), nombre_cli VARCHAR(50), apellido_cli VARCHAR(50), telefono_cli VARCHAR(50), direccion_cli varchar(50), ciudad_Cli VARCHAR(50))
	BEGIN
		DECLARE documento varchar(15);
        DECLARE nombre varchar(50);
        DECLARE apellido varchar(50);
        DECLARE telefono varchar(50);
        DECLARE direccion varchar(50);
        DECLARE ciudad varchar(50);
        
		INSERT INTO cliente VALUES (documento_cli, nombre_cli, apellido_cli, telefono_cli, direccion_cli, ciudad_Cli);
	END; $$
DELIMITER ;

CALL sp_Insertar_Clientclientee('111','MARIA CARMEN' , 'PEDROO', '315222', 'CALL-55', 'ARMENIA');
