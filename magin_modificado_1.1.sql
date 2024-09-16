/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: proyecto_magin
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) DEFAULT NULL,
  `Funciones` varchar(255) DEFAULT NULL,
  `Fecha_ingreso` datetime DEFAULT NULL,
  `Fecha_retiro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_documento_id` int(10) unsigned DEFAULT NULL,
  `numero_identificaciom` varchar(80) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Region_id` int(10) unsigned DEFAULT NULL,
  `Fijo` varchar(50) DEFAULT NULL,
  `Celular` varchar(50) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cliente_Region_FK` (`Region_id`),
  KEY `cliente_tipo_documento_FK` (`tipo_documento_id`),
  CONSTRAINT `Cliente_Region_FK` FOREIGN KEY (`Region_id`) REFERENCES `region` (`id`),
  CONSTRAINT `cliente_tipo_documento_FK` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Pais_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Departamento_Pais_FK` (`Pais_id`),
  CONSTRAINT `Departamento_Pais_FK` FOREIGN KEY (`Pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_federado`
--

DROP TABLE IF EXISTS `estado_federado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_federado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Pais_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Estado_federado_Pais_FK` (`Pais_id`),
  CONSTRAINT `Estado_federado_Pais_FK` FOREIGN KEY (`Pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_federado`
--

LOCK TABLES `estado_federado` WRITE;
/*!40000 ALTER TABLE `estado_federado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_federado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_usuario`
--

LOCK TABLES `estado_usuario` WRITE;
/*!40000 ALTER TABLE `estado_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo_notificacion_cliente_id` int(10) unsigned DEFAULT NULL,
  `Estado_id` int(10) unsigned DEFAULT NULL,
  `Prioridad_id` int(10) unsigned DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Notificacion_Tipo_notificacion_cliente_FK` (`Tipo_notificacion_cliente_id`),
  KEY `Notificacion_Estado_FK` (`Estado_id`),
  KEY `Notificacion_Prioridad_FK` (`Prioridad_id`),
  CONSTRAINT `Notificacion_Estado_FK` FOREIGN KEY (`Estado_id`) REFERENCES `estado` (`id`),
  CONSTRAINT `Notificacion_Prioridad_FK` FOREIGN KEY (`Prioridad_id`) REFERENCES `prioridad` (`id`),
  CONSTRAINT `Notificacion_Tipo_notificacion_cliente_FK` FOREIGN KEY (`Tipo_notificacion_cliente_id`) REFERENCES `tipo_notificacion_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Indicativo` varchar(10) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridad`
--

DROP TABLE IF EXISTS `prioridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prioridad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridad`
--

LOCK TABLES `prioridad` WRITE;
/*!40000 ALTER TABLE `prioridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `prioridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Pais_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Provincia_Pais_FK` (`Pais_id`),
  CONSTRAINT `Provincia_Pais_FK` FOREIGN KEY (`Pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `requerimientos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Usuario_proyecto_id` int(10) unsigned DEFAULT NULL,
  `Estado_id` int(10) unsigned DEFAULT NULL,
  `Prioridad_id` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_finalizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Proyecto_Usuario_proyecto_FK` (`Usuario_proyecto_id`),
  KEY `Proyecto_Estado_FK` (`Estado_id`),
  KEY `Proyecto_Prioridad_FK` (`Prioridad_id`),
  CONSTRAINT `Proyecto_Estado_FK` FOREIGN KEY (`Estado_id`) REFERENCES `estado` (`id`),
  CONSTRAINT `Proyecto_Prioridad_FK` FOREIGN KEY (`Prioridad_id`) REFERENCES `prioridad` (`id`),
  CONSTRAINT `Proyecto_Usuario_proyecto_FK` FOREIGN KEY (`Usuario_proyecto_id`) REFERENCES `usuario_proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Pais_id` int(10) unsigned DEFAULT NULL,
  `Departamento_id` int(10) unsigned DEFAULT NULL,
  `Provincia_id` int(10) unsigned DEFAULT NULL,
  `Estado_federado_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Region_Pais_FK` (`Pais_id`),
  KEY `Region_Departamento_FK` (`Departamento_id`),
  KEY `Region_Provincia_FK` (`Provincia_id`),
  KEY `Region_Estado_federado_FK` (`Estado_federado_id`),
  CONSTRAINT `Region_Departamento_FK` FOREIGN KEY (`Departamento_id`) REFERENCES `departamento` (`id`),
  CONSTRAINT `Region_Estado_federado_FK` FOREIGN KEY (`Estado_federado_id`) REFERENCES `estado_federado` (`id`),
  CONSTRAINT `Region_Pais_FK` FOREIGN KEY (`Pais_id`) REFERENCES `pais` (`id`),
  CONSTRAINT `Region_Provincia_FK` FOREIGN KEY (`Provincia_id`) REFERENCES `provincia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo_reporte_id` int(10) unsigned DEFAULT NULL,
  `Proyecto_id` int(10) unsigned DEFAULT NULL,
  `Usuario_proyecto_id` int(10) unsigned DEFAULT NULL,
  `Plan_accion` varchar(255) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Reporte_Tipo_reporte_FK` (`Tipo_reporte_id`),
  KEY `Reporte_Proyecto_FK` (`Proyecto_id`),
  KEY `Reporte_Usuario_proyecto_FK` (`Usuario_proyecto_id`),
  CONSTRAINT `Reporte_Proyecto_FK` FOREIGN KEY (`Proyecto_id`) REFERENCES `proyecto` (`id`),
  CONSTRAINT `Reporte_Tipo_reporte_FK` FOREIGN KEY (`Tipo_reporte_id`) REFERENCES `tipo_reporte` (`id`),
  CONSTRAINT `Reporte_Usuario_proyecto_FK` FOREIGN KEY (`Usuario_proyecto_id`) REFERENCES `usuario_proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) DEFAULT NULL,
  `Proyecto_id` int(10) unsigned DEFAULT NULL,
  `Usuario_cliente_id` int(10) unsigned DEFAULT NULL,
  `Prioridad_id` int(10) unsigned DEFAULT NULL,
  `Estado_id` int(10) unsigned DEFAULT NULL,
  `Proceso_id` int(10) unsigned DEFAULT NULL,
  `Comentario` varchar(255) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Fecha_limite` datetime DEFAULT NULL,
  `Fecha_finalizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Tarea_Proyecto_FK` (`Proyecto_id`),
  KEY `Tarea_Usuario_cliente_FK` (`Usuario_cliente_id`),
  KEY `Tarea_Prioridad_FK` (`Prioridad_id`),
  KEY `Tarea_Estado_FK` (`Estado_id`),
  KEY `Tarea_Proceso_FK` (`Proceso_id`),
  CONSTRAINT `Tarea_Estado_FK` FOREIGN KEY (`Estado_id`) REFERENCES `estado` (`id`),
  CONSTRAINT `Tarea_Prioridad_FK` FOREIGN KEY (`Prioridad_id`) REFERENCES `prioridad` (`id`),
  CONSTRAINT `Tarea_Proceso_FK` FOREIGN KEY (`Proceso_id`) REFERENCES `proceso` (`id`),
  CONSTRAINT `Tarea_Proyecto_FK` FOREIGN KEY (`Proyecto_id`) REFERENCES `proyecto` (`id`),
  CONSTRAINT `Tarea_Usuario_cliente_FK` FOREIGN KEY (`Usuario_cliente_id`) REFERENCES `usuario_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_proyecto`
--

DROP TABLE IF EXISTS `ticket_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_proyecto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(10) unsigned DEFAULT NULL,
  `Tarea_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ticket_proyecto_Proyecto_FK` (`proyecto_id`),
  KEY `Ticket_proyecto_Tarea_FK` (`Tarea_id`),
  CONSTRAINT `Ticket_proyecto_Proyecto_FK` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`),
  CONSTRAINT `Ticket_proyecto_Tarea_FK` FOREIGN KEY (`Tarea_id`) REFERENCES `tarea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_proyecto`
--

LOCK TABLES `ticket_proyecto` WRITE;
/*!40000 ALTER TABLE `ticket_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_soporte`
--

DROP TABLE IF EXISTS `ticket_soporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_soporte` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Usuario_cliente_id` int(10) unsigned DEFAULT NULL,
  `Notificacion_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ticket_soporte_Usuario_cliente_FK` (`Usuario_cliente_id`),
  KEY `Ticket_soporte_Notificacion_FK` (`Notificacion_id`),
  CONSTRAINT `Ticket_soporte_Notificacion_FK` FOREIGN KEY (`Notificacion_id`) REFERENCES `notificacion` (`id`),
  CONSTRAINT `Ticket_soporte_Usuario_cliente_FK` FOREIGN KEY (`Usuario_cliente_id`) REFERENCES `usuario_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_soporte`
