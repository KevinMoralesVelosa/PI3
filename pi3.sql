CREATE DATABASE IF NOT EXISTS PI3;
USE PI3;

-- Crear tablas 
DROP TABLE Accidentes_Aviones;
CREATE TABLE Accidentes_Aviones (
PaisAccidente VARCHAR(250),
Fecha DATE,
OperadorAerolinea VARCHAR(250),
TipoAeronave VARCHAR(250),
PasajerosABordo VARCHAR(250),
TripulacionABordo INTEGER,
CantidadFallecidos INTEGER,
MuertesPasajeros INTEGER,
MuertesTripulacion INTEGER
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- importar bases de datos dentro de la tabla creada
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//DB_Accidentes_aviones.csv"
INTO TABLE Accidentes_Aviones
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

DROP TABLE Causas_Accidentes;
CREATE TABLE Causas_Accidentes (
PaisAccidente VARCHAR(250),
Fecha DATE,
LugarAccidente VARCHAR(250),
OperadorAerolinea VARCHAR(250),
CausaAccidente VARCHAR(250)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//DB_Causas_Accidentes.csv"
INTO TABLE Causas_Accidentes
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

DROP TABLE Aerolineas_Accidentes;
CREATE TABLE Aerolineas_Accidentes (
PaisAccidente VARCHAR(250),
OperadorAerolinea VARCHAR(250),
Fecha DATE,
LugarAccidente VARCHAR(250),
TipoAeronave VARCHAR(250)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//DB_Aerolineas.csv"
INTO TABLE Aerolineas_Accidentes
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

-- creando indices
ALTER TABLE accidentes_aviones ADD INDEX (OperadorAerolinea);
ALTER TABLE aerolineas_accidentes ADD INDEX (OperadorAerolinea);
ALTER TABLE causas_accidentes ADD INDEX (OperadorAerolinea);

-- creando foraneas
SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE accidentes_aviones ADD CONSTRAINT aviones_fk_aerolineas FOREIGN KEY (OperadorAerolinea) REFERENCES aerolineas_accidentes (OperadorAerolinea)ON UPDATE CASCADE;
ALTER TABLE aerolineas_accidentes ADD CONSTRAINT aerolineas_fk_causas FOREIGN KEY (OperadorAerolinea) REFERENCES causas_accidentes (OperadorAerolinea)ON UPDATE CASCADE;
ALTER TABLE causas_accidentes ADD CONSTRAINT causas_fk_aviones FOREIGN KEY (OperadorAerolinea) REFERENCES accidentes_aviones (OperadorAerolinea)ON UPDATE CASCADE;

-- muertos por pais
SELECT PaisAccidente, sum(CantidadFallecidos)  as cantidad_fallecidos
FROM accidentes_aviones
GROUP BY PaisAccidente
ORDER BY cantidad_fallecidos desc;

SELECT CausaAccidente, count(*)  as CausasFrecuentes
FROM causas_accidentes
GROUP BY CausaAccidente
ORDER BY CausasFrecuentes desc;

-- Muertes por aerolinea
SELECT OperadorAerolinea, count(*)  as CantidadAccidentes
FROM aerolineas_accidentes
GROUP BY OperadorAerolinea
ORDER BY CantidadAccidentes desc;
-- cambiar ciudades a paises
UPDATE aerolineas_accidentes SET PaisAccidente = 'EE.UU'
WHERE PaisAccidente IN (' California');

UPDATE aerolineas_accidentes SET PaisAccidente = 'EE.UU'
WHERE PaisAccidente IN (' New York',
                            ' Illinois',
                            ' Georgia',
                            ' Texas',
                            ' Pennsylvania',
                            ' Florida',
                            ' North Carolina',
                            ' Massachusetts',
                            ' New Jersey',
                            ' Maryland',
                            ' Queens',
                            ' Nevada',
                            ' Michigan',
                            ' Arizona',
                             ' Colorado',
                             ' Missouri',
                              ' Indiana',
                               ' Louisiana',
                               ' Utah',
                               ' West Virginia',
                               ' Iowa',
                               ' Kentucky',
                               ' Montana',
                                ' Minnesota',
                                ' Ontario',
                               ' Covington/Hebron',
                               ' Oklahoma',
                               ' Boston',
                               ' Nebraska',
                                ' Tennessee',
                               ' Idaho',
                               ' New Mexico',
                                ' South Carolina',
                                ' Alabama',
                                ' Virginia.',
                                ' Connecticut',
                                 ' Wisconsin',
                                 ' New Orleans',
                                 ' Arkansas',
                                 ' Oregon',
                                 ' Tennesee',
                                 ' Chicago',
                                 ' Bahamas',
                                 ' Los Angeles',
                                  ' Washingon',
                                  ' Kansas',
                                  ' Jersey',
                                  ' Washington DC',
                                  ' Cailifornia',
                                  ' Wisconson');


UPDATE aerolineas_accidentes SET PaisAccidente = 'Russia'
WHERE PaisAccidente IN (' USSR', ' Russia');

-- en accidentes_aviones

UPDATE accidentes_aviones SET PaisAccidente = 'EE.UU'
WHERE PaisAccidente IN (' California');

UPDATE accidentes_aviones SET PaisAccidente = 'EE.UU'
WHERE PaisAccidente IN (' New York',
                            ' Illinois',
                            ' Georgia',
                            ' Texas',
                            ' Pennsylvania',
                            ' Florida',
                            ' North Carolina',
                            ' Massachusetts',
                            ' New Jersey',
                            ' Maryland',
                            ' Queens',
                            ' Nevada',
                            ' Michigan',
                            ' Arizona',
                             ' Colorado',
                             ' Missouri',
                              ' Indiana',
                               ' Louisiana',
                               ' Utah',
                               ' West Virginia',
                               ' Iowa',
                               ' Kentucky',
                               ' Montana',
                                ' Minnesota',
                                ' Ontario',
                               ' Covington/Hebron',
                               ' Oklahoma',
                               ' Boston',
                               ' Nebraska',
                                ' Tennessee',
                               ' Idaho',
                               ' New Mexico',
                                ' South Carolina',
                                ' Alabama',
                                ' Virginia.',
                                ' Connecticut',
                                 ' Wisconsin',
                                 ' New Orleans',
                                 ' Arkansas',
                                 ' Oregon',
                                 ' Tennesee',
                                 ' Chicago',
                                 ' Bahamas',
                                 ' Los Angeles',
                                  ' Washingon',
                                  ' Kansas',
                                  ' Jersey',
                                  ' Washington DC',
                                  ' Cailifornia',
                                  ' Wisconson');


UPDATE accidentes_aviones SET PaisAccidente = 'Russia'
WHERE PaisAccidente IN (' USSR',' Russia');

-- en causas_accidentes

UPDATE causas_accidentes SET PaisAccidente = 'EE.UU'
WHERE PaisAccidente IN (' California');

UPDATE causas_accidentes SET PaisAccidente = 'EE.UU'
WHERE PaisAccidente IN (' New York',
                            ' Illinois',
                            ' Georgia',
                            ' Texas',
                            ' Pennsylvania',
                            ' Florida',
                            ' North Carolina',
                            ' Massachusetts',
                            ' New Jersey',
                            ' Maryland',
                            ' Queens',
                            ' Nevada',
                            ' Michigan',
                            ' Arizona',
                             ' Colorado',
                             ' Missouri',
                              ' Indiana',
                               ' Louisiana',
                               ' Utah',
                               ' West Virginia',
                               ' Iowa',
                               ' Kentucky',
                               ' Montana',
                                ' Minnesota',
                                ' Ontario',
                               ' Covington/Hebron',
                               ' Oklahoma',
                               ' Boston',
                               ' Nebraska',
                                ' Tennessee',
                               ' Idaho',
                               ' New Mexico',
                                ' South Carolina',
                                ' Alabama',
                                ' Virginia.',
                                ' Connecticut',
                                 ' Wisconsin',
                                 ' New Orleans',
                                 ' Arkansas',
                                 ' Oregon',
                                 ' Tennesee',
                                 ' Chicago',
                                 ' Bahamas',
                                 ' Los Angeles',
                                  ' Washingon',
                                  ' Kansas',
                                  ' Jersey',
                                  ' Washington DC',
                                  ' Cailifornia',
                                  ' Wisconson');


UPDATE causas_accidentes SET PaisAccidente = 'Russia'
WHERE PaisAccidente IN (' USSR', ' Russia');


SELECT CausaAccidente, count(LugarAccidente)  as cantidad_accidentes, PaisAccidente
FROM causas_accidentes
GROUP BY CausaAccidente
ORDER BY CausaAccidente DESC;

select MIN(year(Fecha))
from accidentes_aviones;
select MAX(year(Fecha))
from accidentes_aviones;

-- creando decadas
ALTER TABLE accidentes_aviones ADD Decada VARCHAR(200) NOT NULL DEFAULT '0' AFTER MuertesTripulacion;
ALTER TABLE aerolineas_accidentes ADD Decada VARCHAR(200) NOT NULL DEFAULT '0' AFTER TipoAeronave;
ALTER TABLE causas_accidentes ADD Decada VARCHAR(200) NOT NULL DEFAULT '0' AFTER CausaAccidente;

-- llenando decadas de acuerdo al anio en cada tabla
UPDATE accidentes_aviones SET Decada = '20s' WHERE YEAR(Fecha) < 1930 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '30s' WHERE YEAR(Fecha) < 1940 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '40s' WHERE YEAR(Fecha) < 1950 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '50s' WHERE YEAR(Fecha) < 1960 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '60s' WHERE YEAR(Fecha) < 1970 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '70s' WHERE YEAR(Fecha) < 1980 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '80s' WHERE YEAR(Fecha) < 1990 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '90s' WHERE YEAR(Fecha) < 2000 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '2000s' WHERE YEAR(Fecha) < 2010 AND Decada = '0';
UPDATE accidentes_aviones SET Decada = '2010s' WHERE YEAR(Fecha) < 2021 AND Decada = '0';


UPDATE aerolineas_accidentes SET Decada = '20s' WHERE YEAR(Fecha) < 1930 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '30s' WHERE YEAR(Fecha) < 1940 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '40s' WHERE YEAR(Fecha) < 1950 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '50s' WHERE YEAR(Fecha) < 1960 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '60s' WHERE YEAR(Fecha) < 1970 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '70s' WHERE YEAR(Fecha) < 1980 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '80s' WHERE YEAR(Fecha) < 1990 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '90s' WHERE YEAR(Fecha) < 2000 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '2000s' WHERE YEAR(Fecha) < 2010 AND Decada = '0';
UPDATE aerolineas_accidentes SET Decada = '2010s' WHERE YEAR(Fecha) < 2021 AND Decada = '0';

UPDATE causas_accidentes SET Decada = '20s' WHERE YEAR(Fecha) < 1930 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '30s' WHERE YEAR(Fecha) < 1940 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '40s' WHERE YEAR(Fecha) < 1950 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '50s' WHERE YEAR(Fecha) < 1960 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '60s' WHERE YEAR(Fecha) < 1970 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '70s' WHERE YEAR(Fecha) < 1980 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '80s' WHERE YEAR(Fecha) < 1990 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '90s' WHERE YEAR(Fecha) < 2000 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '2000s' WHERE YEAR(Fecha) < 2010 AND Decada = '0';
UPDATE causas_accidentes SET Decada = '2010s' WHERE YEAR(Fecha) < 2021 AND Decada = '0';


SELECT Decada, count(Decada)  as cantidad_accidentes
FROM causas_accidentes
GROUP BY Decada
ORDER BY Decada DESC;