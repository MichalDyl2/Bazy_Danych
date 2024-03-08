-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-03-08 09:25:56.397

-- tables
-- Table: Artykuly
CREATE TABLE Artykuly (
    IDZamowien int  NOT NULL,
    IDPudelka char  NOT NULL,
    Sztuk int  NOT NULL,
    Zamowienia_IDZamowien int  NOT NULL,
    CONSTRAINT Artykuly_pk PRIMARY KEY (IDZamowien)
);

-- Table: Czekoladki
CREATE TABLE Czekoladki (
    IdCzekoladki int  NOT NULL,
    Nazwa char  NOT NULL,
    RodzajCzekolady char  NOT NULL,
    RodzajOrzechow char  NOT NULL,
    RodzajNadzienia char  NOT NULL,
    Opis char  NOT NULL,
    Koszt money  NOT NULL,
    Masa int  NOT NULL,
    Zawartosc_IDPudelka char  NOT NULL,
    CONSTRAINT Czekoladki_pk PRIMARY KEY (IdCzekoladki)
);

-- Table: Klienci
CREATE TABLE Klienci (
    IDKlienta int  NOT NULL,
    Nazwa char  NOT NULL,
    Ulica char  NOT NULL,
    Miejscowosc char  NOT NULL,
    Kod char  NOT NULL,
    Telefon char  NOT NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY (IDKlienta)
);

-- Table: Pudelka
CREATE TABLE Pudelka (
    IDPudelka char  NOT NULL,
    Nazwa char  NOT NULL,
    Opis char  NOT NULL,
    Cena money  NOT NULL,
    Stan int  NOT NULL,
    Artykuly_IDZamowien int  NOT NULL,
    CONSTRAINT Pudelka_pk PRIMARY KEY (IDPudelka)
);

-- Table: Zamowienia
CREATE TABLE Zamowienia (
    IDZamowien int  NOT NULL,
    IDKlienta char  NOT NULL,
    DataRealizacji date  NOT NULL,
    Klienci_IDKlienta int  NOT NULL,
    CONSTRAINT Zamowienia_pk PRIMARY KEY (IDZamowien)
);

-- Table: Zawartosc
CREATE TABLE Zawartosc (
    IDPudelka char  NOT NULL,
    IdCzekoladki char  NOT NULL,
    Sztuk int  NOT NULL,
    Pudelka_IDPudelka char  NOT NULL,
    CONSTRAINT Zawartosc_pk PRIMARY KEY (IDPudelka)
);

-- views
-- View: Artykuly
CREATE VIEW Artykuly AS
Select IDZamowien, IDPudelka, Sztuk from Artykuly;

-- View: Klienci
CREATE VIEW Klienci AS
Select IDKlienta, Nazwa, Ulica, Miejscowosc, Kod, Telefon from Klienci;

-- View: Czekoladki
CREATE VIEW Czekoladki AS
Select IdCzekoladki, Nazwa, RodzajCzekolady, RodzajOrzechow, RodzajNadzienia, Opis, Koszt, Masa from Czekoladki;

-- View: Pudelka
CREATE VIEW Pudelka AS
Select IDPudelka, Nazwa, Opis, Cena, Stan from Pudelka;

-- View: Zamowienia
CREATE VIEW Zamowienia AS
Select IDZamowien, IDKlienta, DataRealizacji from Zamowienia;

-- View: Zawartosc
CREATE VIEW Zawartosc AS
Select IDPudelka, IdCzekoladki, Sztuk from Zawartosc;

-- foreign keys
-- Reference: Artykuly_Zamowienia (table: Artykuly)
ALTER TABLE Artykuly ADD CONSTRAINT Artykuly_Zamowienia
    FOREIGN KEY (Zamowienia_IDZamowien)
    REFERENCES Zamowienia (IDZamowien)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Czekoladki_Zawartosc (table: Czekoladki)
ALTER TABLE Czekoladki ADD CONSTRAINT Czekoladki_Zawartosc
    FOREIGN KEY (Zawartosc_IDPudelka)
    REFERENCES Zawartosc (IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Pudelka_Artykuly (table: Pudelka)
ALTER TABLE Pudelka ADD CONSTRAINT Pudelka_Artykuly
    FOREIGN KEY (Artykuly_IDZamowien)
    REFERENCES Artykuly (IDZamowien)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zamowienia_Klienci (table: Zamowienia)
ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Klienci
    FOREIGN KEY (Klienci_IDKlienta)
    REFERENCES Klienci (IDKlienta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawartosc_Pudelka (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT Zawartosc_Pudelka
    FOREIGN KEY (Pudelka_IDPudelka)
    REFERENCES Pudelka (IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

