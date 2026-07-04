USE GD1C2022
GO

-- Eliminacion de tablas
	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'estado_de_motor')
		DROP TABLE TP.estado_de_motor

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'estado_de_caja_de_cambios')
		DROP TABLE TP.estado_de_caja_de_cambios

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'estado_freno')
		DROP TABLE TP.estado_freno

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'estado_neumatico')
		DROP TABLE TP.estado_neumatico

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'medicion')
		DROP TABLE TP.medicion

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'cambio_neumaticos')
		DROP TABLE TP.cambio_neumaticos

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'parada_box')
		DROP TABLE TP.parada_box

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'motor')
		DROP TABLE TP.motor

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'caja_de_cambios')
		DROP TABLE TP.caja_de_cambios

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'freno')
		DROP TABLE TP.freno

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'neumatico')
		DROP TABLE TP.neumatico

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'incidente_auto')
		DROP TABLE TP.incidente_auto

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'incidente')
		DROP TABLE TP.incidente

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'carrera')
		DROP TABLE TP.carrera

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'sector')
		DROP TABLE TP.sector

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'circuito')
		DROP TABLE TP.circuito

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'auto')
		DROP TABLE TP.auto

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'escuderia')
		DROP TABLE TP.escuderia

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'piloto')
		DROP TABLE TP.piloto

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'pais')
		DROP TABLE TP.pais

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'posicion')
		DROP TABLE TP.posicion

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'bandera')
		DROP TABLE TP.bandera

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'tipo_neumatico')
		DROP TABLE TP.tipo_neumatico

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'tipo_incidente')
		DROP TABLE TP.tipo_incidente

	IF EXISTS(SELECT name FROM sys.tables WHERE name LIKE 'tipo_sector')
		DROP TABLE TP.tipo_sector


