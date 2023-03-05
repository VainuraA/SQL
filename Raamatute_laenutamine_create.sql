-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-12-21 17:19:57.465

-- tables
-- Table: autor
CREATE TABLE autor (
    id int NOT NULL AUTO_INCREMENT,
    eesnimi varchar(50) NOT NULL,
    perenimi varchar(50) NOT NULL,
    sunniaasta int NOT NULL,
    CONSTRAINT autor_pk PRIMARY KEY (id)
);

-- Table: illustraator
CREATE TABLE illustraator (
    id int NOT NULL,
    eesnimi varchar(50) NOT NULL,
    perenimi varchar(50) NOT NULL,
    CONSTRAINT illustraator_pk PRIMARY KEY (id)
);

-- Table: kirjastus
CREATE TABLE kirjastus (
    id int NOT NULL AUTO_INCREMENT,
    nimi varchar(50) NOT NULL,
    aadress varchar(100) NOT NULL,
    CONSTRAINT kirjastus_pk PRIMARY KEY (id)
);

-- Table: laenutaja
CREATE TABLE laenutaja (
    id int NOT NULL AUTO_INCREMENT,
    eesnimi varchar(50) NOT NULL,
    perenimi varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    isikukood int NOT NULL,
    CONSTRAINT laenutaja_pk PRIMARY KEY (id)
);

-- Table: osakond
CREATE TABLE osakond (
    id int NOT NULL AUTO_INCREMENT,
    nimetus varchar(100) NOT NULL,
    raamatukogu_id int NOT NULL,
    CONSTRAINT osakond_pk PRIMARY KEY (id)
);

-- Table: pilt
CREATE TABLE pilt (
    id int NOT NULL AUTO_INCREMENT,
    pildi_faili_nimi varchar(100) NOT NULL,
    autor_id int NOT NULL,
    CONSTRAINT pilt_pk PRIMARY KEY (id)
);

-- Table: raamat
CREATE TABLE raamat (
    id int NOT NULL AUTO_INCREMENT,
    pealkiri varchar(100) NOT NULL,
    lehekulgede_arv int NOT NULL,
    valjalaske_aasta int NOT NULL,
    osakond_id int NOT NULL,
    eksemplaride_arv int NOT NULL,
    keel varchar(50) NOT NULL,
    CONSTRAINT raamat_pk PRIMARY KEY (id)
);

-- Table: raamat_illustreeritud
CREATE TABLE raamat_illustreeritud (
    id int NOT NULL,
    raamat_id int NOT NULL,
    illustraator_id int NOT NULL,
    CONSTRAINT raamat_illustreeritud_pk PRIMARY KEY (id)
);

-- Table: raamat_kirjastatud
CREATE TABLE raamat_kirjastatud (
    id int NOT NULL AUTO_INCREMENT,
    raamat_id int NOT NULL,
    kirjastus_id int NOT NULL,
    CONSTRAINT raamat_kirjastatud_pk PRIMARY KEY (id)
);

-- Table: raamat_kirjutatud
CREATE TABLE raamat_kirjutatud (
    id int NOT NULL AUTO_INCREMENT,
    raamat_id int NOT NULL,
    autor_id int NOT NULL,
    CONSTRAINT raamat_kirjutatud_pk PRIMARY KEY (id)
);

-- Table: raamat_tolgitud
CREATE TABLE raamat_tolgitud (
    id int NOT NULL,
    tolkija_id int NOT NULL,
    raamat_id int NOT NULL,
    CONSTRAINT raamat_tolgitud_pk PRIMARY KEY (id)
);

-- Table: raamatu_laenutamine
CREATE TABLE raamatu_laenutamine (
    id int NOT NULL AUTO_INCREMENT,
    laenu_kuupaev date NOT NULL,
    tagastamise_kuupaev date NOT NULL,
    raamat_id int NOT NULL,
    laenutaja_id int NOT NULL,
    CONSTRAINT raamatu_laenutamine_pk PRIMARY KEY (id)
);

-- Table: raamatu_zanr
CREATE TABLE raamatu_zanr (
    id int NOT NULL AUTO_INCREMENT,
    raamat_id int NOT NULL,
    zanr_id int NOT NULL,
    CONSTRAINT raamatu_zanr_pk PRIMARY KEY (id)
);

-- Table: raamatukogu
CREATE TABLE raamatukogu (
    id int NOT NULL AUTO_INCREMENT,
    nimi varchar(50) NOT NULL,
    aadress varchar(100) NOT NULL,
    osakondade_arv int NOT NULL,
    raamatute_arv int NOT NULL,
    CONSTRAINT raamatukogu_pk PRIMARY KEY (id)
);

-- Table: tolkija
CREATE TABLE tolkija (
    id int NOT NULL,
    eesnimi varchar(50) NOT NULL,
    perenimi varchar(50) NOT NULL,
    CONSTRAINT tolkija_pk PRIMARY KEY (id)
);

-- Table: viivis
CREATE TABLE viivis (
    id int NOT NULL AUTO_INCREMENT,
    tasu decimal(10,4) NOT NULL,
    raamatu_laenutamine_id int NOT NULL,
    CONSTRAINT viivis_pk PRIMARY KEY (id)
);

