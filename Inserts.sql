USE BDTransferMarket;

SET FOREIGN_KEY_CHECKS = 0;

-- Limpieza completa
DELETE FROM Transferencias;
DELETE FROM Contratos;
DELETE FROM Jugadores;
DELETE FROM Equipos;
DELETE FROM Ligas;
DELETE FROM Asociaciones;
DELETE FROM Agentes;

SET FOREIGN_KEY_CHECKS = 1;

-- ======================
-- ASOCIACIONES
-- ======================
INSERT INTO Asociaciones (nombre_asociacion, continente_abarca)
VALUES
('UEFA', 'Europa'),
('CONMEBOL', 'Sudamérica'),
('AFC', 'Asia'),
('CAF', 'África'),
('CONCACAF', 'Norteamérica y Centroamérica');

-- ======================
-- LIGAS
-- ======================
INSERT INTO Ligas (nombre_liga, pais, division, nombre_asociacion)
VALUES
('Premier League', 'Inglaterra', 'Primera División', 'UEFA'),
('La Liga', 'España', 'Primera División', 'UEFA'),
('Liga Argentina', 'Argentina', 'Primera División', 'CONMEBOL');

-- ======================
-- EQUIPOS
-- ======================
-- PREMIER LEAGUE
INSERT INTO Equipos (nombre_equipo, nombre_estadio, anio_fundacion, nombre_liga)
VALUES
('Manchester City', 'Etihad Stadium', '1880-01-01', 'Premier League'),
('Arsenal', 'Emirates Stadium', '1886-01-01', 'Premier League'),
('Liverpool', 'Anfield', '1892-01-01', 'Premier League'),
('Aston Villa', 'Villa Park', '1874-01-01', 'Premier League'),
('Tottenham Hotspur', 'Tottenham Hotspur Stadium', '1882-01-01', 'Premier League'),
('Manchester United', 'Old Trafford', '1878-01-01', 'Premier League'),
('Newcastle United', 'St James Park', '1892-01-01', 'Premier League'),
('Chelsea', 'Stamford Bridge', '1905-01-01', 'Premier League'),
('Brighton and Hove Albion', 'Amex Stadium', '1901-01-01', 'Premier League'),
('West Ham United', 'London Stadium', '1895-01-01', 'Premier League');

-- LA LIGA
INSERT INTO Equipos (nombre_equipo, nombre_estadio, anio_fundacion, nombre_liga)
VALUES
('Real Madrid', 'Santiago Bernabéu', '1902-01-01', 'La Liga'),
('FC Barcelona', 'Spotify Camp Nou', '1899-01-01', 'La Liga'),
('Atlético de Madrid', 'Cívitas Metropolitano', '1903-01-01', 'La Liga'),
('Real Sociedad', 'Reale Arena', '1909-01-01', 'La Liga'),
('Athletic Club', 'San Mamés', '1898-01-01', 'La Liga'),
('Villarreal', 'Estadio de la Cerámica', '1923-01-01', 'La Liga'),
('Betis', 'Benito Villamarín', '1907-01-01', 'La Liga'),
('Sevilla', 'Ramón Sánchez-Pizjuán', '1905-01-01', 'La Liga');

-- LIGA ARGENTINA
INSERT INTO Equipos (nombre_equipo, nombre_estadio, anio_fundacion, nombre_liga)
VALUES
('River Plate', 'Monumental', '1901-01-01', 'Liga Argentina'),
('Boca Juniors', 'La Bombonera', '1905-01-01', 'Liga Argentina'),
('Racing Club', 'Presidente Perón', '1903-01-01', 'Liga Argentina'),
('Talleres (Córdoba)', 'Mario Kempes', '1913-01-01', 'Liga Argentina'),
('San Lorenzo', 'Nuevo Gasómetro', '1908-01-01', 'Liga Argentina'),
('Vélez Sarsfield', 'José Amalfitani', '1910-01-01', 'Liga Argentina'),
('Independiente', 'Libertadores de América', '1904-01-01', 'Liga Argentina'),
('Gimnasia La Plata', 'Juan Carmelo Zerillo', '1887-01-01', 'Liga Argentina');

