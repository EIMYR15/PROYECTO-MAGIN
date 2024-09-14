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

CREATE TABLE proyecto_magin.Usuario_proyecto (
	id INT UNSIGNED auto_increment NOT NULL,
	Tipo_documento_id INT UNSIGNED NULL,
	Tipo_usuario_id INT UNSIGNED NULL,
	Estado_usuario_id INT UNSIGNED NULL,
	Identificacion varchar(100) NULL,
	Nombre_completo varchar(255) NULL,
	Direccion varchar(150) NULL,
	Region_id INT UNSIGNED NULL,
	Celular varchar(50) NULL,
	Cargo_id INT UNSIGNED NULL,
	Rol_id INT UNSIGNED NULL,
	Correo varchar(150) NULL,
	CONSTRAINT Usuario_proyecto_PK PRIMARY KEY (id),
	CONSTRAINT Usuario_proyecto_UNIQUE_correo UNIQUE KEY (Correo),
	CONSTRAINT Usuario_proyecto_UNIQUE_celular UNIQUE KEY (Celular),
	CONSTRAINT Usuario_proyecto_Tipo_documento_FK FOREIGN KEY (Tipo_documento_id) REFERENCES proyecto_magin.Tipo_documento(id),
	CONSTRAINT Usuario_proyecto_Tipo_usuario_FK FOREIGN KEY (Tipo_usuario_id) REFERENCES proyecto_magin.Tipo_usuario(id),
	CONSTRAINT Usuario_proyecto_Estado_usuario_FK FOREIGN KEY (Estado_usuario_id) REFERENCES proyecto_magin.Estado_usuario(id),
	CONSTRAINT Usuario_proyecto_Region_FK FOREIGN KEY (Region_id) REFERENCES proyecto_magin.Region(id),
	CONSTRAINT Usuario_proyecto_Rol_FK FOREIGN KEY (Rol_id) REFERENCES proyecto_magin.Rol(id),
	CONSTRAINT Usuario_proyecto_Cargo_FK FOREIGN KEY (Cargo_id) REFERENCES proyecto_magin.Cargo(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Usuario_cliente (
	id INT UNSIGNED auto_increment NOT NULL,
	Cliente_id INT UNSIGNED NULL,
	Usuario_proyecto_id INT UNSIGNED NULL,
	CONSTRAINT Usuario_cliente_PK PRIMARY KEY (id),
	CONSTRAINT Usuario_cliente_Cliente_FK FOREIGN KEY (Cliente_id) REFERENCES proyecto_magin.Cliente(id),
	CONSTRAINT Usuario_cliente_Usuario_proyecto_FK FOREIGN KEY (Usuario_proyecto_id) REFERENCES proyecto_magin.Usuario_proyecto(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Proyecto (
	id INT UNSIGNED auto_increment NOT NULL,
	codigo varchar(10) NULL,
	requerimientos varchar(255) NULL,
	Usuario_proyecto_id INT UNSIGNED NULL,
	Estado_id INT UNSIGNED NULL,
	Prioridad_id INT UNSIGNED NULL,
	CONSTRAINT Proyecto_PK PRIMARY KEY (id),
	CONSTRAINT Proyecto_Usuario_proyecto_FK FOREIGN KEY (Usuario_proyecto_id) REFERENCES proyecto_magin.Usuario_proyecto(id),
	CONSTRAINT Proyecto_Estado_FK FOREIGN KEY (Estado_id) REFERENCES proyecto_magin.Estado(id),
	CONSTRAINT Proyecto_Prioridad_FK FOREIGN KEY (Prioridad_id) REFERENCES proyecto_magin.Prioridad(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Tarea (
	id INT UNSIGNED auto_increment NOT NULL,
	Nombre varchar(150) NULL,
	Proyecto_id INT UNSIGNED NULL,
	Usuario_cliente_id INT UNSIGNED NULL,
	Prioridad_id INT UNSIGNED NULL,
	Estado_id INT UNSIGNED NULL,
	Proceso_id INT UNSIGNED NULL,
	Comentario varchar(255) NULL,
	Fecha_creacion DATETIME NULL,
	Fecha_limite DATETIME NULL,
	Fecha_finalizacion DATETIME NULL,
	CONSTRAINT Tarea_PK PRIMARY KEY (id),
	CONSTRAINT Tarea_Proyecto_FK FOREIGN KEY (Proyecto_id) REFERENCES proyecto_magin.Proyecto(id),
	CONSTRAINT Tarea_Usuario_cliente_FK FOREIGN KEY (Usuario_cliente_id) REFERENCES proyecto_magin.Usuario_cliente(id),
	CONSTRAINT Tarea_Prioridad_FK FOREIGN KEY (Prioridad_id) REFERENCES proyecto_magin.Prioridad(id),
	CONSTRAINT Tarea_Estado_FK FOREIGN KEY (Estado_id) REFERENCES proyecto_magin.Estado(id),
	CONSTRAINT Tarea_Proceso_FK FOREIGN KEY (Proceso_id) REFERENCES proyecto_magin.Proceso(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Notificacion (
	id INT UNSIGNED auto_increment NOT NULL,
	Tipo_notificacion_cliente_id INT UNSIGNED NULL,
	Estado_id INT UNSIGNED NULL,
	Prioridad_id INT UNSIGNED NULL,
	Fecha DATETIME NULL,
	CONSTRAINT Notificacion_PK PRIMARY KEY (id),
	CONSTRAINT Notificacion_Tipo_notificacion_cliente_FK FOREIGN KEY (Tipo_notificacion_cliente_id) REFERENCES proyecto_magin.Tipo_notificacion_cliente(id),
	CONSTRAINT Notificacion_Estado_FK FOREIGN KEY (Estado_id) REFERENCES proyecto_magin.Estado(id),
	CONSTRAINT Notificacion_Prioridad_FK FOREIGN KEY (Prioridad_id) REFERENCES proyecto_magin.Prioridad(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Reporte (
	id INT UNSIGNED auto_increment NOT NULL,
	Tipo_reporte_id INT UNSIGNED NULL,
	Proyecto_id INT UNSIGNED NULL,
	Usuario_proyecto_id INT UNSIGNED NULL,
	Plan_accion varchar(255) NULL,
	Fecha DATETIME NULL,
	CONSTRAINT Reporte_PK PRIMARY KEY (id),
	CONSTRAINT Reporte_Tipo_reporte_FK FOREIGN KEY (Tipo_reporte_id) REFERENCES proyecto_magin.Tipo_reporte(id),
	CONSTRAINT Reporte_Proyecto_FK FOREIGN KEY (Proyecto_id) REFERENCES proyecto_magin.Proyecto(id),
	CONSTRAINT Reporte_Usuario_proyecto_FK FOREIGN KEY (Usuario_proyecto_id) REFERENCES proyecto_magin.Usuario_proyecto(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Ticket_proyecto (
	id INT UNSIGNED auto_increment NOT NULL,
	proyecto_id INT UNSIGNED NULL,
	Tarea_id INT UNSIGNED NULL,
	CONSTRAINT Ticket_proyecto_PK PRIMARY KEY (id),
	CONSTRAINT Ticket_proyecto_Proyecto_FK FOREIGN KEY (proyecto_id) REFERENCES proyecto_magin.Proyecto(id),
	CONSTRAINT Ticket_proyecto_Tarea_FK FOREIGN KEY (Tarea_id) REFERENCES proyecto_magin.Tarea(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.Ticket_soporte (
	id INT UNSIGNED auto_increment NOT NULL,
	Usuario_cliente_id INT UNSIGNED NULL,
	Notificacion_id INT UNSIGNED NULL,
	CONSTRAINT Ticket_soporte_PK PRIMARY KEY (id),
	CONSTRAINT Ticket_soporte_Usuario_cliente_FK FOREIGN KEY (Usuario_cliente_id) REFERENCES proyecto_magin.Usuario_cliente(id),
	CONSTRAINT Ticket_soporte_Notificacion_FK FOREIGN KEY (Notificacion_id) REFERENCES proyecto_magin.Notificacion(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.tiempo_actividad (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre varchar(50) NULL,
	CONSTRAINT tiempo_actividad_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.tiempo_proyecto (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre varchar(50) NULL,
	CONSTRAINT tiempo_proyecto_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.tiempo_trabajo (
	id INT UNSIGNED auto_increment NOT NULL,
	nombre varchar(50) NULL,
	CONSTRAINT tiempo_trabajo_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.tiempo (
	id INT UNSIGNED auto_increment NOT NULL,
	usuario_proyecto_id INT UNSIGNED NULL,
	ticket_proyecto_id INT UNSIGNED NULL,
	tiempo_proyecto_id INT UNSIGNED NULL,
	tiempo_actividad_id INT UNSIGNED NULL,
	tiempo_trabajo_id INT UNSIGNED NULL,
	fecha_inicio DATETIME NULL,
	fecha_final DATETIME NULL,
	CONSTRAINT tiempo_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
