CREATE DATABASE gimnasio_cuerpo_activo;


CREATE TABLE socios (
    numero_documento VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE planes (
    id_plan SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    duracion_mes INT NOT NULL CHECK (duracion_mes > 0),
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0)
);


CREATE TABLE entrenadores (
    id_entrenador SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE fichas_medicas (
    id_ficha SERIAL PRIMARY KEY,
    numero_documento VARCHAR(20) NOT NULL UNIQUE REFERENCES socios(numero_documento),
    peso NUMERIC(5, 2) NOT NULL CHECK (peso > 0),
    estatura NUMERIC(4, 2) NOT NULL CHECK (estatura > 0),
    lesiones TEXT
);


CREATE TABLE membresias (
    id_membresia SERIAL PRIMARY KEY,
    numero_documento VARCHAR(20) NOT NULL REFERENCES socios(numero_documento),
    id_plan INT NOT NULL REFERENCES planes(id_plan),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    CHECK (fecha_fin > fecha_inicio)
);


CREATE TABLE clases_grupales (
    id_clase SERIAL PRIMARY KEY,
    id_entrenador INT NOT NULL REFERENCES entrenadores(id_entrenador),
    nombre VARCHAR(100) NOT NULL,
    dia_semana VARCHAR(15) NOT NULL CHECK (
        dia_semana IN ('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo')
    ),
    hora TIME NOT NULL,
    cupo INT NOT NULL CHECK (cupo > 0)
);


CREATE TABLE inscripciones (
    id_inscripcion SERIAL PRIMARY KEY,
    id_clase INT NOT NULL REFERENCES clases_grupales(id_clase),
    numero_documento VARCHAR(20) NOT NULL REFERENCES socios(numero_documento),
    fecha_inscripcion DATE NOT NULL DEFAULT CURRENT_DATE,
    UNIQUE (id_clase, numero_documento)
);