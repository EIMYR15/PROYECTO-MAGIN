CREATE TABLE proyecto_magin.Tipo_documento (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	Abreviatura varchar(5) NULL,
	CONSTRAINT Tipo_documento_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE proyecto_magin.Nit_cliente (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	CONSTRAINT Nit_cliente_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Prioridad (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	CONSTRAINT Prioridad_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Cargo (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(150) NULL,
	Funciones varchar(255) NULL,
	Fecha_ingreso DATETIME NULL,
	Fecha_retiro DATETIME NULL,
	CONSTRAINT Cargo_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Estado (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	CONSTRAINT Estado_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Estado_usuario (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(50) NULL,
	CONSTRAINT Estado_usuario_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Tipo_usuario (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(50) NULL,
	CONSTRAINT Tipo_usuario_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Rol (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	CONSTRAINT Rol_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Tipo_notificacion_cliente (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	CONSTRAINT Tipo_notificacion_cliente_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Proceso (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	CONSTRAINT Proceso_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Tipo_reporte (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	CONSTRAINT Tipo_reporte_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Pais (
	id INT UNSIGNED auto_increment NOT NULL,
	Indicativo varchar(10) NULL,
	Nombre varchar(100) NULL,
	CONSTRAINT Pais_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