-- Eliminacion de store procedures
	IF OBJECT_ID('TP.migrar_tipo_neumatico', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_tipo_neumatico

	IF OBJECT_ID('TP.migrar_tipo_incidente', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_tipo_incidente

	IF OBJECT_ID('TP.migrar_tipo_sector', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_tipo_sector
	
	IF OBJECT_ID('TP.migrar_bandera', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_bandera

	IF OBJECT_ID('TP.migrar_posiciones', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_posiciones

	IF OBJECT_ID('TP.migrar_pais', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_pais

	IF OBJECT_ID('TP.migrar_piloto', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_piloto

	IF OBJECT_ID('TP.migrar_escuderia', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_escuderia

	IF OBJECT_ID('TP.migrar_auto', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_auto

	IF OBJECT_ID('TP.migrar_circuito', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_circuito

	IF OBJECT_ID('TP.migrar_sector', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_sector

	IF OBJECT_ID('TP.migrar_carrera', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_carrera

	IF OBJECT_ID('TP.migrar_incidente', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_incidente

	IF OBJECT_ID('TP.migrar_incidente_auto', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_incidente_auto

	IF OBJECT_ID('TP.migrar_motores', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_motores

	IF OBJECT_ID('TP.migrar_caja_de_cambios', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_caja_de_cambios

	IF OBJECT_ID('TP.migrar_frenos', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_frenos

	IF OBJECT_ID('TP.migrar_neumaticos', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_neumaticos

	IF OBJECT_ID('TP.migrar_parada_box', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_parada_box

	IF OBJECT_ID('TP.migrar_cambio_neumaticos', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_cambio_neumaticos	

	IF OBJECT_ID('TP.migrar_medicion', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_medicion

	IF OBJECT_ID('TP.migrar_estado_de_motor', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_estado_de_motor

	IF OBJECT_ID('TP.migrar_estado_de_caja_de_cambios', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_estado_de_caja_de_cambios

	IF OBJECT_ID('TP.migrar_estado_de_freno', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_estado_de_freno

	IF OBJECT_ID('TP.migrar_estado_neumaticos', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_estado_neumaticos	

	IF OBJECT_ID('TP.migrar_tablas', 'P') IS NOT NULL
		DROP PROCEDURE TP.migrar_tablas


-- Eliminacion de esquema
IF EXISTS (SELECT name FROM sys.schemas WHERE name LIKE 'TP')
    DROP SCHEMA TP
GO

-- Creacion de esquema
CREATE SCHEMA TP
GO

-- Creacion de tablas
	CREATE TABLE TP.tipo_neumatico (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		tipo NVARCHAR(255)
	);

	CREATE TABLE TP.tipo_incidente (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		tipo NVARCHAR(255)
	);

	CREATE TABLE TP.tipo_sector (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		tipo NVARCHAR(255)
	);

	CREATE TABLE TP.bandera (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		color NVARCHAR(255)
	);

	CREATE TABLE TP.posicion (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		descripcion NVARCHAR(255)
	);

	CREATE TABLE TP.pais (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		nombre NVARCHAR(255)
	);

	CREATE TABLE TP.piloto (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_nacionalidad INT REFERENCES TP.pais, -- FK
		nombre NVARCHAR(50),
		apellido NVARCHAR(50),
		fecha_nacimiento DATE
	);

	CREATE TABLE TP.escuderia (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		nombre NVARCHAR(255),
		id_nacionalidad INT REFERENCES TP.pais -- FK
	);

	CREATE TABLE TP.auto (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_escuderia INT REFERENCES TP.escuderia, -- FK
		id_piloto INT REFERENCES TP.piloto, -- FK
		numero_auto INT,
		modelo NVARCHAR(255)
	);

	CREATE TABLE TP.circuito (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_pais INT REFERENCES TP.pais, -- FK
		codigo INT,
		nombre NVARCHAR(255)
	);

	CREATE TABLE TP.sector (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_circuito INT REFERENCES TP.circuito, -- FK
		id_tipo_sector INT REFERENCES TP.tipo_sector, -- FK
		distancia DECIMAL(18,2),
		codigo INT
	);

	CREATE TABLE TP.carrera (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_circuito INT REFERENCES TP.circuito, -- FK
		cant_vueltas INT,
		fecha DATE,
		codigo INT,
		clima NVARCHAR(100),
		total_carrera DECIMAL(18,2)
	);

	CREATE TABLE TP.incidente (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_carrera INT REFERENCES TP.carrera, -- FK
		id_sector INT REFERENCES TP.sector, -- FK
		id_bandera INT REFERENCES TP.bandera, -- FK
		tiempo DECIMAL(18,2),
	);

	CREATE TABLE TP.incidente_auto (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_incidente INT REFERENCES TP.incidente, -- FK
		id_auto INT REFERENCES TP.auto, -- FK
		id_tipo_incidente INT REFERENCES TP.tipo_incidente, -- FK
		numero_vuelta DECIMAL(18,0)
	);

	CREATE TABLE TP.motor (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_auto INT REFERENCES TP.auto, -- FK
		modelo NVARCHAR(255),
		numero_serie NVARCHAR(255)
	);

	CREATE TABLE TP.caja_de_cambios (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_auto INT REFERENCES TP.auto, -- FK
		modelo NVARCHAR(50),
		numero_serie NVARCHAR(255)
	);

	CREATE TABLE TP.freno (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_auto INT REFERENCES TP.auto, -- FK
		id_posicion INT REFERENCES TP.posicion, -- FK
		numero_serie NVARCHAR(255),
		tamanio_disco DECIMAL(18,2)
	);

	CREATE TABLE TP.neumatico (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_auto INT REFERENCES TP.auto, -- FK
		id_tipo_neumatico INT REFERENCES TP.tipo_neumatico, -- FK
		id_posicion INT REFERENCES TP.posicion, -- FK
		numero_serie NVARCHAR(255)
	);

	CREATE TABLE TP.parada_box (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_carrera INT REFERENCES TP.carrera, -- FK
		id_auto INT REFERENCES TP.auto, -- FK
		numero_vuelta DECIMAL(18,0),
		tiempo_parada DECIMAL(18,2)
	);

	CREATE TABLE TP.cambio_neumaticos (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_parada_box INT REFERENCES TP.parada_box, -- FK
		id_neumatico_anterior INT REFERENCES TP.neumatico, -- FK
		id_neumatico_nuevo INT REFERENCES TP.neumatico, -- FK
	);

	CREATE TABLE TP.medicion (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_auto INT REFERENCES TP.auto, -- FK
		id_carrera INT REFERENCES TP.carrera, -- FK
		id_sector INT REFERENCES TP.sector, -- FK
		codigo_medicion DECIMAL(18,0),
		nro_vuelta DECIMAL(18,0),
		distancia_carrera DECIMAL(18,6),
		distancia_vuelta DECIMAL(18,2),
		tiempo_vuelta DECIMAL(18,10),
		posicion DECIMAL(18,0),
		velocidad DECIMAL(18,2),
		cant_combustible DECIMAL(18,2)
	);

	CREATE TABLE TP.estado_de_motor (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_medicion INT REFERENCES TP.medicion, -- FK
		id_motor INT REFERENCES TP.motor, -- FK
		potencia DECIMAL(18,6),
		temperatura_aceite DECIMAL(18,6),
		temperatura_agua DECIMAL(18,6),
		rpm DECIMAL(18,6)
	);

	CREATE TABLE TP.estado_de_caja_de_cambios (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_medicion INT REFERENCES TP.medicion, -- FK
		id_caja_de_cambios INT REFERENCES TP.caja_de_cambios, -- FK
		temperatura_aceite DECIMAL(18,2),
		rpm DECIMAL(18,2),
		desgaste DECIMAL(18,2)
	);

	CREATE TABLE TP.estado_freno (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_medicion INT REFERENCES TP.medicion, -- FK
		id_freno INT REFERENCES TP.freno, -- FK
		grosor_pastilla DECIMAL(18,2),
		temperatura DECIMAL(18,2)
	);

	CREATE TABLE TP.estado_neumatico (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_medicion INT REFERENCES TP.medicion, -- FK
		id_neumatico INT REFERENCES TP.neumatico, -- FK
		profundidad DECIMAL(18,6),
		presion DECIMAL(18,6),
		temperatura DECIMAL(18,6)
	);
GO

-- Store procedure para migrar tipo_neumatico
CREATE PROCEDURE TP.migrar_tipo_neumatico
AS
	BEGIN 	
		INSERT INTO TP.tipo_neumatico
		SELECT DISTINCT NEUMATICO1_TIPO_VIEJO from GD1C2022.gd_esquema.Maestra
		WHERE NEUMATICO1_TIPO_VIEJO is not null 
	END
GO

-- Store procedure para migrar tipo_incidente
CREATE PROCEDURE TP.migrar_tipo_incidente
AS
	BEGIN
		INSERT INTO TP.tipo_incidente 
		SELECT DISTINCT INCIDENTE_TIPO FROM GD1C2022.gd_esquema.Maestra
		WHERE INCIDENTE_TIPO IS NOT NULL
	END
GO

-- Store procedure para migrar tipo_sector
CREATE PROCEDURE TP.migrar_tipo_sector
AS
	BEGIN
		INSERT INTO TP.tipo_sector
		SELECT DISTINCT SECTO_TIPO FROM GD1C2022.gd_esquema.Maestra
		WHERE SECTO_TIPO IS NOT NULL
	END
GO

-- Store procedure para migrar bandera
CREATE PROCEDURE TP.migrar_bandera
AS
	BEGIN
		INSERT INTO TP.bandera 
		SELECT DISTINCT INCIDENTE_BANDERA FROM GD1C2022.gd_esquema.Maestra
		WHERE INCIDENTE_BANDERA IS NOT NULL
	END
GO

-- Store procedure para migrar posicion
CREATE PROCEDURE TP.migrar_posiciones
AS
	BEGIN 	
		INSERT INTO TP.posicion
		SELECT DISTINCT TELE_FRENO1_POSICION from GD1C2022.gd_esquema.Maestra
		where TELE_FRENO1_POSICION is not null

		INSERT INTO TP.posicion
		SELECT DISTINCT TELE_FRENO2_POSICION from GD1C2022.gd_esquema.Maestra
		where TELE_FRENO2_POSICION is not null

		INSERT INTO TP.posicion
		SELECT DISTINCT TELE_FRENO3_POSICION from GD1C2022.gd_esquema.Maestra
		where TELE_FRENO3_POSICION is not null

		INSERT INTO TP.posicion
		SELECT DISTINCT TELE_FRENO4_POSICION from GD1C2022.gd_esquema.Maestra
		where TELE_FRENO4_POSICION is not null	
	END
GO

-- Store procedure para migrar pais
CREATE PROCEDURE TP.migrar_pais
AS
	BEGIN
		INSERT INTO TP.pais
		SELECT DISTINCT upper(ESCUDERIA_NACIONALIDAD) FROM GD1C2022.gd_esquema.Maestra
		WHERE ESCUDERIA_NACIONALIDAD IS NOT NULL

		INSERT INTO TP.pais
		SELECT DISTINCT PILOTO_NACIONALIDAD FROM GD1C2022.gd_esquema.Maestra
		WHERE PILOTO_NACIONALIDAD IS NOT NULL 
		AND PILOTO_NACIONALIDAD NOT IN (SELECT nombre FROM TP.pais)

		INSERT INTO TP.pais
		SELECT DISTINCT CIRCUITO_PAIS FROM GD1C2022.gd_esquema.Maestra
		WHERE CIRCUITO_PAIS IS NOT NULL 
		AND CIRCUITO_PAIS NOT IN (SELECT nombre FROM TP.pais)
	END
GO

-- Store procedure para migrar piloto
CREATE PROCEDURE TP.migrar_piloto
AS
	BEGIN
		INSERT INTO TP.piloto
		SELECT DISTINCT pais.id, PILOTO_NOMBRE, PILOTO_APELLIDO, PILOTO_FECHA_NACIMIENTO
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.pais ON PILOTO_NACIONALIDAD = pais.nombre
		WHERE PILOTO_NOMBRE IS NOT NULL
		ORDER BY PILOTO_APELLIDO, PILOTO_NOMBRE
	END
GO

-- Store procedure para migrar escuderia
CREATE PROCEDURE TP.migrar_escuderia
AS
	BEGIN
		INSERT INTO TP.escuderia
		SELECT DISTINCT ESCUDERIA_NOMBRE, pais.id FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.pais ON upper(ESCUDERIA_NACIONALIDAD) = pais.nombre
		WHERE ESCUDERIA_NOMBRE IS NOT NULL
		ORDER BY ESCUDERIA_NOMBRE
	END
GO

-- Store procedure para migrar auto
CREATE PROCEDURE TP.migrar_auto
AS
	BEGIN
		INSERT INTO TP.auto
		SELECT DISTINCT escuderia.id, piloto.id, AUTO_NUMERO, AUTO_MODELO
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.escuderia ON ESCUDERIA_NOMBRE = escuderia.nombre
		JOIN TP.piloto ON PILOTO_NOMBRE = piloto.nombre AND PILOTO_APELLIDO = piloto.apellido
		WHERE PILOTO_NOMBRE IS NOT NULL
		ORDER BY piloto.id, AUTO_NUMERO
	END
GO

-- Store procedure para migrar circuito
CREATE PROCEDURE TP.migrar_circuito
AS
	BEGIN
		INSERT INTO TP.circuito
		SELECT DISTINCT pais.id, CIRCUITO_CODIGO, CIRCUITO_NOMBRE FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.pais ON CIRCUITO_PAIS = pais.nombre
		ORDER BY CIRCUITO_CODIGO
	END
GO

-- Store procedure para migrar sector
CREATE PROCEDURE TP.migrar_sector
AS
	BEGIN
		INSERT INTO TP.sector
		SELECT DISTINCT circuito.id, tipo_sector.id, SECTOR_DISTANCIA, CODIGO_SECTOR
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.circuito ON CIRCUITO_CODIGO = circuito.codigo
		JOIN TP.tipo_sector ON SECTO_TIPO = tipo_sector.tipo
		ORDER BY CODIGO_SECTOR
	END
GO

-- Store procedure para migrar carrera
CREATE PROCEDURE TP.migrar_carrera
AS
	BEGIN
		INSERT INTO TP.carrera
		SELECT DISTINCT circuito.id, CARRERA_CANT_VUELTAS, CARRERA_FECHA, CODIGO_CARRERA, CARRERA_CLIMA, 
		CARRERA_TOTAL_CARRERA FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.circuito ON CIRCUITO_CODIGO = circuito.codigo
		ORDER BY CODIGO_CARRERA
	END
GO

-- Store procedure para migrar incidente
CREATE PROCEDURE TP.migrar_incidente
AS
	BEGIN
		INSERT INTO TP.incidente
		SELECT DISTINCT carrera.id, sector.id, bandera.id, INCIDENTE_TIEMPO FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.carrera ON CODIGO_CARRERA = carrera.codigo
		JOIN TP.sector ON CODIGO_SECTOR = sector.codigo
		JOIN TP.bandera ON INCIDENTE_BANDERA = bandera.color
		WHERE INCIDENTE_TIEMPO IS NOT NULL
		ORDER BY carrera.id, INCIDENTE_TIEMPO
	END
GO

-- Store procedure para migrar incidente_auto
CREATE PROCEDURE TP.migrar_incidente_auto
AS
	BEGIN
		INSERT INTO TP.incidente_auto
		SELECT DISTINCT incidente.id, auto.id, tipo_incidente.id, INCIDENTE_NUMERO_VUELTA
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.carrera ON CODIGO_CARRERA = carrera.codigo
		JOIN TP.incidente ON carrera.id = incidente.id_carrera 
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.tipo_incidente ON INCIDENTE_TIPO = tipo_incidente.tipo
		WHERE INCIDENTE_TIEMPO IS NOT NULL AND INCIDENTE_TIEMPO = incidente.tiempo
		ORDER BY incidente.id
	END
GO

-- Store procedure para migrar motor
CREATE PROCEDURE TP.migrar_motores
AS
	BEGIN 	
		INSERT INTO TP.motor
		SELECT DISTINCT auto.id, TELE_MOTOR_MODELO, TELE_MOTOR_NRO_SERIE from GD1C2022.gd_esquema.Maestra
		JOIN TP.piloto ON PILOTO_NOMBRE = piloto.nombre AND PILOTO_APELLIDO = piloto.apellido
		JOIN TP.auto ON piloto.id = auto.id_piloto
		where TELE_MOTOR_NRO_SERIE is not null
		order by TELE_MOTOR_NRO_SERIE
	END
GO

-- Store procedure para migrar caja_de_cambios
CREATE PROCEDURE TP.migrar_caja_de_cambios
AS
	BEGIN
		INSERT INTO TP.caja_de_cambios
		Select DISTINCT auto.id, TELE_CAJA_MODELO, TELE_CAJA_NRO_SERIE from GD1C2022.gd_esquema.Maestra
		JOIN TP.piloto ON PILOTO_NOMBRE = piloto.nombre AND PILOTO_APELLIDO = piloto.apellido
		JOIN TP.auto ON piloto.id = auto.id_piloto
		where TELE_CAJA_NRO_SERIE is not null
		order by TELE_CAJA_NRO_SERIE
	END
GO

-- Store procedure para migrar freno
CREATE PROCEDURE TP.migrar_frenos
AS
	BEGIN 	
		INSERT INTO TP.freno
		SELECT DISTINCT auto.id, posicion.id, TELE_FRENO1_NRO_SERIE, TELE_FRENO1_TAMANIO_DISCO 
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.posicion ON TELE_FRENO1_POSICION = posicion.descripcion
		where TELE_FRENO1_NRO_SERIE is not null
		order by TELE_FRENO1_NRO_SERIE

		INSERT INTO TP.freno
		SELECT DISTINCT auto.id, posicion.id, TELE_FRENO2_NRO_SERIE, TELE_FRENO1_TAMANIO_DISCO
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.posicion ON TELE_FRENO2_POSICION = posicion.descripcion
		where TELE_FRENO2_NRO_SERIE is not null
		order by TELE_FRENO2_NRO_SERIE

		INSERT INTO TP.freno
		SELECT DISTINCT auto.id, posicion.id, TELE_FRENO3_NRO_SERIE, TELE_FRENO1_TAMANIO_DISCO
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.posicion ON TELE_FRENO3_POSICION = posicion.descripcion
		where TELE_FRENO3_NRO_SERIE is not null
		order by TELE_FRENO3_NRO_SERIE

		INSERT INTO TP.freno
		SELECT DISTINCT auto.id, posicion.id, TELE_FRENO4_NRO_SERIE, TELE_FRENO1_TAMANIO_DISCO
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.posicion ON TELE_FRENO4_POSICION = posicion.descripcion
		where TELE_FRENO4_NRO_SERIE is not null
		order by TELE_FRENO4_NRO_SERIE
	END
GO

-- Store procedure para migrar neumatico
CREATE PROCEDURE TP.migrar_neumaticos
AS
	BEGIN 	
		INSERT INTO TP.neumatico
		SELECT DISTINCT auto.id, tipo_neumatico.id, posicion.id, TELE_NEUMATICO1_NRO_SERIE
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.tipo_neumatico ON NEUMATICO1_TIPO_VIEJO = tipo_neumatico.tipo
		JOIN TP.posicion ON TELE_NEUMATICO1_POSICION = posicion.descripcion
		where TELE_NEUMATICO1_NRO_SERIE is not null
		order by TELE_NEUMATICO1_NRO_SERIE

		INSERT INTO TP.neumatico
		SELECT DISTINCT auto.id, tipo_neumatico.id, posicion.id, TELE_NEUMATICO2_NRO_SERIE
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.tipo_neumatico ON NEUMATICO2_TIPO_VIEJO = tipo_neumatico.tipo
		JOIN TP.posicion ON TELE_NEUMATICO2_POSICION = posicion.descripcion
		where TELE_NEUMATICO2_NRO_SERIE is not null
		order by TELE_NEUMATICO2_NRO_SERIE

		INSERT INTO TP.neumatico
		SELECT DISTINCT auto.id, tipo_neumatico.id, posicion.id, TELE_NEUMATICO3_NRO_SERIE
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.tipo_neumatico ON NEUMATICO3_TIPO_VIEJO = tipo_neumatico.tipo
		JOIN TP.posicion ON TELE_NEUMATICO3_POSICION = posicion.descripcion
		where TELE_NEUMATICO3_NRO_SERIE is not null
		order by TELE_NEUMATICO3_NRO_SERIE

		INSERT INTO TP.neumatico
		SELECT DISTINCT auto.id, tipo_neumatico.id, posicion.id, TELE_NEUMATICO4_NRO_SERIE
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.tipo_neumatico ON NEUMATICO4_TIPO_VIEJO = tipo_neumatico.tipo
		JOIN TP.posicion ON TELE_NEUMATICO4_POSICION = posicion.descripcion
		where TELE_NEUMATICO4_NRO_SERIE is not null
		order by TELE_NEUMATICO4_NRO_SERIE
	END
GO

-- Store procedure para migrar parada_box
CREATE PROCEDURE TP.migrar_parada_box
AS
	BEGIN
		INSERT INTO TP.parada_box
		SELECT DISTINCT carrera.id, auto.id, PARADA_BOX_VUELTA, PARADA_BOX_TIEMPO
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.carrera ON CODIGO_CARRERA = carrera.codigo
		JOIN TP.escuderia ON ESCUDERIA_NOMBRE = escuderia.nombre
		JOIN TP.auto ON AUTO_NUMERO = auto.numero_auto and auto.id_escuderia = escuderia.id
		where PARADA_BOX_TIEMPO is not null
		ORDER BY carrera.id, auto.id, PARADA_BOX_VUELTA
	END
GO

-- Store procedure para migrar cambio_neumaticos
CREATE PROCEDURE TP.migrar_cambio_neumaticos
AS
	BEGIN
		INSERT INTO TP.cambio_neumaticos
		SELECT distinct parada_box.id, neumatico_viejo.id, neumatico_nuevo.id
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.neumatico neumatico_viejo ON NEUMATICO1_NRO_SERIE_VIEJO = neumatico_viejo.numero_serie
		JOIN TP.neumatico neumatico_nuevo ON NEUMATICO1_NRO_SERIE_NUEVO = neumatico_nuevo.numero_serie
		JOIN TP.carrera ON CODIGO_CARRERA = carrera.codigo
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.parada_box ON carrera.id = parada_box.id_carrera
		AND auto.id = parada_box.id_auto
		AND PARADA_BOX_VUELTA = parada_box.numero_vuelta
		order by parada_box.id

		INSERT INTO TP.cambio_neumaticos
		SELECT distinct parada_box.id, neumatico_viejo.id, neumatico_nuevo.id
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.neumatico neumatico_viejo ON NEUMATICO2_NRO_SERIE_VIEJO = neumatico_viejo.numero_serie
		JOIN TP.neumatico neumatico_nuevo ON NEUMATICO2_NRO_SERIE_NUEVO = neumatico_nuevo.numero_serie
		JOIN TP.carrera ON CODIGO_CARRERA = carrera.codigo
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.parada_box ON carrera.id = parada_box.id_carrera
		AND auto.id = parada_box.id_auto
		AND PARADA_BOX_VUELTA = parada_box.numero_vuelta
		order by parada_box.id

		INSERT INTO TP.cambio_neumaticos
		SELECT distinct parada_box.id, neumatico_viejo.id, neumatico_nuevo.id
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.neumatico neumatico_viejo ON NEUMATICO3_NRO_SERIE_VIEJO = neumatico_viejo.numero_serie
		JOIN TP.neumatico neumatico_nuevo ON NEUMATICO3_NRO_SERIE_NUEVO = neumatico_nuevo.numero_serie
		JOIN TP.carrera ON CODIGO_CARRERA = carrera.codigo
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.parada_box ON carrera.id = parada_box.id_carrera
		AND auto.id = parada_box.id_auto
		AND PARADA_BOX_VUELTA = parada_box.numero_vuelta
		order by parada_box.id

		INSERT INTO TP.cambio_neumaticos
		SELECT distinct parada_box.id, neumatico_viejo.id, neumatico_nuevo.id
		FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.neumatico neumatico_viejo ON NEUMATICO4_NRO_SERIE_VIEJO = neumatico_viejo.numero_serie
		JOIN TP.neumatico neumatico_nuevo ON NEUMATICO4_NRO_SERIE_NUEVO = neumatico_nuevo.numero_serie
		JOIN TP.carrera ON CODIGO_CARRERA = carrera.codigo
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.parada_box ON carrera.id = parada_box.id_carrera
		AND auto.id = parada_box.id_auto
		AND PARADA_BOX_VUELTA = parada_box.numero_vuelta
		order by parada_box.id
	END
GO

-- Store procedure para migrar medicion
CREATE PROCEDURE TP.migrar_medicion
AS
	BEGIN
		INSERT INTO TP.medicion
		SELECT DISTINCT auto.id, carrera.id, sector.id, TELE_AUTO_CODIGO, TELE_AUTO_NUMERO_VUELTA, 
		TELE_AUTO_DISTANCIA_CARRERA, TELE_AUTO_DISTANCIA_VUELTA, TELE_AUTO_TIEMPO_VUELTA, 
		TELE_AUTO_POSICION, TELE_AUTO_VELOCIDAD, TELE_AUTO_COMBUSTIBLE FROM GD1C2022.gd_esquema.Maestra
		JOIN TP.auto ON AUTO_MODELO = auto.modelo AND AUTO_NUMERO = auto.numero_auto
		JOIN TP.carrera ON CODIGO_CARRERA = carrera.codigo
		JOIN TP.sector ON CODIGO_SECTOR = sector.codigo
		WHERE TELE_AUTO_CODIGO is not null
		ORDER BY carrera.id, auto.id, TELE_AUTO_CODIGO
	END
GO

-- Store procedure para migrar estado_de_motor
CREATE PROCEDURE TP.migrar_estado_de_motor
AS
	BEGIN 	
		INSERT INTO TP.estado_de_motor
		SELECT DISTINCT medicion.id, motor.id, TELE_MOTOR_POTENCIA, TELE_MOTOR_TEMP_ACEITE,
		TELE_MOTOR_TEMP_AGUA, TELE_MOTOR_RPM from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.motor ON TELE_MOTOR_NRO_SERIE = motor.numero_serie	
		WHERE TELE_AUTO_CODIGO is not null
		ORDER BY medicion.id
  END
GO

-- Store procedure para migrar estado_de_caja_de_cambios
CREATE PROCEDURE TP.migrar_estado_de_caja_de_cambios
AS
	BEGIN 	
		INSERT INTO TP.estado_de_caja_de_cambios
		Select DISTINCT medicion.id, caja_de_cambios.id, TELE_CAJA_TEMP_ACEITE, TELE_CAJA_RPM,
		TELE_CAJA_DESGASTE from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.caja_de_cambios ON TELE_CAJA_NRO_SERIE = caja_de_cambios.numero_serie	
		WHERE TELE_AUTO_CODIGO is not null	
		ORDER BY medicion.id
	END
GO

-- Store procedure para migrar estado_freno
CREATE PROCEDURE TP.migrar_estado_de_freno
AS
	BEGIN
		INSERT INTO TP.estado_freno
		SELECT DISTINCT medicion.id, freno.id, TELE_FRENO1_GROSOR_PASTILLA, TELE_FRENO1_TEMPERATURA
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.freno ON TELE_FRENO1_NRO_SERIE = freno.numero_serie	
		WHERE TELE_AUTO_CODIGO is not null
		order by medicion.id

		INSERT INTO TP.estado_freno
		SELECT DISTINCT medicion.id, freno.id, TELE_FRENO2_GROSOR_PASTILLA, TELE_FRENO2_TEMPERATURA
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.freno ON TELE_FRENO2_NRO_SERIE = freno.numero_serie	
		WHERE TELE_AUTO_CODIGO is not null
		order by medicion.id

		INSERT INTO TP.estado_freno
		SELECT DISTINCT medicion.id, freno.id, TELE_FRENO3_GROSOR_PASTILLA, TELE_FRENO3_TEMPERATURA
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.freno ON TELE_FRENO3_NRO_SERIE = freno.numero_serie	
		WHERE TELE_AUTO_CODIGO is not null
		order by medicion.id

		INSERT INTO TP.estado_freno
		SELECT DISTINCT medicion.id, freno.id, TELE_FRENO4_GROSOR_PASTILLA, TELE_FRENO4_TEMPERATURA
		from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.freno ON TELE_FRENO4_NRO_SERIE = freno.numero_serie	
		WHERE TELE_AUTO_CODIGO is not null
		order by medicion.id
	END
GO

-- Store procedure para migrar estado_neumatico
CREATE PROCEDURE TP.migrar_estado_neumaticos
AS
	BEGIN 	
		INSERT INTO TP.estado_neumatico 
		SELECT DISTINCT medicion.id, neumatico.id, TELE_NEUMATICO1_PROFUNDIDAD, TELE_NEUMATICO1_PRESION,
		TELE_NEUMATICO1_TEMPERATURA from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.neumatico ON TELE_NEUMATICO1_NRO_SERIE = neumatico.numero_serie
		WHERE TELE_AUTO_CODIGO is not null
		order by medicion.id

		INSERT INTO TP.estado_neumatico 
		SELECT DISTINCT medicion.id, neumatico.id, TELE_NEUMATICO2_PROFUNDIDAD, TELE_NEUMATICO2_PRESION,
		TELE_NEUMATICO2_TEMPERATURA from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.neumatico ON TELE_NEUMATICO2_NRO_SERIE = neumatico.numero_serie
		WHERE TELE_AUTO_CODIGO is not null
		order by medicion.id

		INSERT INTO TP.estado_neumatico 
		SELECT DISTINCT medicion.id, neumatico.id, TELE_NEUMATICO3_PROFUNDIDAD, TELE_NEUMATICO3_PRESION,
		TELE_NEUMATICO3_TEMPERATURA from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.neumatico ON TELE_NEUMATICO3_NRO_SERIE = neumatico.numero_serie
		WHERE TELE_AUTO_CODIGO is not null
		order by medicion.id

		INSERT INTO TP.estado_neumatico 
		SELECT DISTINCT medicion.id, neumatico.id, TELE_NEUMATICO4_PROFUNDIDAD, TELE_NEUMATICO4_PRESION,
		TELE_NEUMATICO4_TEMPERATURA from GD1C2022.gd_esquema.Maestra
		JOIN TP.medicion ON TELE_AUTO_CODIGO = medicion.codigo_medicion
		JOIN TP.neumatico ON TELE_NEUMATICO4_NRO_SERIE = neumatico.numero_serie
		WHERE TELE_AUTO_CODIGO is not null
		order by medicion.id
	END
GO

-- Store procedure para iniciar migraciones
CREATE PROCEDURE TP.migrar_tablas
AS
	BEGIN
		EXEC TP.migrar_tipo_neumatico
		EXEC TP.migrar_tipo_incidente
		EXEC TP.migrar_tipo_sector
		EXEC TP.migrar_bandera
		EXEC TP.migrar_posiciones
		EXEC TP.migrar_pais
		EXEC TP.migrar_piloto
		EXEC TP.migrar_escuderia
		EXEC TP.migrar_auto
		EXEC TP.migrar_circuito
		EXEC TP.migrar_sector
		EXEC TP.migrar_carrera
		EXEC TP.migrar_incidente
		EXEC TP.migrar_incidente_auto
		EXEC TP.migrar_motores
		EXEC TP.migrar_caja_de_cambios
		EXEC TP.migrar_frenos
		EXEC TP.migrar_neumaticos
		EXEC TP.migrar_parada_box
		EXEC TP.migrar_cambio_neumaticos
		EXEC TP.migrar_medicion
		EXEC TP.migrar_estado_de_motor
		EXEC TP.migrar_estado_de_caja_de_cambios
		EXEC TP.migrar_estado_de_freno
		EXEC TP.migrar_estado_neumaticos
	END
GO

---------------
-- EJECUCION --
---------------

EXEC TP.migrar_tablas

DROP PROCEDURE TP.migrar_tablas