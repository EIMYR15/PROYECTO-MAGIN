CREATE database proyecto_formativo_magin;

USE database proyecto_formativo_magin;

CREATE TABLE proyecto_formativo_magin.tipo_documento (
	id BIGINT auto_increment NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	abreviatura VARCHAR(5) NULL,
	CONSTRAINT tipo_documento_pk PRIMARY KEY (id)
);

CREATE TABLE proyecto_formativo_magin.pais (
	id SMALLINT UNSIGNED auto_increment NOT NULL,
	codigo VARCHAR(100) NULL,
	nombre VARCHAR(255) NULL,
	CONSTRAINT pais_pk PRIMARY KEY (id)
);

CREATE TABLE proyecto_formativo_magin.rol (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre VARCHAR(100) NULL,
	descripcion VARCHAR(255) NULL,
	CONSTRAINT rol_pk PRIMARY KEY (id)
);

CREATE TABLE proyecto_formativo_magin.cargo (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre VARCHAR(150) NULL,
	descripcion VARCHAR(255) NULL,
	salario_base DECIMAL NULL,
	fecha_ingreso DATETIME NULL,
	CONSTRAINT cargo_pk PRIMARY KEY (id)
);


CREATE TABLE proyecto_formativo_magin.usuario (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	tipo_documento_id INT UNSIGNED NULL,
	numero_documento VARCHAR(150) NULL,
	primer_nombre VARCHAR(100) NULL,
	segundo_nombre VARCHAR(100) NULL,
	primer_apellido VARCHAR(100) NULL,
	segundo_apellido VARCHAR(100) NULL,
	direccion VARCHAR(255) NULL,
	celular BIGINT NULL,
	correo VARCHAR(200) NOT NULL,
	municipio_id INT UNSIGNED NULL,
	departamento_id SMALLINT UNSIGNED NULL,
	pais_id SMALLINT UNSIGNED NULL,
	cargo_id INT UNSIGNED NULL,
	rol_id INT UNSIGNED NULL,
	CONSTRAINT usuario_pk PRIMARY KEY (id),
	CONSTRAINT usuario_unique UNIQUE KEY (correo),
	CONSTRAINT usuario_unique_celular UNIQUE KEY (celular),
	CONSTRAINT usuario_municipio_FK FOREIGN KEY (municipio_id) REFERENCES proyecto_formativo_magin.municipio(id),
	CONSTRAINT usuario_departamento_FK FOREIGN KEY (departamento_id) REFERENCES proyecto_formativo_magin.departamento(id),
	CONSTRAINT usuario_pais_FK FOREIGN KEY (pais_id) REFERENCES proyecto_formativo_magin.pais(id),
	CONSTRAINT usuario_cargo_FK FOREIGN KEY (cargo_id) REFERENCES proyecto_formativo_magin.cargo(id)
);

CREATE TABLE proyecto_formativo_magin.estado (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre VARCHAR(50) NULL,
	CONSTRAINT estado_pk PRIMARY KEY (id)
);

CREATE TABLE proyecto_formativo_magin.prioridad (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre VARCHAR(10) NULL,
	CONSTRAINT prioridad_pk PRIMARY KEY (id)
);

CREATE TABLE proyecto_formativo_magin.tiempo (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre VARCHAR(10) NULL,
	CONSTRAINT tiempo_pk PRIMARY KEY (id)
);

CREATE TABLE proyecto_formativo_magin.proyecto (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre VARCHAR(150) NULL,
	descripcion VARCHAR(255) NULL,
	fecha_inicio DATETIME NULL,
	fecha_finalizacion DATETIME NULL,
	estado_id INT UNSIGNED NULL,
	cliente_id INT UNSIGNED NULL,
	CONSTRAINT proyecto_pk PRIMARY KEY (id)
);

CREATE TABLE proyecto_formativo_magin.cliente (
	id INT UNSIGNED auto_increment NOT NULL,
	tipo_documento_id INT UNSIGNED NULL,
	numero_documento varchar(100) NULL,
	nombre varchar(255) NULL,
	direccion varchar(255) NULL,
	telefono BIGINT NOT NULL,
	celular BIGINT NOT NULL,
	correo varchar(150) NOT NULL,
	proyecto_id INT UNSIGNED NULL,
	estado_id INT UNSIGNED NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (id),
	CONSTRAINT cliente_unique_telefono UNIQUE KEY (telefono),
	CONSTRAINT cliente_unique_celular UNIQUE KEY (celular),
	CONSTRAINT cliente_unique_correo UNIQUE KEY (correo),
	CONSTRAINT cliente_tipo_documento_FK FOREIGN KEY (tipo_documento_id) REFERENCES proyecto_formativo_magin.tipo_documento(id),
	CONSTRAINT cliente_proyecto_FK FOREIGN KEY (proyecto_id) REFERENCES proyecto_formativo_magin.proyecto(id),
	CONSTRAINT cliente_estado_FK FOREIGN KEY (estado_id) REFERENCES proyecto_formativo_magin.estado(id)
);

CREATE TABLE proyecto_formativo_magin.usuario_cliente (
	id INT UNSIGNED auto_increment NOT NULL,
	cliente_id INT UNSIGNED NULL,
	usuario_id BIGINT UNSIGNED NULL,
	CONSTRAINT usuario_cliente_pk PRIMARY KEY (id),
	CONSTRAINT usuario_cliente_cliente_FK FOREIGN KEY (cliente_id) REFERENCES proyecto_formativo_magin.cliente(id),
	CONSTRAINT usuario_cliente_usuario_FK FOREIGN KEY (usuario_id) REFERENCES proyecto_formativo_magin.usuario(id)
);


