CREATE SCHEMA `tienda_zapatillas`;
USE `tienda_zapatillas`;

CREATE TABLE zapatillas (
	id_zapatilla INT AUTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL,
    
    PRIMARY KEY (id_zapatilla));

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT(9) NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL,
    
    PRIMARY KEY(id_cliente));
    
    
CREATE TABLE empleados (
	id_empleado INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL,
    
    PRIMARY KEY(id_empleado));
    
CREATE TABLE facturas (
	id_factura INT AUTO_INCREMENT NOT NULL,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_factura),
    CONSTRAINT fk_zapatilla
		FOREIGN KEY (id_zapatilla)
        REFERENCES zapatillas (id_zapatilla)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT fk_empleado
		FOREIGN KEY (id_empleado)
        REFERENCES empleados (id_empleado)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT fk_cliente
		FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE);
        
        -- PARTE PAIR MODIFICACION E INSERCIÓN DE DATOS -- LECCIÓN 6 SQL
        
        -- ejercicio 1 
        
        ALTER TABLE	zapatillas
			ADD	COLUMN marca VARCHAR(45) NOT NULL,
            ADD	COLUMN talla INT NOT NULL; 
            
		ALTER TABLE empleados
			CHANGE type salario FLOAT; 
            
		ALTER TABLE clientes
			DROP column pais;
    
		ALTER TABLE facturas
			ADD COLUMN total FLOAT; 
    
       -- ejercicio 2 
       
       USE tienda_zapatillas;
       
       INSERT INTO zapatillas (modelo, color, marca, talla)
       values("xqyun", "negro", 'Nike','42' ),
       ("uopmn" , "rosas",'Nike' ,'39' ),
       ("opnyt", "verdes", 'Adidas','35'); 
       
       INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
       values("Laura", "Alcobendas", 25987, "2010-09-03"),
       ("Maria", "Sevilla", NULL, "2001-11-04"),
       ("Esther", "Oviedo", 30165.98, "2000-11-29");
       
       INSERT INTO clientes (nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
       values ("Monica", "1234567289", "monica@email.com", "Calle Felicidad", "Móstoles", "Madrid", 28176),
			  ("Lorena", "289345678", "lorena@email.com", "Calle Alegria", "Barcelona", "Barcelona", 12346),
			  ("Carmen", "298463759", "carmen@email.com", "Calle del Color", "Vigo", "Pontevedra", 23456);
       
       -- ALTER TABLE facturas
		-- AUTO_INCREMENT = 1; (para resetear los IDs en el caso de que hubieran dado errores e incrementasemos más ID)
    
       INSERT INTO facturas (numero_factura, fecha, id_zapatilla, id_empleado, id_cliente, total)
       values (123, "2001-12-11", 1, 2, 1, 54.98), 
			  (1234, "2005-05-23", 1, 1, 3, 89.91),
              (12345, "2015-09-18", 2, 3, 3, 76.23); 
       
       
       -- Ejercicio 3: 
       
	USE tienda_zapatillas;
      
	UPDATE zapatillas
	SET color = "amarilla" where color = "rosas"; 

	UPDATE empleados
	SET tienda = "A Coruña" where nombre = "Laura"; 

	UPDATE clientes
	SET numero_telefono = "123456728" where nombre = "Mónica"; 

	UPDATE facturas
	SET total = 89.91 where id_factura = 2;

 
      
    
