CREATE DATABASE IF NOT EXISTS empresa2;
USE empresa2;

CREATE TABLE especializacion(
cod_esp INT auto_increment,
 descripcion VARCHAR(50),
 PRIMARY KEY (cod_esp)
);

CREATE TABLE estado(
cod_est TINYINT auto_increment,
 descripcion VARCHAR(20),
 PRIMARY KEY (cod_est)
);

CREATE TABLE departamento(
 identificador INT auto_increment,
 nombre VARCHAR (50),
 cod_estado TINYINT NOT NULL,
 PRIMARY KEY (identificador),
 FOREIGN KEY (cod_estado) REFERENCES estado (cod_est)
);

CREATE TABLE empleado(
 legajo INT auto_increment,
 dni INT NOT NULL UNIQUE,
 nombre VARCHAR(50),
 salario float,
 f_nac DATE,
 dir_legajo INT NOT NULL,
 identificador INT NOT NULL,
 PRIMARY KEY (legajo),
 FOREIGN KEY (dir_legajo) REFERENCES empleado (legajo),
 FOREIGN KEY (identificador) REFERENCES departamento (identificador)
);

CREATE TABLE empleado_especializacion(
legajo INT,
 cod_esp INT,
 CONSTRAINT emp_esp_pk PRIMARY KEY (legajo, cod_esp),
 FOREIGN KEY (legajo) REFERENCES empleado (legajo),
 FOREIGN KEY (cod_esp) REFERENCES especializacion (cod_esp)
);
