CREATE DATABASE siu;

USE siu;

-- -----------------------------------------------------
-- Table `educativo`.`Estatus`
-- -----------------------------------------------------
CREATE TABLE estatus (
  PK_codigo_estatus TINYINT(2) NOT NULL,
  nombre_estatus VARCHAR(45) NOT NULL,
  descricion_estatus VARCHAR(100) NOT NULL,
  PRIMARY KEY (PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Pensum`
-- -----------------------------------------------------
CREATE TABLE pensum (
  PK_codigo_pensum VARCHAR(5) NOT NULL,
  nombre_pensum VARCHAR(45) NOT NULL,
  fecha_inicio DATE DEFAULT NULL,
  fecha_fin DATE DEFAULT NULL,
  max_cursos int(1) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_pensum, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE alumnos (
  PK_carnet_alumno VARCHAR(15),
  nombre_alumno VARCHAR(45),
  direccion_alumno VARCHAR(45),
  telefono_alumno INT(8),
  email_alumno VARCHAR(50),
  vencimineto_carnet DATE NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_carnet_alumno, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Maestros`
-- -----------------------------------------------------
CREATE TABLE maestros (
  PK_codigo_maestro VARCHAR(5) NOT NULL,
  nombre_maestro VARCHAR(45) NOT NULL,
  direccion_maestro VARCHAR(45) NOT NULL,
  telefono_maetro INT(8) NOT NULL,
  email_maestro VARCHAR(50) NOT NULL,
  max_cursos INT(5) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_maestro, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Registro Plataforma`
-- -----------------------------------------------------
CREATE TABLE Registro_Plataforma (
  email_usuario VARCHAR(50) NOT NULL,
  PASSWORD VARCHAR(80) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PK_codigo_perfil VARCHAR(5) NOT NULL,
  PRIMARY KEY (email_usuario, PK_codigo_estatus, PK_codigo_perfil),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Bancos`
-- -----------------------------------------------------
CREATE TABLE bancos (
  PK_codigo_banco VARCHAR(5) NOT NULL,
  nombre_banco VARCHAR(50) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_banco, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE funcionarios (
  PK_codigo_funcionario VARCHAR(5) NOT NULL,
  nombre_funcionario VARCHAR(45) NOT NULL,
  direccion_funcionario VARCHAR(45) NOT NULL,
  telefono_funcionario INT(8) NOT NULL,
  email_funcionario VARCHAR(50),
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_funcionario, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Transacciones`
-- -----------------------------------------------------
CREATE TABLE transacciones (
  PK_codigo_transacciones VARCHAR(5) NOT NULL,
  nombre_transacciones VARCHAR(45) NOT NULL,
  cantidad_transacciones FLOAT(10) NOT NULL,
  cantidad_descuento FLOAT(10) DEFAULT NULL,
  cantidad_bono FLOAT(10) DEFAULT NULL,
  codigo_banco VARCHAR(5) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_transacciones, codigo_banco, PK_codigo_estatus),
  FOREIGN KEY (codigo_banco) REFERENCES bancos(PK_codigo_banco),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Facultades`
-- -----------------------------------------------------
CREATE TABLE facultades (
  PK_codigo_facultad VARCHAR(5) NOT NULL,
  nombre_facultad VARCHAR(45) NOT NULL,
  PK_codigo_funcionario VARCHAR(45) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_facultad, PK_codigo_estatus, PK_codigo_funcionario),
  FOREIGN KEY (PK_codigo_funcionario) REFERENCES funcionarios(PK_codigo_funcionario),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Carreras`
-- -----------------------------------------------------
CREATE TABLE carreras (
  PK_codigo_carrera VARCHAR(5) NOT NULL,
  nombre_carrera VARCHAR(45) NOT NULL,
  PK_codigo_facultad VARCHAR(5) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_carrera, PK_codigo_facultad, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_facultad) REFERENCES facultades(PK_codigo_facultad),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE cursos (
  PK_codigo_curso VARCHAR(5) NOT NULL,
  nombre_curso VARCHAR(45) NOT NULL,
  creditos_curso VARCHAR(45) NOT NULL,
  nota_max_perder_curso FLOAT(3) NOT NULL,
  nota_max_ganar_curso FLOAT(3) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_curso, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`plan de cursos`
-- -----------------------------------------------------
CREATE TABLE plancursos (
  PK_codigo_curso VARCHAR(5) NOT NULL,
  prerequisito_curso VARCHAR(5) DEFAULT NULL,
  prerequisito_creditos VARCHAR(5) DEFAULT NULL,
  codigo_pensum VARCHAR(5) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_curso, codigo_pensum, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_curso) REFERENCES cursos(PK_codigo_curso),
  FOREIGN KEY (codigo_pensum) REFERENCES pensum(PK_codigo_pensum),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Secciones`
-- -----------------------------------------------------
CREATE TABLE secciones (
  PK_codigo_seccion VARCHAR(5) NOT NULL,
  nombre_seccion VARCHAR(45) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_seccion, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Sedes`
-- -----------------------------------------------------
CREATE TABLE sedes (
  PK_codigo_sede VARCHAR(5) NOT NULL,
  nombre_sede VARCHAR(45) NOT NULL,
  PK_codigo_funcionario VARCHAR(45) NOT NULL,
  correo_sede VARCHAR(45) NOT NULL,
  direccion_sede VARCHAR(45) NOT NULL,
  horario_sede VARCHAR(45) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_sede, PK_codigo_funcionario, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_funcionario) REFERENCES funcionarios(PK_codigo_funcionario),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Aulas`
-- -----------------------------------------------------
CREATE TABLE aulas (
  PK_codigo_aula VARCHAR(5) NOT NULL,
  numero_aula VARCHAR(45) NOT NULL,
  nombre_aula VARCHAR(45) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_aula, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Jornadas`
-- -----------------------------------------------------
CREATE TABLE jornadas (
  PK_codigo_jornada VARCHAR(5) NOT NULL,
  PK_codigo_funcionario VARCHAR(45) NOT NULL,
  nombre_jornada VARCHAR(45) NOT NULL,
  entrada_jornada TIME(6) NOT NULL,
  salida_jornada TIME(6) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_jornada, PK_codigo_funcionario, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_funcionario) REFERENCES funcionarios(PK_codigo_funcionario),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Perfiles`
-- -----------------------------------------------------
CREATE TABLE perfiles (
PK_codigo_perfil VARCHAR(5) NOT NULL,
nombre_perfil VARCHAR (50) NOT NULL,
descripcion_perfil  VARCHAR (60) NOT NULL,
PK_codigo_estatus  TINYINT(2) NOT NULL,
PRIMARY KEY (PK_codigo_perfil, PK_codigo_estatus),
FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Permisos`
-- -----------------------------------------------------
CREATE TABLE permisos (
PK_email_usuario VARCHAR(50) NOT NULL,
PK_id_perfil VARCHAR (50) NOT NULL,
ingresar  TINYINT(2) NOT NULL,
consultar  TINYINT(2) NOT NULL,
modifcar TINYINT(2) NOT NULL,
eliminar  TINYINT(2) NOT NULL,
PRIMARY KEY (PK_email_usuario, PK_id_perfil),
FOREIGN KEY (PK_email_usuario) REFERENCES Registro_Plataforma (email_usuario),
FOREIGN KEY (PK_id_perfil) REFERENCES perfiles (PK_codigo_perfil)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


--------------------------------------------------
-- Table `educativo`.`asignacion cursos a alumno`
-- -----------------------------------------------------
CREATE TABLE asignacioncursosalumnos (
  PK_codigo_carrera VARCHAR(5),
  PK_codigo_sede VARCHAR(5),
  PK_codigo_jornada VARCHAR(5),
  PK_codigo_seccion VARCHAR(5),
  PK_codigo_aula VARCHAR(5),
  PK_codigo_curso VARCHAR(5),
  PK_carnet_alumno VARCHAR(15),
  PK_nota_asignacioncursoalumnos FLOAT(10, 2),
  fecha_asignacion DATETIME NOT NULL, 
  PRIMARY KEY (
    PK_codigo_carrera,
    PK_codigo_sede,
    PK_codigo_jornada,
    PK_codigo_seccion,
    PK_codigo_aula,
    PK_codigo_curso,
    PK_carnet_alumno
  ),
  FOREIGN KEY (PK_codigo_carrera) REFERENCES carreras(PK_codigo_carrera),
  FOREIGN KEY (PK_codigo_sede) REFERENCES sedes(PK_codigo_sede),
  FOREIGN KEY (PK_codigo_jornada) REFERENCES jornadas(PK_codigo_jornada),
  FOREIGN KEY (PK_codigo_seccion) REFERENCES secciones(PK_codigo_seccion),
  FOREIGN KEY (PK_codigo_aula) REFERENCES aulas(PK_codigo_aula),
  FOREIGN KEY (PK_codigo_curso) REFERENCES cursos(PK_codigo_curso),
  FOREIGN KEY (PK_carnet_alumno) REFERENCES alumnos(PK_carnet_alumno)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`pago de alumno`
-- -----------------------------------------------------
CREATE TABLE pago_de_alumnos (
  PK_codigo_pago VARCHAR(5) NOT NULL,
  PK_carnet_alumno VARCHAR(45) NOT NULL,
  PK_codigo_transacciones VARCHAR(5) NOT NULL,
  PK_codigo_banco VARCHAR(5) NOT NULL,
  fecha_pago DATETIME NOT NULL,
  cantidad_pago FLOAT(10) NOT NULL,
  PRIMARY KEY (
    PK_codigo_pago,
    PK_carnet_alumno,
    PK_codigo_transacciones,
    PK_codigo_banco
  ),
  FOREIGN KEY (PK_carnet_alumno) REFERENCES alumnos(PK_carnet_alumno),
  FOREIGN KEY (PK_codigo_transacciones) REFERENCES transacciones(PK_codigo_transacciones),
  FOREIGN KEY (PK_codigo_banco) REFERENCES bancos(PK_codigo_banco)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Pagos a maestros`
-- -----------------------------------------------------
CREATE TABLE pago_a_maestros (
  PK_codigo_pago VARCHAR(5) NOT NULL,
  codigo_maestro VARCHAR(5) NOT NULL,
  sueldo_maestro float(5, 2),
  FOREIGN KEY (codigo_maestro) REFERENCES maestros(PK_codigo_maestro),
  PRIMARY KEY (PK_codigo_pago, codigo_maestro)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Actividades Educativas`
-- -----------------------------------------------------
CREATE TABLE actividadeseducativas(
  PK_codigo_actividad VARCHAR(5) NOT NULL,
  nombre_actividad VARCHAR(45) NOT NULL,
  descricion_actividad VARCHAR(45) NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_actividad, PK_codigo_estatus),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`notas`
-- -----------------------------------------------------
CREATE TABLE notas (
  PK_codigo_nota VARCHAR(5) NOT NULL,
  PK_carnet_alumno VARCHAR(5) NOT NULL,
  PK_codigo_maestro VARCHAR(5) NOT NULL,
  PK_codigo_actividad VARCHAR(5) NOT NULL,
  nota_actividad FLOAT(3) NOT NULL,
  fecha_asignacion_nota DATETIME NOT NULL,
  PK_codigo_estatus TINYINT(2) NOT NULL,
  PRIMARY KEY (PK_codigo_nota),
  FOREIGN KEY (PK_carnet_alumno) REFERENCES alumnos(PK_carnet_alumno),
  FOREIGN KEY (PK_codigo_maestro) REFERENCES maestros(PK_codigo_maestro),
  FOREIGN KEY (PK_codigo_estatus) REFERENCES estatus(PK_codigo_estatus)
) ENGINE = INNODB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Asignacion_cursos_maestros`
-- -----------------------------------------------------
CREATE TABLE asignacioncursosmaestros (
  PK_codigo_carrera VARCHAR(5),
  PK_codigo_sede VARCHAR(5),
  PK_codigo_jornada VARCHAR(5),
  PK_codigo_seccion VARCHAR(5),
  PK_codigo_aula VARCHAR(5),
  PK_codigo_curso VARCHAR(5),
  PK_codigo_maestro VARCHAR(5),
  PRIMARY KEY (
    PK_codigo_carrera,
    PK_codigo_sede,
    PK_codigo_jornada,
    PK_codigo_seccion,
    PK_codigo_aula,
    PK_codigo_curso,
    PK_codigo_maestro
  ),
  FOREIGN KEY (PK_codigo_carrera) REFERENCES carreras(PK_codigo_carrera),
  FOREIGN KEY (PK_codigo_sede) REFERENCES sedes(PK_codigo_sede),
  FOREIGN KEY (PK_codigo_jornada) REFERENCES jornadas(PK_codigo_jornada),
  FOREIGN KEY (PK_codigo_seccion) REFERENCES secciones(PK_codigo_seccion),
  FOREIGN KEY (PK_codigo_aula) REFERENCES aulas(PK_codigo_aula),
  FOREIGN KEY (PK_codigo_curso) REFERENCES cursos(PK_codigo_curso),
  FOREIGN KEY (PK_codigo_maestro) REFERENCES maestros(PK_codigo_maestro)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- -----------------------------------------------------
-- Table `educativo`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE bitacora (
  PK_id_bitacora INT NOT NULL AUTO_INCREMENT,
  PK_id_usuario VARCHAR(25) NOT NULL,
  fecha VARCHAR(25)  null DEFAULT NULL,
  hora VARCHAR(25) NULL DEFAULT NULL,
  host1 VARCHAR(45) NULL DEFAULT NULL,
  ip VARCHAR(25) NULL DEFAULT NULL,
  accion VARCHAR(50) NULL DEFAULT NULL,
  tabla VARCHAR(45) NULL DEFAULT NULL,
  PK_codigo_facultad VARCHAR(45) NULL DEFAULT NULL,
  PK_codigo_carrera VARCHAR(45) NULL DEFAULT NULL,
  PK_codigo_sede VARCHAR(45) NULL DEFAULT NULL,
  PK_codigo_jornada VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (PK_id_bitacora),
  FOREIGN KEY (PK_codigo_facultad) REFERENCES facultades(PK_codigo_facultad),
  FOREIGN KEY (PK_codigo_carrera) REFERENCES carreras(PK_codigo_carrera),
  FOREIGN KEY (PK_codigo_sede) REFERENCES sedes(PK_codigo_sede),
  FOREIGN KEY (PK_codigo_jornada) REFERENCES jornadas(PK_codigo_jornada)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
