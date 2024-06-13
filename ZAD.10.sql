/*CREATE DATABASE DRZEWO;

USE DRZEWO; 

CREATE TABLE GeoTabela (
    id_pietro INT PRIMARY KEY,
    nazwa_pietro VARCHAR(255),
    id_epoka INT,
    nazwa_epoka VARCHAR(255),
    id_okres INT,
    nazwa_okres VARCHAR(255),
    id_era INT,
    nazwa_era VARCHAR(255),
    id_eon INT,
    nazwa_eon VARCHAR(255),
    wiek_mln_lat DECIMAL(6,3)
);

INSERT INTO GeoTabela (id_pietro, nazwa_pietro, id_epoka, nazwa_epoka, id_okres, nazwa_okres, id_era, nazwa_era, id_eon, nazwa_eon, wiek_mln_lat) VALUES
(1, 'Halocen', 1, 'Czwartorzêd', 1, 'Kenozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 0.010),
(2, 'Plejstocen', 1, 'Czwartorzêd', 1, 'Kenozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 1.800),
(3, 'Pliocen', 2, 'Neogen', 2, 'Trzeciorzêd', 1, 'Kenozoik', 1, 'Fanerozoik', 22.500),
(4, 'Miocen', 2, 'Neogen', 2, 'Trzeciorzêd', 1, 'Kenozoik', 1, 'Fanerozoik', 22.500),
(5, 'Oligocen', 3, 'Paleogen', 2, 'Trzeciorzêd', 1, 'Kenozoik', 1, 'Fanerozoik', 65.000),
(6, 'Eocen', 3, 'Paleogen', 2, 'Trzeciorzêd', 1, 'Kenozoik', 1, 'Fanerozoik', 65.000),
(7, 'Paleocen', 3, 'Paleogen', 2, 'Trzeciorzêd', 1, 'Kenozoik', 1, 'Fanerozoik', 65.000),
(8, 'Kreda Górna', 4, 'Kreda', 3, 'Mezozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 140.000),
(9, 'Kreda Dolna', 4, 'Kreda', 3, 'Mezozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 140.000),
(10, 'Jura Górna', 5, 'Jura', 3, 'Mezozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 195.000),
(11, 'Jura Œrodkowa', 5, 'Jura', 3, 'Mezozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 195.000),
(12, 'Jura Dolna', 5, 'Jura', 3, 'Mezozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 195.000),
(13, 'Trias Górna', 6, 'Trias', 3, 'Mezozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 230.000),
(14, 'Trias Œrodkowa', 6, 'Trias', 3, 'Mezozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 230.000),
(15, 'Trias Dolna', 6, 'Trias', 3, 'Mezozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 230.000),
(16, 'Perm Górny', 7, 'Perm', 4, 'Paleozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 280.000),
(17, 'Perm Dolny', 7, 'Perm', 4, 'Paleozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 280.000),
(18, 'Karbon Górny', 8, 'Karbon', 4, 'Paleozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 345.000),
(19, 'Karbon Dolny', 8, 'Karbon', 4, 'Paleozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 345.000),
(20, 'Dewon Górny', 9, 'Dewon', 4, 'Paleozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 395.000),
(21, 'Dewon Œrodkowy', 9, 'Dewon', 4, 'Paleozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 395.000),
(22, 'Dewon Dolny', 9, 'Dewon', 4, 'Paleozoik', 1, 'Fanerozoik', 1, 'Fanerozoik', 395.000);

CREATE TABLE Dziesiec (
    cyfra INT,
    bit INT
);

-- Wstawianie danych do tabeli `Dziesiec`
INSERT INTO Dziesiec (cyfra, bit) VALUES
(0, 0), (1, 1), (2, 0), (3, 1), (4, 0),
(5, 1), (6, 0), (7, 1), (8, 0), (9, 1);

CREATE TABLE Milion (
    liczba INT,
    cyfra INT,
    bit INT
);

-- Wstawianie danych do tabeli `Milion`
INSERT INTO Milion (liczba, cyfra, bit)
SELECT a1.cyfra + 10 * a2.cyfra + 100 * a3.cyfra + 1000 * a4.cyfra + 10000 * a5.cyfra + 100000 * a6.cyfra AS liczba,
       a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;



--SET STATISTICS TIME ON;
--SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON
--(Milion.liczba % 68 = GeoTabela.id_pietro);
--SET STATISTICS TIME OFF;

CREATE TABLE GeoEon (
    id_eon INT PRIMARY KEY,
    nazwa_eon VARCHAR(255)
);

CREATE TABLE GeoEra (
    id_era INT PRIMARY KEY,
    nazwa_era VARCHAR(255),
    id_eon INT,
    FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon)
);

CREATE TABLE GeoOkres (
    id_okres INT PRIMARY KEY,
    nazwa_okres VARCHAR(255),
    id_era INT,
    FOREIGN KEY (id_era) REFERENCES GeoEra(id_era)
);

CREATE TABLE GeoEpoka (
    id_epoka INT PRIMARY KEY,
    nazwa_epoka VARCHAR(255),
    id_okres INT,
    FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres)
);

CREATE TABLE GeoPietro (
    id_pietro INT PRIMARY KEY,
    nazwa_pietro VARCHAR(255),
    id_epoka INT,
    FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka)
);



-- Dane do tabeli GeoEon
INSERT INTO GeoEon (id_eon, nazwa_eon) VALUES
(1, 'Fanerozoik');

-- Dane do tabeli GeoEra
INSERT INTO GeoEra (id_era, nazwa_era, id_eon) VALUES
(1, 'Kenozoik', 1),
(2, 'Mezozoik', 1),
(3, 'Paleozoik', 1);

-- Dane do tabeli GeoOkres
INSERT INTO GeoOkres (id_okres, nazwa_okres, id_era) VALUES
(1, 'Czwartorzêd', 1),
(2, 'Trzeciorzêd', 1),
(3, 'Kreda', 2),
(4, 'Jura', 2),
(5, 'Trias', 2),
(6, 'Perm', 3),
(7, 'Karbon', 3),
(8, 'Dewon', 3);

-- Dane do tabeli GeoEpoka
INSERT INTO GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES
(1, 'Holocen', 1),
(2, 'Plejstocen', 1),
(3, 'Pliocen', 2),
(4, 'Miocen', 2),
(5, 'Oligocen', 2),
(6, 'Eocen', 2),
(7, 'Paleocen', 2),
(8, 'Kreda Górna', 3),
(9, 'Kreda Dolna', 3),
(10, 'Jura Górna', 4),
(11, 'Jura Œrodkowa', 4),
(12, 'Jura Dolna', 4),
(13, 'Trias Górna', 5),
(14, 'Trias Œrodkowa', 5),
(15, 'Trias Dolna', 5),
(16, 'Perm Górny', 6),
(17, 'Perm Dolny', 6),
(18, 'Karbon Górny', 7),
(19, 'Karbon Dolny', 7),
(20, 'Dewon Górny', 8),
(21, 'Dewon Œrodkowy', 8),
(22, 'Dewon Dolny', 8);

-- Dane do tabeli GeoPietro
INSERT INTO GeoPietro (id_pietro, nazwa_pietro, id_epoka) VALUES
(1, 'Holocen', 1),
(2, 'Plejstocen', 2),
(3, 'Pliocen', 3),
(4, 'Miocen', 4),
(5, 'Oligocen', 5),
(6, 'Eocen', 6),
(7, 'Paleocen', 7),
(8, 'Kreda Górna', 8),
(9, 'Kreda Dolna', 9),
(10, 'Jura Górna', 10),
(11, 'Jura Œrodkowa', 11),
(12, 'Jura Dolna', 12),
(13, 'Trias Górna', 13),
(14, 'Trias Œrodkowa', 14),
(15, 'Trias Dolna', 15),
(16, 'Perm Górny', 16),
(17, 'Perm Dolny', 17),
(18, 'Karbon Górny', 18),
(19, 'Karbon Dolny', 19),
(20, 'Dewon Górny', 20),
(21, 'Dewon Œrodkowy', 21),
(22, 'Dewon Dolny', 22);

*/
--SET STATISTICS TIME ON;
--SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON
--(Milion.liczba % 68 = GeoPietro.id_pietro)
--INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka
--INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
--INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
--INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon;
--SET STATISTICS TIME OFF;

--SET STATISTICS TIME ON;
--SELECT COUNT(*) FROM Milion WHERE Milion.liczba % 68 =
--(SELECT id_pietro FROM GeoTabela WHERE Milion.liczba % 68 = id_pietro);
--SET STATISTICS TIME OFF;
/*
SET STATISTICS TIME ON;
SELECT COUNT(*) 
FROM Milion 
WHERE EXISTS (
    SELECT 1 
    FROM GeoPietro 
    INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka
    INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
    INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
    INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon
    WHERE Milion.liczba % 68 = GeoPietro.id_pietro
);
SET STATISTICS TIME OFF;
*/
--CREATE INDEX idx_geo_pietro ON GeoTabela(id_pietro);
--CREATE INDEX idx_milion_liczba ON Milion(liczba);

SET STATISTICS TIME ON;
SELECT COUNT(*) 
FROM Milion 
WHERE EXISTS (
    SELECT 1 
    FROM GeoPietro 
    INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka
    INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
    INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
    INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon
    WHERE Milion.liczba % 68 = GeoPietro.id_pietro
);
SET STATISTICS TIME OFF;
