CREATE DATABASE siu;
USE siu;

-- -----------------------------------------------------
-- Table `educativo`.`Pensum`
-- -----------------------------------------------------
CREATE TABLE pensum
 (
  PK_codigo_pensum VARCHAR(5),
  nombre_pensum VARCHAR(45),
  fecha_inicio DATE,
  fecha_fin DATE DEFAULT NULL,
  max_cursos int(1) NOT NULL,
  estatus_alumno TINYINT(1),
  PRIMARY KEY (PK_codigo_pensum)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE alumnos
 (
  PK_carnet_alumno VARCHAR(15),
  nombre_alumno VARCHAR(45),
  direccion_alumno VARCHAR(45),
  telefono_alumno VARCHAR(45),
  email_alumno VARCHAR(20),
  estatus_alumno TINYINT(1),
  PRIMARY KEY (PK_carnet_alumno)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Maestros`
-- -----------------------------------------------------
CREATE TABLE maestros
(
  PK_codigo_maestro VARCHAR(5),
  nombre_maestro VARCHAR(45),
  direccion_maestro VARCHAR(45),
  telefono_maetro VARCHAR(45),
  email_maestro VARCHAR(20),
  estatus_maestro TINYINT(1),
  PRIMARY KEY (PK_codigo_maestro)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Plataforma Alumno`
-- -----------------------------------------------------
CREATE TABLE RegistroPlataformaAlumno
 (
  Pk_token_alumno INT(15) AUTO_INCREMENT,
  PK_carnet_alumno VARCHAR(5) NOT NULL,
  email_alumno  VARCHAR(25) NOT NULL,
  PASSWORD VARCHAR(80) NOT NULL,
  PRIMARY KEY (Pk_token_alumno, PK_carnet_alumno),
  FOREIGN KEY (PK_carnet_alumno) REFERENCES alumnos(PK_carnet_alumno)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Plataforma Maestro`
-- -----------------------------------------------------
CREATE TABLE RegistroPlataformaMaestro
 (
  Pk_token_maestro  INT(15) AUTO_INCREMENT,
  PK_codigo_maestro VARCHAR(5) NOT NULL,
  email_maestro VARCHAR(25) NOT NULL,
  PASSWORD VARCHAR(80) NOT NULL,
  PRIMARY KEY (Pk_token_maestro, PK_codigo_maestro),
  FOREIGN KEY (PK_codigo_maestro) REFERENCES maestros(PK_codigo_maestro)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Bancos`
-- -----------------------------------------------------
CREATE TABLE bancos
(
  PK_codigo_banco VARCHAR(5),
  nombre_banco VARCHAR(50),
  estatus_bancos TINYINT(1),
  PRIMARY KEY (PK_codigo_banco)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE funcionarios
(
  PK_codigo_funcionario VARCHAR(5),
  nombre_funcionario VARCHAR(45),
  direccion_funcionario VARCHAR(45),
  telefono_funcionario VARCHAR(45),
  email_funcionario VARCHAR(20),
  estatus_funcionario TINYINT(1),
  PRIMARY KEY (PK_codigo_funcionario)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1;

 -- -----------------------------------------------------
-- Table `educativo`.`Transacciones`
-- -----------------------------------------------------
CREATE TABLE transacciones
(
  PK_codigo_transacciones VARCHAR(5),
  nombre_transacciones VARCHAR(45),
  cantidad_transacciones VARCHAR(10),
  cantidad_descuento VARCHAR(10) DEFAULT NULL,
  cantidad_bono VARCHAR(10) DEFAULT NULL,
  codigo_banco VARCHAR(5),
  estatus_transaccion TINYINT(1),
  PRIMARY KEY (PK_codigo_transacciones, codigo_banco),
  FOREIGN KEY (codigo_banco) REFERENCES bancos(PK_codigo_banco)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

  
-- -----------------------------------------------------
-- Table `educativo`.`Facultades`
-- -----------------------------------------------------
CREATE TABLE facultades
(
  PK_codigo_facultad VARCHAR(5),
  nombre_facultad VARCHAR(45),
  PK_codigo_funcionario VARCHAR(45),
  estatus_facultad TINYINT(1),
  PRIMARY KEY (PK_codigo_facultad),
  FOREIGN KEY (PK_codigo_funcionario) REFERENCES funcionarios(PK_codigo_funcionario)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Carreras`
-- -----------------------------------------------------
CREATE TABLE carreras
(
  PK_codigo_carrera VARCHAR(5),
  nombre_carrera VARCHAR(45),
  codigo_facultad VARCHAR(5),
  estatus_carrera TINYINT(1),
  PRIMARY KEY (PK_codigo_carrera, codigo_facultad),
  FOREIGN KEY (codigo_facultad) REFERENCES facultades(PK_codigo_facultad)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE cursos
(
  PK_codigo_curso VARCHAR(5),
  nombre_curso VARCHAR(45),
  creditos_curso VARCHAR(45),
  estatus_curso TINYINT(1),
  PRIMARY KEY (PK_codigo_curso)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`plan de cursos`
-- -----------------------------------------------------
CREATE TABLE plancursos
(
  PK_codigo_curso VARCHAR(5),
  prerequisito_curso VARCHAR(5),
  prerequisito_creditos VARCHAR(5),
  codigo_pensum VARCHAR(5),
  estatus_plancurso TINYINT(1),
  FOREIGN KEY (PK_codigo_curso) REFERENCES cursos(PK_codigo_curso),
  FOREIGN KEY (codigo_pensum) REFERENCES pensum(PK_codigo_pensum),
  PRIMARY KEY (PK_codigo_curso, codigo_pensum)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Secciones`
-- -----------------------------------------------------
CREATE TABLE secciones
(
  PK_codigo_seccion VARCHAR(5),
  nombre_seccion VARCHAR(45),
  estatus_seccion TINYINT(1),
  PRIMARY KEY (PK_codigo_seccion)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
 
 -- -----------------------------------------------------
-- Table `educativo`.`Sedes`
-- -----------------------------------------------------
CREATE TABLE sedes
(
  PK_codigo_sede VARCHAR(5),
  nombre_sede VARCHAR(45),
  PK_codigo_funcionario VARCHAR(45),
  correo_sede VARCHAR(45),
  direccion_sede VARCHAR(45),
  horario_sede VARCHAR(45),
  estatus_sede TINYINT(1),
  PRIMARY KEY (PK_codigo_sede, PK_codigo_funcionario),
  FOREIGN KEY (PK_codigo_funcionario) REFERENCES funcionarios(PK_codigo_funcionario)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Aulas`
-- -----------------------------------------------------
CREATE TABLE aulas
(
  PK_codigo_aula VARCHAR(5),
  numero_aula VARCHAR(45),
  nombre_aula VARCHAR(45),
  estatus_aula TINYINT(1),
  PRIMARY KEY (PK_codigo_aula)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Jornadas`
-- -----------------------------------------------------
CREATE TABLE jornadas
(
  PK_codigo_jornada VARCHAR(5),
  PK_codigo_funcionario VARCHAR(45),
  nombre_jornada VARCHAR(45),
  entrada_jornada TIME(6),
  salida_jornada TIME(6),
  estatus_jornada TINYINT(1),
  PRIMARY KEY (PK_codigo_jornada, PK_codigo_funcionario),
  FOREIGN KEY (PK_codigo_funcionario) REFERENCES funcionarios(PK_codigo_funcionario)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

--------------------------------------------------
-- Table `educativo`.`asignacion cursos a alumno`
-- -----------------------------------------------------
CREATE TABLE asignacioncursosalumnos
(
  PK_codigo_carrera VARCHAR(5),
  PK_codigo_sede VARCHAR(5),
  PK_codigo_jornada VARCHAR(5),
  PK_codigo_seccion VARCHAR(5),
  PK_codigo_aula VARCHAR(5),
  PK_codigo_curso VARCHAR(5),
  PK_carnet_alumno VARCHAR(15),
  PK_nota_asignacioncursoalumnos FLOAT(10,2), 
  PRIMARY KEY (PK_codigo_carrera, PK_codigo_sede, PK_codigo_jornada, PK_codigo_seccion, PK_codigo_aula, PK_codigo_curso, PK_carnet_alumno),
  FOREIGN KEY (PK_codigo_carrera) REFERENCES carreras(PK_codigo_carrera),
  FOREIGN KEY (PK_codigo_sede) REFERENCES sedes(PK_codigo_sede),
  FOREIGN KEY (PK_codigo_jornada) REFERENCES jornadas(PK_codigo_jornada),
  FOREIGN KEY (PK_codigo_seccion) REFERENCES secciones(PK_codigo_seccion),
  FOREIGN KEY (PK_codigo_aula) REFERENCES aulas(PK_codigo_aula),
  FOREIGN KEY (PK_codigo_curso) REFERENCES cursos(PK_codigo_curso),
  FOREIGN KEY (PK_carnet_alumno) REFERENCES alumnos(PK_carnet_alumno)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`pago de alumno`
-- -----------------------------------------------------
CREATE TABLE pago_de_alumnos
(
  PK_codigo_pago VARCHAR(5),
  PK_carnet_alumno VARCHAR(45),
  PK_codigo_transacciones VARCHAR(5),
  PK_codigo_banco VARCHAR(5),
  fecha_pago DATE,
  PRIMARY KEY (PK_codigo_pago, PK_carnet_alumno, PK_codigo_transacciones, PK_codigo_banco),
  FOREIGN KEY (PK_carnet_alumno) REFERENCES alumnos(PK_carnet_alumno),
  FOREIGN KEY (PK_codigo_transacciones) REFERENCES transacciones(PK_codigo_transacciones),
  FOREIGN KEY (PK_codigo_banco) REFERENCES bancos(PK_codigo_banco)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Pagos a maestros`
-- -----------------------------------------------------
CREATE TABLE pago_a_maestros
(
  PK_codigo_pago VARCHAR(5),
  codigo_maestro VARCHAR(5),
  sueldo_maestro float(5,2),
  FOREIGN KEY (codigo_maestro) REFERENCES maestros(PK_codigo_maestro),
  PRIMARY KEY (PK_codigo_pago, codigo_maestro)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`notas`
-- -----------------------------------------------------
CREATE TABLE notas
(
  PK_codigo_nota VARCHAR(5),
  carnet_alumno VARCHAR(5) DEFAULT NULL,
  codigo_maestro VARCHAR(5) DEFAULT NULL,
  primerParcial_nota float(3,2) DEFAULT NULL,
  extraordinarioPrimerParcial_nota float(3,2) DEFAULT NULL,
  segundoParcial_nota float(3,2) DEFAULT NULL,
  extraordinarioSegundoParcial_nota float(3,2) DEFAULT NULL,
  parcialFinal_nota float(3,2) DEFAULT NULL,
  extraordinarioParcialFinal_nota float(3,2) DEFAULT NULL,
  actividades_nota float(2,2) DEFAULT NULL,
  nota_neta float(3,2) DEFAULT NULL,
  estatus_nota TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (PK_codigo_nota),
  FOREIGN KEY (carnet_alumno) REFERENCES alumnos(PK_carnet_alumno),
  FOREIGN KEY (codigo_maestro) REFERENCES maestros(PK_codigo_maestro)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
  
-- -----------------------------------------------------
-- Table `educativo`.`Asignacion_cursos_maestros`
-- -----------------------------------------------------
CREATE TABLE asignacioncursosmaestros
(
  PK_codigo_carrera VARCHAR(5),
  PK_codigo_sede VARCHAR(5),
  PK_codigo_jornada VARCHAR(5),
  PK_codigo_seccion VARCHAR(5),
  PK_codigo_aula VARCHAR(5),
  PK_codigo_curso VARCHAR(5),
  PK_codigo_maestro VARCHAR(5),
  PRIMARY KEY (PK_codigo_carrera, PK_codigo_sede, PK_codigo_jornada, PK_codigo_seccion, PK_codigo_aula, PK_codigo_curso, PK_codigo_maestro),
  FOREIGN KEY (PK_codigo_carrera) REFERENCES carreras(PK_codigo_carrera),
  FOREIGN KEY (PK_codigo_sede) REFERENCES sedes(PK_codigo_sede),
  FOREIGN KEY (PK_codigo_jornada) REFERENCES jornadas(PK_codigo_jornada),
  FOREIGN KEY (PK_codigo_seccion) REFERENCES secciones(PK_codigo_seccion),
  FOREIGN KEY (PK_codigo_aula) REFERENCES aulas(PK_codigo_aula),
  FOREIGN KEY (PK_codigo_curso) REFERENCES cursos(PK_codigo_curso),
  FOREIGN KEY (PK_codigo_maestro) REFERENCES maestros(PK_codigo_maestro)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

