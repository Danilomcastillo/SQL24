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
NOMBRE VARCHAR(50) ,
MIEMBROS INT,
CARRERAS_CONCURSADAS INT, 
PAIS VARCHAR(50),
CARRERAS_GANADAS INT
);

CREATE TABLE COMPETIDORES (
ID_COMPETIDOR INT auto_increment PRIMARY KEY,
NOMBRE VARCHAR(50),
APELLIDO VARCHAR (50),
EDAD INT,
NACIONALIDAD VARCHAR (50),
EQUIPO VARCHAR (15),
CANTIDAD_CARRERAS INT,
ID_CARRERA INT,
FOREIGN KEY (ID_CARRERA) REFERENCES CARRERA (ID_CARRERA)
);

CREATE TABLE BICICLETAS (
ID_MARCA INT auto_increment PRIMARY KEY, 
MODELO VARCHAR (50),
TIPO VARCHAR (50), 
PAIS VARCHAR (50),
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
VALUES 				("Egales", 7, 6, "USA", 1), ("Bianchi", 9, 10, "Francia", 6), ("Contra", 7, 8, "Espana", 2), ("Saville", 7, 2, "Belgica", 1),
					("Saude", 5, 4, "Brasil", 0), ("Northen", 8, 8, "Inglaterra", 2), ("Masa critica", 10, 3, "Argentina", 1), 
                    ("Mela", 6, 6, "Italia", 4), ("Mangia", 8, 1, "Italia", 0), ("Torreones", 7, 1, "Espana", 2), ("Raclette", 8, 20, "Francia", 5),
					("Bianco", 6, 18, 'Italia', 4), ('Wermouth', 7, 22, 'España', 6);
	
---- COMPETIDORES

INSERT INTO COMPETIDORES (ID_COMPETIDOR, NOMBRE, APELLIDO, EDAD, NACIONALIDAD, EQUIPO, CANTIDAD_CARRERAS)
VALUES              	(1 ,"Jean", "Baptiste", "31", "Francia", 2, 3) ;

INSERT INTO COMPETIDORES (NOMBRE, APELLIDO, EDAD, NACIONALIDAD, EQUIPO, CANTIDAD_CARRERAS)
VALUES 					("Jonas", "Gutierrez", 21, "Argentina", 2, 2), ('Juan', 'Pérez', 28, 'Espanol', 2, 3),
						('Maria', 'García', 25, 'Italiana', 4, 2),
						('Pedro', 'Martínez', 30, 'Francés', 1, 1), ('Luis', 'Ramírez', 32, 'Colombiano', 2, 1),
						('Giulia', 'Rossi', 27, 'Suiza', 3, 8),
						('Takahiro', 'Sato', 29, 'Japones', 2, 9);


---- BICICLETAS

INSERT INTO BICICLETAS (ID_MARCA, MODELO, TIPO, PAIS, ID_COMPETIDOR)
VALUES             		(1, "Bianchi", "Ruta", "Francia", 1);	

INSERT INTO BICICLETAS (MODELO, TIPO, PAIS, ID_COMPETIDOR)
VALUES 					("Corsa", "Gravel", 'Colombia', 4), ("Mondello", "Ruta", 'Suiza', 5), ("Mazzi", "Gravel", "Italia", 6);



-- Crear la función que devuelve la cantidad de competidores argentinos
DELIMITER //

CREATE FUNCTION contarCompetidoresArgentinos()
RETURNS INT
BEGIN
    DECLARE cantidad_argentinos INT;
    
    SELECT COUNT(*)
    INTO cantidad_argentinos
    FROM COMPETIDORES
    WHERE NACIONALIDAD = "Argentina";

    RETURN cantidad_argentinos;
END//

DELIMITER ;


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



 