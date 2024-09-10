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

CREATE TABLE proyecto_magin.Cliente (
	id INT UNSIGNED auto_increment NOT NULL,
	Nit_cliente INT UNSIGNED NULL,
	Numero varchar(80) NULL,
	Nombre varchar(150) NULL,
	Direccion varchar(150) NULL,
	Region_id INT UNSIGNED NULL,
	Fijo varchar(50) NULL,
	Celular varchar(50) NULL,
	Correo varchar(100) NULL,
	Fecha_registro DATETIME NULL,
	CONSTRAINT Cliente_PK PRIMARY KEY (id)
	ALTER TABLE proyecto_magin.Cliente ADD CONSTRAINT Cliente_Nit_cliente_FK FOREIGN KEY (Nit_cliente_id) REFERENCES proyecto_magin.Nit_cliente(id);
	ALTER TABLE proyecto_magin.Cliente ADD CONSTRAINT Cliente_Region_FK FOREIGN KEY (Region_id) REFERENCES proyecto_magin.Region(id);

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Departamento (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	Pais_id INT UNSIGNED NULL,
	CONSTRAINT Departamento_PK PRIMARY KEY (id)
	ALTER TABLE proyecto_magin.Departamento ADD CONSTRAINT Departamento_Pais_FK FOREIGN KEY (Pais_id) REFERENCES proyecto_magin.Pais(id);

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Provincia (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	Pais_id INT UNSIGNED NULL,
	CONSTRAINT Provincia_PK PRIMARY KEY (id)
	ALTER TABLE proyecto_magin.Provincia ADD CONSTRAINT Provincia_Pais_FK FOREIGN KEY (Pais_id) REFERENCES proyecto_magin.Pais(id);

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Estado_federado (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(100) NULL,
	Pais_id INTEGER UNSIGNED NULL,
	CONSTRAINT Estado_federado_PK PRIMARY KEY (id)
	ALTER TABLE proyecto_magin.Estado_federado ADD CONSTRAINT Estado_federado_Pais_FK FOREIGN KEY (Pais_id) REFERENCES proyecto_magin.Pais(id);

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Region (
	id INT UNSIGNED auto_increment NOT NULL,
	Pais_id INT UNSIGNED NULL,
	Departamento_id INT UNSIGNED NULL,
	Provincia_id INT UNSIGNED NULL,
	Estado_federado_id INT UNSIGNED NULL,
	CONSTRAINT Region_PK PRIMARY KEY (id),
	CONSTRAINT Region_Pais_FK FOREIGN KEY (Pais_id) REFERENCES proyecto_magin.Pais(id),
	CONSTRAINT Region_Departamento_FK FOREIGN KEY (Departamento_id) REFERENCES proyecto_magin.Departamento(id),
	CONSTRAINT Region_Provincia_FK FOREIGN KEY (Provincia_id) REFERENCES proyecto_magin.Provincia(id),
	CONSTRAINT Region_Estado_federado_FK FOREIGN KEY (Estado_federado_id) REFERENCES proyecto_magin.Estado_federado(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