-- ======================
-- JUGADORES
-- ======================
-- PREMIER LEAGUE
INSERT INTO Jugadores (dni_jugador, nacimiento, valor_jugador, estado_jugador, nombre_jugador, apellido_jugador, posicion_jugador, interes_jugador, sueldo_por_mes, nacionalidad, nombre_equipo)
VALUES
(20000001, '2000-07-21', 180000000, 'Activo', 'Erling', 'Haaland', 'Delantero Centro', 'Real Madrid', 1500000, 'Noruega', 'Manchester City'),
(20000002, '1991-06-28', 80000000, 'Activo', 'Kevin', 'De Bruyne', 'Mediocampista Ofensivo', 'Bayern Munich', 1200000, 'Bélgica', 'Manchester City'),
(20000003, '1998-09-05', 120000000, 'Activo', 'Bukayo', 'Saka', 'Extremo Derecho', 'Liverpool', 900000, 'Inglaterra', 'Arsenal'),
(20000004, '1998-12-17', 100000000, 'Activo', 'Martin', 'Odegaard', 'Mediocampista', 'Barcelona', 950000, 'Noruega', 'Arsenal'),
(20000005, '1992-06-15', 70000000, 'Activo', 'Mohamed', 'Salah', 'Extremo Derecho', 'Al Ittihad', 1300000, 'Egipto', 'Liverpool'),
(20000006, '1991-07-08', 55000000, 'Activo', 'Virgil', 'van Dijk', 'Defensa Central', 'Bayern Munich', 1000000, 'Países Bajos', 'Liverpool'),
(20000007, '1995-12-30', 60000000, 'Activo', 'Ollie', 'Watkins', 'Delantero Centro', 'Chelsea', 850000, 'Inglaterra', 'Aston Villa'),
(20000008, '1992-07-08', 70000000, 'Activo', 'Heung-min', 'Son', 'Extremo Izquierdo', 'PSG', 1100000, 'Corea del Sur', 'Tottenham Hotspur'),
(20000009, '1994-09-08', 80000000, 'Activo', 'Bruno', 'Fernandes', 'Mediocampista', 'Barcelona', 950000, 'Portugal', 'Manchester United'),
(20000010, '1999-09-21', 75000000, 'Activo', 'Alexander', 'Isak', 'Delantero Centro', 'Real Madrid', 870000, 'Suecia', 'Newcastle United');

-- LA LIGA
INSERT INTO Jugadores (dni_jugador, nacimiento, valor_jugador, estado_jugador, nombre_jugador, apellido_jugador, posicion_jugador, interes_jugador, sueldo_por_mes, nacionalidad, nombre_equipo)
VALUES
(20000011, '2000-07-12', 150000000, 'Activo', 'Vinicius', 'Junior', 'Extremo Izquierdo', 'PSG', 1400000, 'Brasil', 'Real Madrid'),
(20000012, '2003-06-29', 130000000, 'Activo', 'Jude', 'Bellingham', 'Mediocampista', 'Manchester City', 1300000, 'Inglaterra', 'Real Madrid'),
(20000013, '1988-08-21', 45000000, 'Activo', 'Robert', 'Lewandowski', 'Delantero Centro', 'Chelsea', 1200000, 'Polonia', 'FC Barcelona'),
(20000014, '2004-08-05', 90000000, 'Activo', 'Pablo', 'Gavi', 'Mediocampista', 'Liverpool', 800000, 'España', 'FC Barcelona'),
(20000015, '1991-03-21', 35000000, 'Activo', 'Antoine', 'Griezmann', 'Delantero Centro', 'PSG', 950000, 'Francia', 'Atlético de Madrid'),
(20000016, '1997-04-21', 50000000, 'Activo', 'Mikel', 'Oyarzabal', 'Extremo Izquierdo', 'Manchester United', 850000, 'España', 'Real Sociedad'),
(20000017, '1994-06-15', 45000000, 'Activo', 'Iñaki', 'Williams', 'Delantero Centro', 'Tottenham', 870000, 'Ghana', 'Athletic Club'),
(20000018, '1992-04-19', 25000000, 'Activo', 'Gerard', 'Moreno', 'Delantero Centro', 'Roma', 820000, 'España', 'Villarreal'),
(20000019, '1993-07-18', 20000000, 'Activo', 'Nabil', 'Fekir', 'Mediocampista', 'PSG', 870000, 'Francia', 'Betis'),
(20000020, '1997-06-01', 30000000, 'Activo', 'Youssef', 'En-Nesyri', 'Delantero Centro', 'West Ham', 780000, 'Marruecos', 'Sevilla');

