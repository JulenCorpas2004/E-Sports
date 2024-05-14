-- 1. Script SQL de borrado y creacion de las tablas.

-- BORRADO DE TABLAS.

DROP TABLE USUARIOS;
DROP TABLE JUGADORES CASCADE CONSTRAINTS;
DROP TABLE STAFFS CASCADE CONSTRAINTS;
DROP TABLE EQUIPOS CASCADE CONSTRAINTS;
DROP TABLE PATROCINADORES CASCADE CONSTRAINTS;
DROP TABLE COMPETICIONES CASCADE CONSTRAINTS;
DROP TABLE JORNADAS CASCADE CONSTRAINTS;
DROP TABLE ENFRENTAMIENTOS CASCADE CONSTRAINTS;
DROP TABLE JUEGOS;
DROP TABLE PATROCINADORES_EQUIPOS CASCADE CONSTRAINTS;
DROP TABLE EQUIPOS_COMPETICIONES CASCADE CONSTRAINTS;

-- CREACION DE TABLAS.

CREATE TABLE USUARIOS (
	NOM_USUARIO VARCHAR2(30),
	CONTRASENA VARCHAR2(10) NOT NULL,
	TIPO VARCHAR2(1) NOT NULL,
	CONSTRAINT USU_NOM_PK PRIMARY KEY (NOM_USUARIO),
	CONSTRAINT USU_TIPO_CK CHECK (TIPO IN ('A','N'))
);

CREATE TABLE EQUIPOS (
	ID_EQUIPO NUMBER(2) GENERATED ALWAYS AS IDENTITY 
						INCREMENT BY 1
						START WITH 1
						MINVALUE 1
						MAXVALUE 99
						NOCACHE,
	NOM_EQUIPO VARCHAR2(30) NOT NULL,
	FECHA_FUNDACION DATE NOT NULL,
    	LOGO VARCHAR2(300),
    	COLOR VARCHAR2(300),
	CONSTRAINT EQUI_ID_PK PRIMARY KEY (ID_EQUIPO)
);

CREATE TABLE PATROCINADORES (
	ID_PATROCINADOR NUMBER(3) GENERATED ALWAYS AS IDENTITY 
                                INCREMENT BY 1
                                START WITH 1
                                MINVALUE 1
                                MAXVALUE 200
                                NOCACHE,
	NOMBRE VARCHAR2(50) NOT NULL,
	CONSTRAINT PAT_ID_PK PRIMARY KEY (ID_PATROCINADOR)
);

CREATE TABLE JUEGOS (
	ID_JUEGO NUMBER(2) GENERATED ALWAYS AS IDENTITY 
                            INCREMENT BY 1
                            START WITH 1
                            MINVALUE 1
                            MAXVALUE 99
                            NOCACHE,
	NOMBRE VARCHAR2(40),
	EMPRESA VARCHAR2(50) NOT NULL,
	FECHA_LANZAMIENTO DATE NOT NULL,
	CONSTRAINT JUE_NOM_PK PRIMARY KEY (ID_JUEGO)
);

CREATE TABLE JUGADORES (
	ID_JUGADOR NUMBER(3) GENERATED ALWAYS AS IDENTITY 
                            INCREMENT BY 1
                            START WITH 1
                            MINVALUE 1
                            MAXVALUE 200
                            NOCACHE,
	NOMBRE VARCHAR2(30) NOT NULL,
	NICKNAME VARCHAR2(30) NOT NULL,
	NACIONALIDAD VARCHAR2(30) NOT NULL,
	ROL VARCHAR2(10) NOT NULL,
	FECHA_NAC DATE NOT NULL,
	SUELDO NUMBER(9,2) NOT NULL,
	ID_EQUIPO NUMBER(2) NOT NULL,
	CONSTRAINT JUG_ID_PK PRIMARY KEY (ID_JUGADOR),
    CONSTRAINT JUG_ROL_CK CHECK (ROL IN ('Lider','Jugador')),
	CONSTRAINT JUG_SUEL_CK CHECK (SUELDO>1134),
	CONSTRAINT JUG_ID_EQUI_FK FOREIGN KEY (ID_EQUIPO)
                                REFERENCES EQUIPOS(ID_EQUIPO)
);

CREATE TABLE STAFFS (
	ID_STAFF NUMBER(2) GENERATED ALWAYS AS IDENTITY 
						INCREMENT BY 1
						START WITH 1
						MINVALUE 1
						MAXVALUE 99
						NOCACHE,
	PUESTO VARCHAR2(30) NOT NULL,
	NOMBRE VARCHAR2(30) NOT NULL,
	FECHA_NAC DATE NOT NULL,
	SUELDO NUMBER(9,2) NOT NULL,
	ID_EQUIPO NUMBER(2) NOT NULL,
	CONSTRAINT STAFF_ID_PK PRIMARY KEY (ID_STAFF),
	CONSTRAINT STAFF_ID_EQUI_FK FOREIGN KEY (ID_EQUIPO)
                                REFERENCES EQUIPOS(ID_EQUIPO)
);