-- Table: zanr
CREATE TABLE zanr (
    id int NOT NULL AUTO_INCREMENT,
    nimetus varchar(50) NOT NULL,
    kirjeldus varchar(200) NOT NULL,
    CONSTRAINT zanr_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: osakond_raamatukogu (table: osakond)
ALTER TABLE osakond ADD CONSTRAINT osakond_raamatukogu FOREIGN KEY osakond_raamatukogu (raamatukogu_id)
    REFERENCES raamatukogu (id);

-- Reference: pilt_autor (table: pilt)
ALTER TABLE pilt ADD CONSTRAINT pilt_autor FOREIGN KEY pilt_autor (autor_id)
    REFERENCES autor (id);

-- Reference: raamat_illustreeritud_illustraator (table: raamat_illustreeritud)
ALTER TABLE raamat_illustreeritud ADD CONSTRAINT raamat_illustreeritud_illustraator FOREIGN KEY raamat_illustreeritud_illustraator (illustraator_id)
    REFERENCES illustraator (id);

-- Reference: raamat_illustreeritud_raamat (table: raamat_illustreeritud)
ALTER TABLE raamat_illustreeritud ADD CONSTRAINT raamat_illustreeritud_raamat FOREIGN KEY raamat_illustreeritud_raamat (raamat_id)
    REFERENCES raamat (id);

-- Reference: raamat_kirjastatud_kirjastus (table: raamat_kirjastatud)
ALTER TABLE raamat_kirjastatud ADD CONSTRAINT raamat_kirjastatud_kirjastus FOREIGN KEY raamat_kirjastatud_kirjastus (kirjastus_id)
    REFERENCES kirjastus (id);

-- Reference: raamat_kirjastatud_raamat (table: raamat_kirjastatud)
ALTER TABLE raamat_kirjastatud ADD CONSTRAINT raamat_kirjastatud_raamat FOREIGN KEY raamat_kirjastatud_raamat (raamat_id)
    REFERENCES raamat (id);

-- Reference: raamat_kirjutatud_autor (table: raamat_kirjutatud)
ALTER TABLE raamat_kirjutatud ADD CONSTRAINT raamat_kirjutatud_autor FOREIGN KEY raamat_kirjutatud_autor (autor_id)
    REFERENCES autor (id);

-- Reference: raamat_kirjutatud_raamat (table: raamat_kirjutatud)
ALTER TABLE raamat_kirjutatud ADD CONSTRAINT raamat_kirjutatud_raamat FOREIGN KEY raamat_kirjutatud_raamat (raamat_id)
    REFERENCES raamat (id);

-- Reference: raamat_osakond (table: raamat)
ALTER TABLE raamat ADD CONSTRAINT raamat_osakond FOREIGN KEY raamat_osakond (osakond_id)
    REFERENCES osakond (id);

-- Reference: raamat_tolgitud_Tolkija (table: raamat_tolgitud)
ALTER TABLE raamat_tolgitud ADD CONSTRAINT raamat_tolgitud_Tolkija FOREIGN KEY raamat_tolgitud_Tolkija (tolkija_id)
    REFERENCES tolkija (id);

-- Reference: raamat_tolgitud_raamat (table: raamat_tolgitud)
ALTER TABLE raamat_tolgitud ADD CONSTRAINT raamat_tolgitud_raamat FOREIGN KEY raamat_tolgitud_raamat (raamat_id)
    REFERENCES raamat (id);

-- Reference: raamatu_laenutamine_laenutaja (table: raamatu_laenutamine)
ALTER TABLE raamatu_laenutamine ADD CONSTRAINT raamatu_laenutamine_laenutaja FOREIGN KEY raamatu_laenutamine_laenutaja (laenutaja_id)
    REFERENCES laenutaja (id);

-- Reference: raamatu_laenutamine_raamat (table: raamatu_laenutamine)
ALTER TABLE raamatu_laenutamine ADD CONSTRAINT raamatu_laenutamine_raamat FOREIGN KEY raamatu_laenutamine_raamat (raamat_id)
    REFERENCES raamat (id);

-- Reference: raamatu_zanr_raamat (table: raamatu_zanr)
ALTER TABLE raamatu_zanr ADD CONSTRAINT raamatu_zanr_raamat FOREIGN KEY raamatu_zanr_raamat (raamat_id)
    REFERENCES raamat (id);

-- Reference: raamatu_zanr_zanr (table: raamatu_zanr)
ALTER TABLE raamatu_zanr ADD CONSTRAINT raamatu_zanr_zanr FOREIGN KEY raamatu_zanr_zanr (zanr_id)
    REFERENCES zanr (id);

-- Reference: viivis_raamatu_laenutamine (table: viivis)
ALTER TABLE viivis ADD CONSTRAINT viivis_raamatu_laenutamine FOREIGN KEY viivis_raamatu_laenutamine (raamatu_laenutamine_id)
    REFERENCES raamatu_laenutamine (id);

-- End of file.