-- LIGA ARGENTINA
INSERT INTO Jugadores (dni_jugador, nacimiento, valor_jugador, estado_jugador, nombre_jugador, apellido_jugador, posicion_jugador, interes_jugador, sueldo_por_mes, nacionalidad, nombre_equipo)
VALUES
(20000021, '1986-10-16', 2000000, 'Activo', 'Franco', 'Armani', 'Arquero', 'Flamengo', 300000, 'Argentina', 'River Plate'),
(20000022, '1993-01-26', 5000000, 'Activo', 'Miguel', 'Borja', 'Delantero Centro', 'Palmeiras', 400000, 'Colombia', 'River Plate'),
(20000023, '1987-02-22', 1500000, 'Activo', 'Sergio', 'Romero', 'Arquero', 'Manchester United', 350000, 'Argentina', 'Boca Juniors'),
(20000024, '1987-02-14', 3000000, 'Activo', 'Edinson', 'Cavani', 'Delantero Centro', 'Napoli', 600000, 'Uruguay', 'Boca Juniors'),
(20000025, '1987-09-13', 2000000, 'Activo', 'Gabriel', 'Arias', 'Arquero', 'Inter Miami', 350000, 'Chile', 'Racing Club'),
(20000026, '1990-01-31', 1500000, 'Activo', 'Rubén', 'Botta', 'Mediocampista', 'San Lorenzo', 250000, 'Argentina', 'Talleres (Córdoba)'),
(20000027, '1998-10-02', 2500000, 'Activo', 'Nahuel', 'Barrios', 'Mediocampista', 'Boca Juniors', 260000, 'Argentina', 'San Lorenzo'),
(20000028, '1988-06-04', 1000000, 'Activo', 'Lucas', 'Pratto', 'Delantero Centro', 'Racing Club', 270000, 'Argentina', 'Vélez Sarsfield'),
(20000029, '1994-03-21', 2000000, 'Activo', 'Leandro', 'Fernández', 'Mediocampista', 'Newell\'s', 230000, 'Argentina', 'Independiente'),
(20000030, '1995-11-03', 1800000, 'Activo', 'Eric', 'Ramírez', 'Delantero Centro', 'Godoy Cruz', 250000, 'Argentina', 'Gimnasia La Plata');

-- ======================
-- AGENTES
-- ======================
INSERT INTO Agentes (dni_agente, nombre_agente, apellido_agente, nacimiento_agente, comision_por_mes)
VALUES
(11111111, 'Jorge', 'Mendes', '1966-01-07', '10%'),
(22222222, 'Mino', 'Raiola', '1967-11-04', '12%'),
(33333333, 'Jonathan', 'Barnett', '1950-07-01', '8%'),
(44444444, 'Fernando', 'Hidalgo', '1970-03-12', '7%'),
(55555555, 'Gustavo', 'Mascardi', '1960-09-02', '6%'),
(66666666, 'Pablo', 'Boselli', '1985-05-05', '9%');

-- ======================
-- CONTRATOS
-- ======================
INSERT INTO Contratos (id_contrato, duracion, clausula, plata_por_mes, tipo_contrato, dni_agente)
VALUES
(1, '5 años', '200M €', 2000000, 'Profesional', 11111111),
(2, '6 años', '500M €', 1800000, 'Profesional', 22222222),
(3, '4 años', '150M €', 1500000, 'Profesional', 33333333),
(4, '5 años', '400M €', 1400000, 'Profesional', 44444444),
(5, '3 años', '10M €', 40000, 'Profesional', 55555555),
(6, '2 años', '5M €', 60000, 'Profesional', 66666666);

-- ======================
-- TRANSFERENCIAS
-- ======================
INSERT INTO Transferencias (equipo_proviene, equipo_transferido, monto_transferencia, fecha, dni_jugador, id_contrato)
VALUES
('Borussia Dortmund', 'Manchester City', 60000000, '2022-07-01', 20000001, 1), -- Haaland
('Chelsea', 'Real Madrid', 100000000, '2023-07-10', 20000012, 2), -- Bellingham
('Benfica', 'Liverpool', 75000000, '2022-07-15', 20000005, 3), -- Salah
('Valencia', 'FC Barcelona', 50000000, '2021-07-01', 20000013, 4), -- Lewandowski
('Junior', 'River Plate', 7000000, '2022-07-01', 20000022, 5), -- Borja
('Valencia', 'Boca Juniors', 5000000, '2023-07-15', 20000024, 6); -- Cavani


