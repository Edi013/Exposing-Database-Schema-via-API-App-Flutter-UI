DROP SEQUENCE seq_furnizori;
DROP SEQUENCE seq_stoc;
DROP SEQUENCE seq_clienti;
DROP SEQUENCE seq_comenzi;
DROP SEQUENCE seq_articole;

CREATE SEQUENCE seq_furnizori
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE seq_stoc
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE seq_clienti
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE seq_comenzi
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE seq_articole
  START WITH 1
  INCREMENT BY 1;

-- Furnizori 
DROP TABLE Furnizori;
CREATE TABLE Furnizori (
    id NUMBER PRIMARY KEY,
    nume_furnizor VARCHAR2(50),
    timp_executie NUMBER
);

CREATE OR REPLACE TRIGGER trg_furnizori
BEFORE INSERT ON Furnizori
FOR EACH ROW
BEGIN
    SELECT seq_furnizori.NEXTVAL INTO :new.id FROM dual;
END;

-- Stoc 
DROP TABLE Stoc;
CREATE TABLE Stoc (
    id NUMBER PRIMARY KEY,
    id_furnizor NUMBER,
    descriere VARCHAR2(100),
    pret_unitar NUMBER,
    unitate VARCHAR2(20),
    descriere_unitate VARCHAR2(50),
    FOREIGN KEY (id_furnizor) REFERENCES Furnizori(id)
);

CREATE OR REPLACE TRIGGER trg_stoc
BEFORE INSERT ON Stoc
FOR EACH ROW
BEGIN
    SELECT seq_stoc.NEXTVAL INTO :new.id FROM dual;
END;

-- Clienti 
DROP TABLE Clienti;
CREATE TABLE Clienti (
    id NUMBER PRIMARY KEY,
    nume VARCHAR2(50),
    prenume VARCHAR2(50),
    companie VARCHAR2(100),
    adresa VARCHAR2(200),
    oras VARCHAR2(50),
    cod VARCHAR2(20),
    telefon VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER trg_clienti
BEFORE INSERT ON Clienti
FOR EACH ROW
BEGIN
    SELECT seq_clienti.NEXTVAL INTO :new.id FROM dual;
END;

-- Comenzi
DROP TABLE Comenzi;
CREATE TABLE Comenzi (
    id NUMBER PRIMARY KEY,
    id_client NUMBER,
    data_comanda DATE,
    data_onorare DATE,
    data_platii DATE,
    FOREIGN KEY (id_client) REFERENCES Clienti(id)
);

CREATE OR REPLACE TRIGGER trg_comenzi
BEFORE INSERT ON Comenzi
FOR EACH ROW
BEGIN
    SELECT seq_comenzi.NEXTVAL INTO :new.id FROM dual;
END;

-- Articole 
DROP TABLE Articole;
CREATE TABLE Articole (
    id NUMBER PRIMARY KEY,
    id_comanda NUMBER,
    id_stoc NUMBER,
    cantitate NUMBER,
    pret_total NUMBER,
    FOREIGN KEY (id_comanda) REFERENCES Comenzi(id),
    FOREIGN KEY (id_stoc) REFERENCES Stoc(id)
);

CREATE OR REPLACE TRIGGER trg_articole
BEFORE INSERT ON Articole
FOR EACH ROW
BEGIN
    SELECT seq_articole.NEXTVAL INTO :new.id FROM dual;
END;

-- Inserts
INSERT INTO Furnizori (nume_furnizor, timp_executie) VALUES ('Supplier1', 5);
INSERT INTO Furnizori (nume_furnizor, timp_executie) VALUES ('Supplier2', 7);
INSERT INTO Furnizori (nume_furnizor, timp_executie) VALUES ('Supplier3', 3);
INSERT INTO Furnizori (nume_furnizor, timp_executie) VALUES ('Supplier4', 8);

INSERT INTO Stoc (id_furnizor, descriere, pret_unitar, unitate, descriere_unitate) VALUES (1, 'Description1', 10.5, 'Unit1', 'Description Unit1');
INSERT INTO Stoc (id_furnizor, descriere, pret_unitar, unitate, descriere_unitate) VALUES (2, 'Description2', 15.2, 'Unit2', 'Description Unit2');
INSERT INTO Stoc (id_furnizor, descriere, pret_unitar, unitate, descriere_unitate) VALUES (3, 'Description3', 8.7, 'Unit3', 'Description Unit3');
INSERT INTO Stoc (id_furnizor, descriere, pret_unitar, unitate, descriere_unitate) VALUES (4, 'Description4', 12.3, 'Unit4', 'Description Unit4');

INSERT INTO Clienti (nume, prenume, companie, adresa, oras, cod, telefon) VALUES ('John', 'Doe', 'Company1', 'Address1', 'City1', '12345', '555-1234');
INSERT INTO Clienti (nume, prenume, companie, adresa, oras, cod, telefon) VALUES ('Jane', 'Smith', 'Company2', 'Address2', 'City2', '54321', '555-5678');
INSERT INTO Clienti (nume, prenume, companie, adresa, oras, cod, telefon) VALUES ('Robert', 'Johnson', 'Company3', 'Address3', 'City3', '67890', '555-9876');
INSERT INTO Clienti (nume, prenume, companie, adresa, oras, cod, telefon) VALUES ('Alice', 'Williams', 'Company4', 'Address4', 'City4', '09876', '555-4321');

INSERT INTO Comenzi (id_client, data_comanda, data_onorare, data_platii) VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-05', 'YYYY-MM-DD'), TO_DATE('2023-01-10', 'YYYY-MM-DD'));
INSERT INTO Comenzi (id_client, data_comanda, data_onorare, data_platii) VALUES (2, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-05', 'YYYY-MM-DD'), TO_DATE('2023-02-10', 'YYYY-MM-DD'));
INSERT INTO Comenzi (id_client, data_comanda, data_onorare, data_platii) VALUES (3, TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2023-03-10', 'YYYY-MM-DD'));
INSERT INTO Comenzi (id_client, data_comanda, data_onorare, data_platii) VALUES (4, TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2023-04-10', 'YYYY-MM-DD'));

INSERT INTO Articole (id_comanda, id_stoc, cantitate, pret_total) VALUES (1, 1, 2, 21.0);
INSERT INTO Articole (id_comanda, id_stoc, cantitate, pret_total) VALUES (2, 2, 3, 45.6);
INSERT INTO Articole (id_comanda, id_stoc, cantitate, pret_total) VALUES (3, 3, 1, 8.7);
INSERT INTO Articole (id_comanda, id_stoc, cantitate, pret_total) VALUES (4, 4, 4, 49.2);

SELECT * FROM Furnizori;
SELECT * FROM Stoc;
SELECT * FROM Clienti;
SELECT * FROM Comenzi;
SELECT * FROM Articole;


delete from Articole where 1=1;
delete from Comenzi where 1=1;
delete from Stoc where 1=1;
delete from Furnizori where 1=1;
delete from Clienti where 1=1;