
/*
This is the database script to SIGEX (Sistema de gestión de Examenes).
Created by Eneudy Báez 2018-2277
*/

CREATE DATABASE sigex;

USE sigex;

/* Creating tables */

/* Profesor */
CREATE TABLE Profesor (
    ProfesorId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre varchar(255) NOT NULL,
    Apellido varchar(255)
);

/* Curso */
CREATE TABLE Curso (
    CursoId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre varchar(255) NOT NULL,
	Creditos int,
	ProfesorId int FOREIGN KEY REFERENCES Profesor(ProfesorId)
);

/* Estudiante */
CREATE TABLE Estudiante (
    EstudianteId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre varchar(255) NOT NULL,
	Apellido varchar(255),
	Matricula varchar(255)
);

/* EstudianteCurso */
CREATE TABLE EstudianteCurso (
    EstudianteCursoId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EstudianteId int FOREIGN KEY REFERENCES Estudiante(EstudianteId),
	CursoId int FOREIGN KEY REFERENCES Curso(CursoId)
);

/* Examen */
CREATE TABLE Examen (
    ExamenId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre varchar(255) NOT NULL,
	NumeroPreguntas int,
	PuntuacionExamen int,
	CursoId int FOREIGN KEY REFERENCES Curso(CursoId)
);

/* Pregunta */
CREATE TABLE Pregunta (
    PreguntaId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Texto varchar(255) NOT NULL,
	PuntuacionPregunta int,
	ExamenId int FOREIGN KEY REFERENCES Examen(ExamenId)
);

/* Respuesta */
CREATE TABLE Respuesta (
    RespuestaId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Texto varchar(255) NOT NULL,
	EsCorrecta bit,
	PreguntaId int FOREIGN KEY REFERENCES Pregunta(PreguntaId)
);

/* DetalleExamen */
CREATE TABLE DetalleExamen (
    DetalleExamenId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EstudianteId int FOREIGN KEY REFERENCES Estudiante(EstudianteId),
	ExamenId int FOREIGN KEY REFERENCES Examen(ExamenId),
	PreguntaId int FOREIGN KEY REFERENCES Pregunta(PreguntaId),
	RespuestaId int FOREIGN KEY REFERENCES Respuesta(RespuestaId)
);


/* Inserting test data */

/* Profesores */
INSERT INTO Profesor(Nombre, Apellido) values ('Alexis', 'Morillo');
INSERT INTO Profesor(Nombre, Apellido) values ('Domingo', 'Martinez');

/* Cursos */
INSERT INTO Curso(Nombre, Creditos, ProfesorId) values ('Propietaria 2', 4, 1);
INSERT INTO Curso(Nombre, Creditos, ProfesorId) values ('Open source 2', 4, 2);

/* Estudiantes */
INSERT INTO Estudiante(Nombre, Apellido, Matricula) values ('Eneudy', 'Báez', '2018-2277');
INSERT INTO Estudiante(Nombre, Apellido, Matricula) values ('Diana', 'Joa', '2018-0983');

/* EstudianteCurso */
INSERT INTO EstudianteCurso(EstudianteId, CursoId) values (1, 1);
INSERT INTO EstudianteCurso(EstudianteId, CursoId) values (2, 1);

/* Examenes */
INSERT INTO Examen(Nombre, NumeroPreguntas, PuntuacionExamen, CursoId) values ('Primer Parcial', 5, 10, 1);

/* Preguntas */
INSERT INTO Pregunta(Texto, PuntuacionPregunta, ExamenId) values ('¿Qué significa mcv?', 5, 1);
INSERT INTO Pregunta(Texto, PuntuacionPregunta, ExamenId) values ('¿Qué hace la vista?', 5, 1);

/* Respuestas */
INSERT INTO Respuesta(Texto, EsCorrecta, PreguntaId) values ('Mvc es un lenguaje de programación', 'False', 1);
INSERT INTO Respuesta(Texto, EsCorrecta, PreguntaId) values ('Mvc es un estándar de software', 'False', 1);
INSERT INTO Respuesta(Texto, EsCorrecta, PreguntaId) values ('Mvc significa Model View Controller', 'True', 1);
INSERT INTO Respuesta(Texto, EsCorrecta, PreguntaId) values ('La vista maneja datos', 'False', 1);
INSERT INTO Respuesta(Texto, EsCorrecta, PreguntaId) values ('La vista controla el request', 'False', 1);
INSERT INTO Respuesta(Texto, EsCorrecta, PreguntaId) values ('La vista maneja el template (html, css y js)', 'True', 1);

/* DetalleExamen */
INSERT INTO DetalleExamen(EstudianteId, ExamenId, PreguntaId, RespuestaId) values (1, 1, 1, 3);
INSERT INTO DetalleExamen(EstudianteId, ExamenId, PreguntaId, RespuestaId) values (1, 1, 2, 6);
INSERT INTO DetalleExamen(EstudianteId, ExamenId, PreguntaId, RespuestaId) values (2, 1, 1, 3);
INSERT INTO DetalleExamen(EstudianteId, ExamenId, PreguntaId, RespuestaId) values (2, 1, 2, 6);
