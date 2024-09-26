CREATE TABLE proyecto_magin.tipo_documento (
	id INT auto_increment NOT NULL,
	nombre varchar(50) NULL,
	abreviatura varchar(5) NULL,
	CONSTRAINT tipo_documento_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.pais (
	id INT auto_increment NOT NULL,
	indicativo varchar(10) NULL,
	nombre varchar(100) NULL,
	CONSTRAINT pais_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.estado (
	id INT auto_increment NOT NULL,
	nombre varchar(80) NULL,
	CONSTRAINT estado_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.estado_usuario (
	id INT auto_increment NOT NULL,
	nombre varchar(20) NULL,
	CONSTRAINT estado_usuario_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.tipo_usuario (
	id INT auto_increment NOT NULL,
	nombre varchar(20) NULL,
	CONSTRAINT tipo_usuario_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.prioridad (
	id INT auto_increment NOT NULL,
	nombre varchar(20) NULL,
	CONSTRAINT prioridad_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.rol (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NULL,
	CONSTRAINT rol_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.tipo_notificacion (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NULL,
	CONSTRAINT tipo_notificacion_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.fase (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NULL,
	CONSTRAINT fase_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.cargo (
	id INT auto_increment NOT NULL,
	nombre TEXT NULL,
	funciones TEXT NULL,
	CONSTRAINT cargo_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.tipo_contrato (
	id INT auto_increment NOT NULL,
	nombre varchar(50) NULL,
	fecha_inicio DATETIME NULL,
	fecha_final DATETIME NULL,
	CONSTRAINT tipo_contrato_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.ciudad (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NULL,
	pais_id INT NULL,
	CONSTRAINT ciudad_pk PRIMARY KEY (id),
	CONSTRAINT ciudad_pais_FK FOREIGN KEY (pais_id) REFERENCES proyecto_magin.pais(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.usuario (
	id INT auto_increment NOT NULL,
	tipo_documento_id INT NULL,
	numero_identificacion varchar(20) NULL,
	tipo_usuario_id INT NULL,
	primer_nombre varchar(50) NULL,
	segundo_nombre varchar(50) NULL,
	primer_apellido varchar(50) NULL,
	segundo_apellido varchar(50) NULL,
	direccion varchar(100) NULL,
	ciudad_id INT NULL,
	celular varchar(20) NOT NULL,
	correo varchar(80) NOT NULL,
	CONSTRAINT usuario_pk PRIMARY KEY (id),
	CONSTRAINT usuario_unique_celular UNIQUE KEY (celular),
	CONSTRAINT usuario_unique_correo UNIQUE KEY (correo)
	ALTER TABLE proyecto_magin.usuario ADD CONSTRAINT usuario_tipo_documento_FK FOREIGN KEY (tipo_documento_id) REFERENCES proyecto_magin.tipo_documento(id);
	ALTER TABLE proyecto_magin.usuario ADD CONSTRAINT usuario_tipo_usuario_FK FOREIGN KEY (tipo_usuario_id) REFERENCES proyecto_magin.tipo_usuario(id);
	ALTER TABLE proyecto_magin.usuario ADD CONSTRAINT usuario_ciudad_FK FOREIGN KEY (ciudad_id) REFERENCES proyecto_magin.ciudad(id);

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.usuario_cargo (
	id INT auto_increment NOT NULL,
	usuario_id INT NULL,
	cargo_id INT NULL,
	fecha_ingreso DATETIME NULL,
	fecha_retiro DATETIME NULL,
	estado_usuario_id INT NULL,
	CONSTRAINT usuario_cargo_pk PRIMARY KEY (id),
	CONSTRAINT usuario_cargo_usuario_FK FOREIGN KEY (usuario_id) REFERENCES proyecto_magin.usuario(id),
	CONSTRAINT usuario_cargo_cargo_FK FOREIGN KEY (cargo_id) REFERENCES proyecto_magin.cargo(id),
	CONSTRAINT usuario_cargo_estado_usuario_FK FOREIGN KEY (estado_usuario_id) REFERENCES proyecto_magin.estado_usuario(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.cliente (
	id INT auto_increment NOT NULL,
	tipo_documento_id INT NULL,
	tipo_contrato_id INT NULL,
	nombre varchar(100) NULL,
	direccion varchar(80) NULL,
	telefono varchar(30) NULL,
	celular varchar(50) NOT NULL,
	correo varchar(80) NULL,
	ciudad_id INT NULL,
	fecha_registro DATETIME NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (id),
	CONSTRAINT cliente_unique_celular UNIQUE KEY (celular),
	CONSTRAINT cliente_unique_correo UNIQUE KEY (correo),
	CONSTRAINT cliente_tipo_documento_FK FOREIGN KEY (tipo_documento_id) REFERENCES proyecto_magin.tipo_documento(id),
	CONSTRAINT cliente_tipo_contrato_FK FOREIGN KEY (tipo_contrato_id) REFERENCES proyecto_magin.tipo_contrato(id),
	CONSTRAINT cliente_ciudad_FK FOREIGN KEY (ciudad_id) REFERENCES proyecto_magin.ciudad(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.proyecto (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NULL,
	estado_id INT NULL,
	prioridad_id INT NULL,
	fase_id INT NULL,
	fecha_inicio_vigencia DATETIME NULL,
	fecha_final_vigencia DATETIME NULL,
	CONSTRAINT proyecto_pk PRIMARY KEY (id),
	CONSTRAINT proyecto_estado_FK FOREIGN KEY (estado_id) REFERENCES proyecto_magin.estado(id),
	CONSTRAINT proyecto_prioridad_FK FOREIGN KEY (prioridad_id) REFERENCES proyecto_magin.prioridad(id),
	CONSTRAINT proyecto_fase_FK FOREIGN KEY (fase_id) REFERENCES proyecto_magin.fase(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.requerimiento (
	id INT auto_increment NOT NULL,
	nombre TEXT NULL,
	estado_requerimiento_id INT NULL,
	proyecto_id INT NULL,
	CONSTRAINT requerimiento_pk PRIMARY KEY (id),
	CONSTRAINT requerimiento_estado_requerimiento_FK FOREIGN KEY (estado_requerimiento_id) REFERENCES proyecto_magin.estado_requerimiento(id),
	CONSTRAINT requerimiento_proyecto_FK FOREIGN KEY (proyecto_id) REFERENCES proyecto_magin.proyecto(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.tarea (
	id INT auto_increment NOT NULL,
	requerimiento_id INT NULL,
	prioridad_id INT NULL,
	comentario TEXT NULL,
	fecha_estimacion DATETIME NULL,
	fecha_finalizacion DATETIME NULL,
	CONSTRAINT tarea_pk PRIMARY KEY (id),
	CONSTRAINT tarea_requerimiento_FK FOREIGN KEY (requerimiento_id) REFERENCES proyecto_magin.requerimiento(id),
	CONSTRAINT tarea_prioridad_FK FOREIGN KEY (prioridad_id) REFERENCES proyecto_magin.prioridad(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.ticket_tarea (
	id INT auto_increment NOT NULL,
	requerimiento_id INT NULL,
	usuario_id INT NULL,
	tarea_id INT NULL,
	fecha_asignacion DATETIME NULL,
	fecha_finalizacion DATETIME NULL,
	CONSTRAINT ticket_tarea_pk PRIMARY KEY (id),
	CONSTRAINT ticket_tarea_requerimiento_FK FOREIGN KEY (requerimiento_id) REFERENCES proyecto_magin.requerimiento(id),
	CONSTRAINT ticket_tarea_usuario_FK FOREIGN KEY (usuario_id) REFERENCES proyecto_magin.usuario(id),
	CONSTRAINT ticket_tarea_tarea_FK FOREIGN KEY (tarea_id) REFERENCES proyecto_magin.tarea(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.usuario_cliente (
	id INT auto_increment NOT NULL,
	cliente_id INT NULL,
	usuario_id INT NULL,
	CONSTRAINT usuario_cliente_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.ticket_soporte (
	id INT auto_increment NOT NULL,
	usuario_cliente_id INT NULL,
	notificacion_id INT NULL,
	estado_id INT NULL,
	CONSTRAINT ticket_soporte_pk PRIMARY KEY (id),
	CONSTRAINT ticket_soporte_usuario_cliente_FK FOREIGN KEY (usuario_cliente_id) REFERENCES proyecto_magin.usuario_cliente(id),
	CONSTRAINT ticket_soporte_notificacion_FK FOREIGN KEY (notificacion_id) REFERENCES proyecto_magin.notificacion(id),
	CONSTRAINT ticket_soporte_estado_FK FOREIGN KEY (estado_id) REFERENCES proyecto_magin.estado(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.usuario_rol (
	id INT auto_increment NOT NULL,
	rol_id INT NULL,
	usuario_id INT NULL,
	fecha_ingreso DATETIME NULL,
	fecha_retiro DATETIME NULL,
	CONSTRAINT usuario_rol_pk PRIMARY KEY (id),
	CONSTRAINT usuario_rol_rol_FK FOREIGN KEY (rol_id) REFERENCES proyecto_magin.rol(id),
	CONSTRAINT usuario_rol_usuario_FK FOREIGN KEY (usuario_id) REFERENCES proyecto_magin.usuario(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.categoria (
	id INT auto_increment NOT NULL,
	abreviatura varchar(5) NULL,
	nombre varchar(80) NULL,
	descripcion TEXT NULL,
	CONSTRAINT categoria_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.etiqueta (
	id INT auto_increment NOT NULL,
	nombre varchar(80) NULL,
	CONSTRAINT etiqueta_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.ticket_tarea_detalle (
	id INT auto_increment NOT NULL,
	usuario_id_responsable INT NULL,
	valoracion_inicial TEXT NULL,
	categoria_id INT NULL,
	etiqueta_id INT NULL,
	fecha_asignacion DATETIME NULL,
	fecha_devolucion DATETIME NULL,
	CONSTRAINT ticket_tarea_detalle_pk PRIMARY KEY (id),
	CONSTRAINT ticket_tarea_detalle_usuario_FK FOREIGN KEY (usuario_id_responsable) REFERENCES proyecto_magin.usuario(id),
	CONSTRAINT ticket_tarea_detalle_categoria_FK FOREIGN KEY (categoria_id) REFERENCES proyecto_magin.categoria(id),
	CONSTRAINT ticket_tarea_detalle_etiqueta_FK FOREIGN KEY (etiqueta_id) REFERENCES proyecto_magin.etiqueta(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.permiso (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NULL,
	CONSTRAINT permiso_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.item (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NULL,
	CONSTRAINT item_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE proyecto_magin.rol_permiso_item (
	id INT auto_increment NOT NULL,
	rol_id INT NULL,
	permiso_id INT NULL,
	item_id INT NULL,
	CONSTRAINT rol_permiso_item_pk PRIMARY KEY (id),
	CONSTRAINT rol_permiso_item_rol_FK FOREIGN KEY (rol_id) REFERENCES proyecto_magin.rol(id),
	CONSTRAINT rol_permiso_item_permiso_FK FOREIGN KEY (permiso_id) REFERENCES proyecto_magin.permiso(id),
	CONSTRAINT rol_permiso_item_item_FK FOREIGN KEY (item_id) REFERENCES proyecto_magin.item(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