CREATE TABLE proyecto_formativo_magin.usuario_proyecto (
	id INT UNSIGNED auto_increment NOT NULL,
	proyecto_id INT UNSIGNED NULL,
	usuario_id BIGINT UNSIGNED NULL,
	CONSTRAINT usuario_proyecto_pk PRIMARY KEY (id),
	CONSTRAINT usuario_proyecto_proyecto_FK FOREIGN KEY (proyecto_id) REFERENCES proyecto_formativo_magin.proyecto(id),
	CONSTRAINT usuario_proyecto_usuario_FK FOREIGN KEY (usuario_id) REFERENCES proyecto_formativo_magin.usuario(id)
);

CREATE TABLE proyecto_formativo_magin.tarea (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre varchar(150) NULL,
	descripcion TEXT NULL,
	fecha_creacion DATETIME NULL,
	fecha_vencimiento DATETIME NULL,
	estado_id INT UNSIGNED NULL,
	prioridad_id INT UNSIGNED NULL,
	usuario_id BIGINT UNSIGNED NULL,
	proyecto_id INT UNSIGNED NULL,
	CONSTRAINT tarea_pk PRIMARY KEY (id),
	CONSTRAINT tarea_estado_FK FOREIGN KEY (estado_id) REFERENCES proyecto_formativo_magin.estado(id),
	CONSTRAINT tarea_prioridad_FK FOREIGN KEY (prioridad_id) REFERENCES proyecto_formativo_magin.prioridad(id),
	CONSTRAINT tarea_usuario_FK FOREIGN KEY (usuario_id) REFERENCES proyecto_formativo_magin.usuario(id),
	CONSTRAINT tarea_proyecto_FK FOREIGN KEY (proyecto_id) REFERENCES proyecto_formativo_magin.proyecto(id)
);

CREATE TABLE proyecto_formativo_magin.tipo_tiempo (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre varchar(150) NULL,
	CONSTRAINT tipo_tiempo_pk PRIMARY KEY (id)
);

CREATE TABLE proyecto_formativo_magin.tiempo (
	id INT UNSIGNED auto_increment NOT NULL,
	proyecto_id INT UNSIGNED NULL,
	tarea_id INT UNSIGNED NULL,
	usuario_id BIGINT UNSIGNED NULL,
	fecha_inicio DATETIME NULL,
	fecha_fin DATETIME NULL,
	duracion TIME NULL,
	tipo_tiempo_id INT UNSIGNED NULL,
	comentario TEXT NULL,
	estado_id INT UNSIGNED NULL,
	facturable BOOL NULL,
	fecha_registro DATETIME NULL,
	CONSTRAINT tiempo_pk PRIMARY KEY (id),
	CONSTRAINT tiempo_proyecto_FK FOREIGN KEY (proyecto_id) REFERENCES proyecto_formativo_magin.proyecto(id),
	CONSTRAINT tiempo_tarea_FK FOREIGN KEY (tarea_id) REFERENCES proyecto_formativo_magin.tarea(id),
	CONSTRAINT tiempo_usuario_FK FOREIGN KEY (usuario_id) REFERENCES proyecto_formativo_magin.usuario(id),
	CONSTRAINT tiempo_tipo_tiempo_FK FOREIGN KEY (tipo_tiempo_id) REFERENCES proyecto_formativo_magin.tipo_tiempo(id),
	CONSTRAINT tiempo_estado_FK FOREIGN KEY (estado_id) REFERENCES proyecto_formativo_magin.estado(id)
);

CREATE TABLE proyecto_formativo_magin.ticket_externo (
	id INT UNSIGNED auto_increment NOT NULL,
	estado_id INT UNSIGNED NULL,
	prioridad_id INT UNSIGNED NULL,
	tiempo_id INT UNSIGNED NULL,
	usuario_cliente_id INT UNSIGNED NULL,
	CONSTRAINT ticket_externo_pk PRIMARY KEY (id),
	CONSTRAINT ticket_externo_estado_FK FOREIGN KEY (estado_id) REFERENCES proyecto_formativo_magin.estado(id),
	CONSTRAINT ticket_externo_prioridad_FK FOREIGN KEY (prioridad_id) REFERENCES proyecto_formativo_magin.prioridad(id),
	CONSTRAINT ticket_externo_prioridad_FK_1 FOREIGN KEY (prioridad_id) REFERENCES proyecto_formativo_magin.prioridad(id),
	CONSTRAINT ticket_externo_tiempo_FK FOREIGN KEY (tiempo_id) REFERENCES proyecto_formativo_magin.tiempo(id),
	CONSTRAINT ticket_externo_usuario_cliente_FK FOREIGN KEY (usuario_cliente_id) REFERENCES proyecto_formativo_magin.usuario_cliente(id)
);

CREATE TABLE proyecto_formativo_magin.ticket_proyecto (
	id INT UNSIGNED auto_increment NOT NULL,
	usuario_proyecto INT UNSIGNED NULL,
	tiempo_id INT UNSIGNED NULL,
	tarea_id INT UNSIGNED NULL,
	CONSTRAINT ticket_proyecto_pk PRIMARY KEY (id),
	CONSTRAINT ticket_proyecto_usuario_proyecto_FK FOREIGN KEY (usuario_proyecto) REFERENCES proyecto_formativo_magin.usuario_proyecto(id),
	CONSTRAINT ticket_proyecto_tiempo_FK FOREIGN KEY (tiempo_id) REFERENCES proyecto_formativo_magin.tiempo(id),
	CONSTRAINT ticket_proyecto_tarea_FK FOREIGN KEY (tarea_id) REFERENCES proyecto_formativo_magin.tarea(id)
);









