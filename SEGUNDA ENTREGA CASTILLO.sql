DROP SCHEMA IF EXISTS CICLISMO_BBDD ;
CREATE SCHEMA IF NOT EXISTS  CICLISMO_BBDD ; 
USE CICLISMO_BBDD ; 

CREATE TABLE CARRERA(
ID_CARRERA INT auto_increment PRIMARY KEY,
NOMBRE VARCHAR(20),
LONGITUD INT,
DURACION INT,
LOCACION VARCHAR(15)
); 

CREATE TABLE EQUIPOS (
ID_EQUIPO INT auto_increment PRIMARY KEY,
NOMBRE INTEGER,
MIEMBROS INT,
CARRERAS_CONCURSADAS INT, 
PAIS INTEGER,
CARRERAS_GANADAS INT
);

CREATE TABLE COMPETIDORES (
ID_COMPETIDOR INT auto_increment PRIMARY KEY,
NOMBRE VARCHAR(15),
APELLIDO VARCHAR (15),
EDAD INT (2),
NACIONALIDAD VARCHAR (10),
EQUIPO VARCHAR (15),
CANTIDAD_CARRERAS INT (3),
ID_CARRERA INT (20),
FOREIGN KEY (ID_CARRERA) REFERENCES CARRERA (ID_CARRERA)
);

CREATE TABLE BICICLETAS (
ID_MARCA INT auto_increment PRIMARY KEY, 
MODELO INTEGER,
TIPO INTEGER, 
PAIS INTEGER,
ID_COMPETIDOR INT,
FOREIGN KEY (ID_COMPETIDOR) REFERENCES COMPETIDORES (ID_COMPETIDOR)
);

 --- CARRERA

INSERT INTO CARRERA (ID_CARRERA, NOMBRE, LONGITUD, DURACION,LOCACION)
VALUES              	(1 ,"Tour de france", "200", "3", "Francia");

INSERT INTO CARRERA (NOMBRE, LONGITUD, DURACION,LOCACION)
VALUES              ("Gf Argentina", 90, 1, "Argentina"), ("Vuelta a España", 120, 3, "España"), ("París-Roubaix", 40, 2, "Francia"), 
("Tour de Flandes", 200, 3, "Belgica"), ("Giro de Lombardía", 233, 5, "Italia"), ("Flecha Valona", 223, 3, "Belgica"), ("San Sebastian", 119, 4, "España"),
("Amstel Gold Race", 500, 6, "Holanda"), ("Cerros azules", 20, 1, "Argentina"), ("Gsiete lagos", 330, 4, "Argentina"), 
("Sierra nevada", 700, 5, "Argentina"), ("Vaqueiros de alzada", 344, 4, "Brasil"), ("Milan San Remo", 605, 7, "Italia");

SELECT * FROM carrera;

select NOMBRE FROM carrera where ID_carrera = 4 and LOCACION = "España" ; 

--- EQUIPOS

INSERT INTO EQUIPOS (ID_EQUIPO, NOMBRE, MIEMBROS, CARRERAS_CONCURSADAS, PAIS, CARRERAS_GANADAS)
VALUES              (1, "Riders", 8, 5, "Argentina", 2); 

INSERT INTO EQUIPOS (NOMBRE, MIEMBROS, CARRERAS_CONCURSADAS, PAIS, CARRERAS_GANADAS)
VALUES 				("Egales", 7, 6, "USA", 1), ("Bianchi", 9, 10, "Francia", 6), ("Contra", 7, 8, "España", 2), ("Saville", 7, 2, "Belgica", 0),
					("Saude", 5, 4, "Brasil", 0), ("Northen", 8, 8, "Inglaterra", 2), ("Masa crítica", 10, 3, "Argentina", 1), 
                    ("Mela", 6, 6, "Italia", 4), ("Mangia", 8, 1, "Italia", 0), ("Torreones", 7, 0, "España", 0), ('Equipo A', 8, 20, 'Francia', 5),
					('Equipo B', 6, 18, 'Italia', 4), ('Equipo C', 7, 22, 'España', 6);
	
---- COMPETIDORES

INSERT INTO COMPETIDORES (ID_COMPETIDOR, NOMBRE, APELLIDO, EDAD, NACIONALIDAD, EQUIPO, CANTIDAD_CARRERAS)
VALUES              	(1 ,"Jean", "Baptiste", "31", "Francia", 2) ;

INSERT INTO COMPETIDORES (NOMBRE, APELLIDO, EDAD, NACIONALIDAD, EQUIPO, CANTIDAD_CARRERAS)
VALUES 					("Jonas", "Gutierrez", 21, "Argentina", 2, 2), ('Juan', 'Pérez', 28, 'Español', 'Equipo A', 15, 3),
						('Maria', 'García', 25, 'Italiana', 'Equipo B', 12, 2),
						('Pedro', 'Martínez', 30, 'Francés', 'Equipo C', 18, 1), ('Luis', 'Ramírez', 32, 'Colombiano', 'Equipo D', 10, 1),
						('Giulia', 'Rossi', 27, 'Suiza', 'Equipo E', 8, 2),
						('Takahiro', 'Sato', 29, 'Japonés', 'Equipo F', 11, 3);


---- BICICLETAS

INSERT INTO BICICLETAS (ID_MARCA, MODELO, TIPO, PAIS, ID_EQUIPO)
VALUES             		(1, "Bianchi", "Ruta", "Francia", 1);	

INSERT INTO BICICLETAS (MODELO, TIPO, PAIS, ID_EQUIPO)
VALUES 					(2024, "Shogun", 'Colombia', 4), (2023, "Bianchi", 'Suiza', 5), (2022, 3, "Campagnolo", 6);



-- Función que devuelve la cantidad de competidores de Francia
DELIMITER //

CREATE FUNCTION  CompetidoresFrancia()
RETURNS INT
BEGIN
    DECLARE cantidad_francia INT;
    
    SELECT COUNT(*)
    INTO cantidad_francia
    FROM COMPETIDORES
    WHERE NACIONALIDAD = 'Francés';

    RETURN cantidad_francia;
END//


-- Vista para el equipo "A"
CREATE VIEW Equipo_A_Vista AS
SELECT *
FROM EQUIPOS
WHERE NOMBRE = 'Equipo A';


-- Procedimiento para competidores mayores de 25 años 
DELIMITER //

CREATE PROCEDURE Mayores25()
BEGIN
    SELECT *
    FROM COMPETIDORES
    WHERE EDAD > 25;
END//

DELIMITER ;



 