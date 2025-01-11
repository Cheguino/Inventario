CREATE SCHEMA Proyetto;
USE Proyetto;


-- Crear la tabla articulo
CREATE TABLE ARTICULO (

  numero_serie VARCHAR(100) NOT NULL,
  marca VARCHAR(100) NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  categoria VARCHAR(100) NOT NULL,
  ubicacion VARCHAR(100) NOT NULL,
    PRIMARY KEY (numero_serie)
);

insert into ARTICULO(numero_serie, marca) VALUES('admin', '12345');


SELECT * FROM ARTICULO; 
UPDATE ARTICULO SET  
ARTICULO.marca = "EMPIRICO", 
ARTICULO.modelo = "222", 
ARTICULO.categoria = "333", 
ARTICULO.ubicacion = "44", 
ARTICULO.estado = "555" WHERE ARTICULO.numero_serie = "ggg"; 



UPDATE ARTICULO SET marca = 'poo', modelo = '222', categoria = '333', ubicacion = '44' WHERE numero_serie = '1234'; 


CREATE TABLE USUARIO(
  NumIdentificacion VARCHAR(100) NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Telefono VARCHAR(100) NOT NULL,
  Correo VARCHAR(100) NOT NULL,
                                 -- contrapass VARCHAR(100)
  PRIMARY KEY (NumIdentificacion)
);

ALTER TABLE USUARIO ADD Pass VARCHAR(100) ;

ALTER TABLE USUARIO DROP COLUMN Pass;

CREATE TABLE LOGIN (
ID INT auto_increment NOT NULL, 
ingresoUsuario nvarchar(100),
ingresoContrasenia nvarchar(100),
  PRIMARY KEY (ID)
);

insert into LOGIN(ingresoUsuario, ingresoContrasenia) VALUES('admin', '12345');
insert into LOGIN(ingresoUsuario, ingresoContrasenia) VALUES('Usuario1', '234');

SELECT * FROM LOGIN;

SELECT * FROM LOGIN WHERE LOGIN.ingresoUsuario = 'admin' AND LOGIN.ingresoContrasenia = '12345';

insert into LOGIN(ingresoUsuario, ingresoContrasenia) VALUES('usuario', 'contra');






-- Crear la tabla tecnico
CREATE TABLE tecnico (
  numero_ficha INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  numero_telefono VARCHAR(20) NOT NULL,
  PRIMARY KEY (numero_ficha)
);



-- Crear la tabla alumno
CREATE TABLE alumno (
  numero_control INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  numero_semestre INT NOT NULL,
  carrera VARCHAR(50) NOT NULL,
  PRIMARY KEY (numero_control)
);

-- Crear la tabla servicio_social
CREATE TABLE servicio_social (
  numero_telefono INT NOT NULL,
  carrera VARCHAR(50) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  numero_semestre INT NOT NULL,
  numero_control INT NOT NULL,
  PRIMARY KEY (numero_control)
);

-- Crear la tabla administrativo
CREATE TABLE administrativo (
  numero_ficha INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  numero_telefono INT NOT NULL,
  correo VARCHAR(50) NOT NULL,
  PRIMARY KEY (numero_ficha)
);

-- Crear la tabla jefe
CREATE TABLE jefe (
  numero_ficha INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  numero_contacto INT NOT NULL,
  PRIMARY KEY (numero_ficha)
);

-- Crear la tabla reparar N:M
CREATE TABLE reparar (
  numero_ficha INT NOT NULL,
  numero_serie INT NOT NULL,
  FOREIGN KEY (numero_ficha) REFERENCES tecnico(numero_ficha),
  FOREIGN KEY (numero_serie) REFERENCES articulo(numero_serie),
  PRIMARY KEY (numero_ficha, numero_serie)
);

-- Crear la tabla solicita N:1
CREATE TABLE solicita (
  numero_control INT NOT NULL,
  numero_serie INT NOT NULL,
  hora_solicitado TIMESTAMP NOT NULL,
  hora_finalizado TIMESTAMP NOT NULL,
  FOREIGN KEY (numero_control) REFERENCES alumno(numero_control),
  FOREIGN KEY (numero_serie) REFERENCES articulo(numero_serie),
  PRIMARY KEY (numero_control, numero_serie)
);

-- Crear la tabla gestionar N:M en servicio social
CREATE TABLE gestionar (
  numero_control INT,
  numero_serie INT,
  FOREIGN KEY (numero_control) REFERENCES servicio_social(numero_control),
  FOREIGN KEY (numero_serie) REFERENCES articulo(numero_serie),
  PRIMARY KEY (numero_control, numero_serie)
);

-- Crear la tabla consultar N:M
CREATE TABLE consultar (
  numero_ficha INT,
  numero_serie INT,
  FOREIGN KEY (numero_ficha) REFERENCES administrativo(numero_ficha),
  FOREIGN KEY (numero_serie) REFERENCES articulo(numero_serie),
  PRIMARY KEY (numero_ficha, numero_serie)
);

-- 1:N
CREATE TABLE ordenes (
    id_orden INT NOT NULL AUTO_INCREMENT,
    id_administrativo INT NOT NULL,
    id_jefe INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    descripcion VARCHAR(255),
    PRIMARY KEY (id_orden),
    FOREIGN KEY (id_administrativo) REFERENCES administrativo(id_administrativo),
    FOREIGN KEY (id_jefe) REFERENCES jefe(id_jefe)
)
  