--

LOCK TABLES `ticket_soporte` WRITE;
/*!40000 ALTER TABLE `ticket_soporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_soporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiempo`
--

DROP TABLE IF EXISTS `tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiempo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_proyecto_id` int(10) unsigned DEFAULT NULL,
  `ticket_proyecto_id` int(10) unsigned DEFAULT NULL,
  `tiempo_proyecto_id` int(10) unsigned DEFAULT NULL,
  `tiempo_actividad_id` int(10) unsigned DEFAULT NULL,
  `tiempo_trabajo_id` int(10) unsigned DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tiempo_usuario_proyecto_FK` (`usuario_proyecto_id`),
  KEY `tiempo_ticket_proyecto_FK` (`ticket_proyecto_id`),
  KEY `tiempo_tiempo_proyecto_FK` (`tiempo_proyecto_id`),
  KEY `tiempo_tiempo_actividad_FK` (`tiempo_actividad_id`),
  KEY `tiempo_tiempo_trabajo_FK` (`tiempo_trabajo_id`),
  CONSTRAINT `tiempo_ticket_proyecto_FK` FOREIGN KEY (`ticket_proyecto_id`) REFERENCES `ticket_proyecto` (`id`),
  CONSTRAINT `tiempo_tiempo_actividad_FK` FOREIGN KEY (`tiempo_actividad_id`) REFERENCES `tiempo_actividad` (`id`),
  CONSTRAINT `tiempo_tiempo_proyecto_FK` FOREIGN KEY (`tiempo_proyecto_id`) REFERENCES `tiempo_proyecto` (`id`),
  CONSTRAINT `tiempo_tiempo_trabajo_FK` FOREIGN KEY (`tiempo_trabajo_id`) REFERENCES `tiempo_trabajo` (`id`),
  CONSTRAINT `tiempo_usuario_proyecto_FK` FOREIGN KEY (`usuario_proyecto_id`) REFERENCES `usuario_proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiempo`
--

LOCK TABLES `tiempo` WRITE;
/*!40000 ALTER TABLE `tiempo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiempo_actividad`
--

DROP TABLE IF EXISTS `tiempo_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiempo_actividad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiempo_actividad`
--

LOCK TABLES `tiempo_actividad` WRITE;
/*!40000 ALTER TABLE `tiempo_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiempo_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiempo_proyecto`
--

DROP TABLE IF EXISTS `tiempo_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiempo_proyecto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiempo_proyecto`
--

LOCK TABLES `tiempo_proyecto` WRITE;
/*!40000 ALTER TABLE `tiempo_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiempo_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiempo_trabajo`
--

DROP TABLE IF EXISTS `tiempo_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiempo_trabajo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiempo_trabajo`
--

LOCK TABLES `tiempo_trabajo` WRITE;
/*!40000 ALTER TABLE `tiempo_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiempo_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Abreviatura` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_notificacion_cliente`
--

DROP TABLE IF EXISTS `tipo_notificacion_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_notificacion_cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_notificacion_cliente`
--

LOCK TABLES `tipo_notificacion_cliente` WRITE;
/*!40000 ALTER TABLE `tipo_notificacion_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_notificacion_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_reporte`
--

DROP TABLE IF EXISTS `tipo_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_reporte` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_reporte`
--

LOCK TABLES `tipo_reporte` WRITE;
/*!40000 ALTER TABLE `tipo_reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_cliente`
--

DROP TABLE IF EXISTS `usuario_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Cliente_id` int(10) unsigned DEFAULT NULL,
  `Usuario_proyecto_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Usuario_cliente_Cliente_FK` (`Cliente_id`),
  KEY `Usuario_cliente_Usuario_proyecto_FK` (`Usuario_proyecto_id`),
  CONSTRAINT `Usuario_cliente_Cliente_FK` FOREIGN KEY (`Cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `Usuario_cliente_Usuario_proyecto_FK` FOREIGN KEY (`Usuario_proyecto_id`) REFERENCES `usuario_proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cliente`
--

LOCK TABLES `usuario_cliente` WRITE;
/*!40000 ALTER TABLE `usuario_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_proyecto`
--

DROP TABLE IF EXISTS `usuario_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_proyecto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo_documento_id` int(10) unsigned DEFAULT NULL,
  `Tipo_usuario_id` int(10) unsigned DEFAULT NULL,
  `Estado_usuario_id` int(10) unsigned DEFAULT NULL,
  `numero_identificacion` varchar(100) DEFAULT NULL,
  `primer _nombre` varchar(100) DEFAULT NULL,
  `segundo_nombre` varchar(100) DEFAULT NULL,
  `primer_apellido` varchar(100) DEFAULT NULL,
  `segundo_apellido` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `cargo_id` int(10) unsigned DEFAULT NULL,
  `rol_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_proyecto_unique_celular` (`celular`),
  UNIQUE KEY `usuario_proyecto_unique_correo` (`correo`),
  KEY `Usuario_proyecto_Tipo_documento_FK` (`Tipo_documento_id`),
  KEY `Usuario_proyecto_Tipo_usuario_FK` (`Tipo_usuario_id`),
  KEY `usuario_proyecto_region_FK` (`region_id`),
  KEY `usuario_proyecto_cargo_FK` (`cargo_id`),
  KEY `usuario_proyecto_rol_FK` (`rol_id`),
  KEY `usuario_proyecto_estado_usuario_FK` (`Estado_usuario_id`),
  CONSTRAINT `Usuario_proyecto_Tipo_documento_FK` FOREIGN KEY (`Tipo_documento_id`) REFERENCES `tipo_documento` (`id`),
  CONSTRAINT `Usuario_proyecto_Tipo_usuario_FK` FOREIGN KEY (`Tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`),
  CONSTRAINT `usuario_proyecto_cargo_FK` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`),
  CONSTRAINT `usuario_proyecto_estado_usuario_FK` FOREIGN KEY (`Estado_usuario_id`) REFERENCES `estado_usuario` (`id`),
  CONSTRAINT `usuario_proyecto_region_FK` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  CONSTRAINT `usuario_proyecto_rol_FK` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_proyecto`
--

LOCK TABLES `usuario_proyecto` WRITE;
/*!40000 ALTER TABLE `usuario_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_proyecto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-15 23:23:09
