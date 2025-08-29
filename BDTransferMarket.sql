-- ======================
-- TABLA: Asociaciones
-- ======================
CREATE TABLE Asociaciones (
    nombre_asociacion VARCHAR(70) PRIMARY KEY,
    continente_abarca VARCHAR(70) NOT NULL
);

-- ======================
-- TABLA: Ligas
-- ======================
CREATE TABLE Ligas (
    nombre_liga VARCHAR(70) PRIMARY KEY,
    pais VARCHAR(70) NOT NULL,
    division VARCHAR(50) NOT NULL,
    nombre_asociacion VARCHAR(70) NOT NULL,
    FOREIGN KEY (nombre_asociacion) REFERENCES Asociaciones(nombre_asociacion)
);

-- ======================
-- TABLA: Equipos
-- ======================
CREATE TABLE Equipos (
    nombre_equipo VARCHAR(50) PRIMARY KEY,
    nombre_estadio VARCHAR(60),
    anio_fundacion DATE, 
    nombre_liga VARCHAR(70) NOT NULL,
    FOREIGN KEY (nombre_liga) REFERENCES Ligas(nombre_liga)
);

-- ======================
-- TABLA: Jugadores
-- ======================
CREATE TABLE Jugadores (
    dni_jugador INT(8) PRIMARY KEY,
    nacimiento DATE NOT NULL,
    valor_jugador INT(12),
    estado_jugador VARCHAR(40),
    nombre_jugador VARCHAR(30) NOT NULL,
    apellido_jugador VARCHAR(40) NOT NULL,
    posicion_jugador VARCHAR(40),
    interes_jugador VARCHAR(100),
    sueldo_por_mes INT(12),
    nacionalidad VARCHAR(50),
    nombre_equipo VARCHAR(50),
    FOREIGN KEY (nombre_equipo) REFERENCES Equipos(nombre_equipo)
);

-- ======================
-- TABLA: Agentes
-- ======================
CREATE TABLE Agentes (
    dni_agente INT(8) PRIMARY KEY,
    nombre_agente VARCHAR(30) NOT NULL,
    apellido_agente VARCHAR(30) NOT NULL,
    nacimiento_agente DATE NOT NULL,
    comision_por_mes VARCHAR(4)
);

-- ======================
-- TABLA: Contratos
-- ======================
CREATE TABLE Contratos (
    id_contrato INT(5) PRIMARY KEY,
    duracion VARCHAR(30),
    clausula VARCHAR(50),
    plata_por_mes INT(12),
    tipo_contrato VARCHAR(30),
    dni_agente INT(8),
    FOREIGN KEY (dni_agente) REFERENCES Agentes(dni_agente)
);

-- ======================
-- TABLA: Transferencias
-- ======================
CREATE TABLE Transferencias (
    equipo_proviene VARCHAR(40) NOT NULL,
    equipo_transferido VARCHAR(40) NOT NULL,
    monto_transferencia INT(12),
    fecha DATE NOT NULL,
    dni_jugador INT(8) NOT NULL,
    id_contrato INT(5) NOT NULL,
    FOREIGN KEY (id_contrato) REFERENCES Contratos(id_contrato),
    FOREIGN KEY (dni_jugador) REFERENCES Jugadores(dni_jugador)
);