CREATE TABLE COMPETICIONES (
	ID_COMPETICION NUMBER(2) GENERATED ALWAYS AS IDENTITY 
                                INCREMENT BY 1
                                START WITH 1
                                MINVALUE 1
                                MAXVALUE 99
                                NOCACHE,
	NOMBRE_COM VARCHAR2(100) NOT NULL,
	FECHA_INICIO DATE NOT NULL,
	FECHA_FIN DATE NOT NULL,
	ETAPA VARCHAR2(2) NOT NULL,
	ID_JUEGO NUMBER(2) NOT NULL,
	ID_EQUIPO_GANADOR NUMBER(2) NULL,
	CONSTRAINT COMP_ID_PK PRIMARY KEY (ID_COMPETICION),
	CONSTRAINT COMP_FECHA_CK CHECK (FECHA_INICIO<FECHA_FIN),
	CONSTRAINT COMP_ETAPA_CK CHECK (ETAPA IN ('A','C')),
	CONSTRAINT COMP_ID_JUE_FK FOREIGN KEY (ID_JUEGO)
                                REFERENCES JUEGOS(ID_JUEGO),
	CONSTRAINT COMP_ID_EQUI_FK FOREIGN KEY (ID_EQUIPO_GANADOR)
                                REFERENCES EQUIPOS(ID_EQUIPO)
);

CREATE TABLE JORNADAS (
	ID_JORNADA NUMBER(3) GENERATED ALWAYS AS IDENTITY 
                            INCREMENT BY 1
                            START WITH 1
                            MINVALUE 1
                            MAXVALUE 200
                            NOCACHE,
	NUM_JORNADA NUMBER(3) NOT NULL,
    FECHA_JORNADA DATE NOT NULL,
	ID_COMPETICION NUMBER(2) NOT NULL,
	CONSTRAINT JOR_ID_PK PRIMARY KEY (ID_JORNADA),
	CONSTRAINT JOR_ID_COMP_FK FOREIGN KEY (ID_COMPETICION)
                                REFERENCES COMPETICIONES(ID_COMPETICION)
);

CREATE TABLE ENFRENTAMIENTOS (
	ID_ENFRENTAMIENTO NUMBER(3) GENERATED ALWAYS AS IDENTITY 
                                INCREMENT BY 1
                                START WITH 1
                                MINVALUE 1
                                MAXVALUE 200
                                NOCACHE,
	HORA_ENFRENTAMIENTO TIMESTAMP NOT NULL,
	RESULTADO1 NUMBER(2) NOT NULL,
	RESULTADO2 NUMBER(2) NOT NULL,
	ID_EQUIPO1 NUMBER(2) NOT NULL,
	ID_EQUIPO2 NUMBER(2) NOT NULL,
	ID_JORNADA NUMBER(2) NOT NULL,
	CONSTRAINT ENF_ID_PK PRIMARY KEY (ID_ENFRENTAMIENTO),
	CONSTRAINT ENF_ID_EQUI1_FK FOREIGN KEY (ID_EQUIPO1)
                                REFERENCES EQUIPOS(ID_EQUIPO),
	CONSTRAINT ENF_ID_EQUI2_FK FOREIGN KEY (ID_EQUIPO2)
                                REFERENCES EQUIPOS(ID_EQUIPO),
	CONSTRAINT ENF_ID_JOR_FK FOREIGN KEY (ID_JORNADA)
                                REFERENCES JORNADAS(ID_JORNADA)
);

CREATE TABLE PATROCINADORES_EQUIPOS (
	ID_PATROCINADOR NUMBER(3),
	ID_EQUIPO NUMBER(2),
	CONSTRAINT PAT_EQUI_ID_PK PRIMARY KEY (ID_PATROCINADOR,ID_EQUIPO),
	CONSTRAINT PAT_EQUI_ID_PAT_FK FOREIGN KEY (ID_PATROCINADOR)
                                REFERENCES PATROCINADORES(ID_PATROCINADOR),
	CONSTRAINT PAT_EQUI_ID_EQUI_FK FOREIGN KEY (ID_EQUIPO)
                                REFERENCES EQUIPOS(ID_EQUIPO)
);

CREATE TABLE EQUIPOS_COMPETICIONES (
	ID_EQUIPO NUMBER(2),
	ID_COMPETICION NUMBER(2),
	VICTORIAS NUMBER(4),
    	PUNTOS NUMBER(4),
	CONSTRAINT EQUI_COMP_ID_PK PRIMARY KEY (ID_EQUIPO,ID_COMPETICION),
	CONSTRAINT EQUI_COMP_ID_EQUI_FK FOREIGN KEY (ID_EQUIPO)
                                REFERENCES EQUIPOS(ID_EQUIPO),
	CONSTRAINT EQUI_COMP_ID_COMP_FK FOREIGN KEY (ID_COMPETICION)
                                REFERENCES COMPETICIONES(ID_COMPETICION)
);
