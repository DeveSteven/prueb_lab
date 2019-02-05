/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.29-MariaDB : Database - prueba_lab
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prueba_lab` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;

USE `prueba_lab`;

/*Table structure for table `comandos` */

DROP TABLE IF EXISTS `comandos`;

CREATE TABLE `comandos` (
  `id_comando` int(11) NOT NULL AUTO_INCREMENT,
  `comandnomb` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id_comando`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `comandos` */

LOCK TABLES `comandos` WRITE;

insert  into `comandos`(`id_comando`,`comandnomb`) values (2,'CmdLogin'),(3,'CmdAddEstudiantes'),(4,'CmdLogOut'),(5,'CmdDefaultElectivasElegidas'),(6,'CmdDefaultElectivasActivas'),(7,'CmdSeleccionElectiva'),(8,'CmdDefaultElectivasxProfesor'),(9,'defaul');

UNLOCK TABLES;

/*Table structure for table `electivas` */

DROP TABLE IF EXISTS `electivas`;

CREATE TABLE `electivas` (
  `id_elec` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_elec` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `num_cupos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_elec`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `electivas` */

LOCK TABLES `electivas` WRITE;

insert  into `electivas`(`id_elec`,`nombre_elec`,`descripcion`,`num_cupos`) values (2,'Calculo','programa de calculo 1 para universitarios ',30),(3,'POO','PROGRMACION ORIENTASDO OBJETOS',14),(4,'Base Datos','orintacion a las base de datos',23);

UNLOCK TABLES;

/*Table structure for table `electivasxprofesor` */

DROP TABLE IF EXISTS `electivasxprofesor`;

CREATE TABLE `electivasxprofesor` (
  `id_elec_pro` int(11) NOT NULL AUTO_INCREMENT,
  `id_profe_fk` int(11) DEFAULT NULL,
  `id_elec_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_elec_pro`),
  KEY `fk_elec_pro` (`id_elec_fk`),
  KEY `fk_pro_elec` (`id_profe_fk`),
  CONSTRAINT `fk_elec_pro` FOREIGN KEY (`id_elec_fk`) REFERENCES `electivas` (`id_elec`),
  CONSTRAINT `fk_pro_elec` FOREIGN KEY (`id_profe_fk`) REFERENCES `profesores` (`id_pro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `electivasxprofesor` */

LOCK TABLES `electivasxprofesor` WRITE;

insert  into `electivasxprofesor`(`id_elec_pro`,`id_profe_fk`,`id_elec_fk`) values (1,1,3),(2,3,4),(3,2,2),(4,1,2),(7,4,4);

UNLOCK TABLES;

/*Table structure for table `intercomad` */

DROP TABLE IF EXISTS `intercomad`;

CREATE TABLE `intercomad` (
  `id_intercoman` int(11) NOT NULL AUTO_INCREMENT,
  `id_comand` int(11) DEFAULT NULL,
  `id_interfa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_intercoman`),
  KEY `fk_intercoman_comand` (`id_comand`),
  KEY `fk_intercomand_inter` (`id_interfa`),
  CONSTRAINT `fk_intercoman_comand` FOREIGN KEY (`id_comand`) REFERENCES `comandos` (`id_comando`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_intercomand_inter` FOREIGN KEY (`id_interfa`) REFERENCES `interfaces` (`id_interfaces`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `intercomad` */

LOCK TABLES `intercomad` WRITE;

insert  into `intercomad`(`id_intercoman`,`id_comand`,`id_interfa`) values (1,9,1),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,6,3),(7,7,3),(8,8,4);

UNLOCK TABLES;

/*Table structure for table `interfaces` */

DROP TABLE IF EXISTS `interfaces`;

CREATE TABLE `interfaces` (
  `id_interfaces` int(11) NOT NULL AUTO_INCREMENT,
  `internomb` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id_interfaces`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `interfaces` */

LOCK TABLES `interfaces` WRITE;

insert  into `interfaces`(`id_interfaces`,`internomb`) values (1,'Form_Login.tpl'),(2,'Form_Empleados.html'),(3,'Form_Electivas.tpl'),(4,'Form_ElectivasxProfesor.tpl');

UNLOCK TABLES;

/*Table structure for table `profesores` */

DROP TABLE IF EXISTS `profesores`;

CREATE TABLE `profesores` (
  `id_pro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pro` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id_pro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `profesores` */

LOCK TABLES `profesores` WRITE;

insert  into `profesores`(`id_pro`,`nombre_pro`) values (1,'alverto zuluaga'),(2,'mario perez'),(3,'maria alvares'),(4,'Ronald OcampO');

UNLOCK TABLES;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `descripcion_rol` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `roles` */

LOCK TABLES `roles` WRITE;

insert  into `roles`(`id_roles`,`descripcion_rol`) values (1,'Estudiante'),(2,'Administrador');

UNLOCK TABLES;

/*Table structure for table `rolinter` */

DROP TABLE IF EXISTS `rolinter`;

CREATE TABLE `rolinter` (
  `id_rolinte` int(11) NOT NULL AUTO_INCREMENT,
  `id_rolinten_rol` int(11) DEFAULT NULL,
  `id_rolinten_intercomand` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rolinte`),
  KEY `fk_rolinter_rol` (`id_rolinten_rol`),
  KEY `fk_rolinter_intercomand` (`id_rolinten_intercomand`),
  CONSTRAINT `fk_rolinter_intercomand` FOREIGN KEY (`id_rolinten_intercomand`) REFERENCES `intercomad` (`id_intercoman`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rolinter_rol` FOREIGN KEY (`id_rolinten_rol`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `rolinter` */

LOCK TABLES `rolinter` WRITE;

insert  into `rolinter`(`id_rolinte`,`id_rolinten_rol`,`id_rolinten_intercomand`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,2,1);

UNLOCK TABLES;

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `correo_usua` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contra_usua` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cod_estu` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tipo_rol_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_rol_usua` (`tipo_rol_fk`),
  CONSTRAINT `fk_rol_usua` FOREIGN KEY (`tipo_rol_fk`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `usuarios` */

LOCK TABLES `usuarios` WRITE;

insert  into `usuarios`(`id_usuario`,`correo_usua`,`contra_usua`,`cod_estu`,`tipo_rol_fk`) values (1,'admin@gmail.com','123','00000',2),(2,'estu@gmial.com','123','N34766',1),(3,'estudiante@gmail.com','1234','re456',1);

UNLOCK TABLES;

/*Table structure for table `usuariosxelectivas` */

DROP TABLE IF EXISTS `usuariosxelectivas`;

CREATE TABLE `usuariosxelectivas` (
  `id_usuelec` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_fk` int(11) DEFAULT NULL,
  `id_electiva` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuelec`),
  KEY `fk_usurios_ele` (`id_usuario_fk`),
  KEY `fk_elec_usua` (`id_electiva`),
  CONSTRAINT `fk_elec_usua` FOREIGN KEY (`id_electiva`) REFERENCES `electivas` (`id_elec`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usurios_ele` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `usuariosxelectivas` */

LOCK TABLES `usuariosxelectivas` WRITE;

insert  into `usuariosxelectivas`(`id_usuelec`,`id_usuario_fk`,`id_electiva`) values (9,2,3),(10,2,4),(11,2,2),(18,3,4);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
