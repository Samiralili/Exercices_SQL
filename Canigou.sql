-- Exercie 1 série 1-2
CREATE DATABASE Canigou;
USE Canigou;

CREATE TABLE ADHERENT(
        code_adherent     Int (25)  Auto_increment  NOT NULL ,
        nom               Varchar (25),
        prenom            Varchar (25),
        date_de_naissance Date,
        CONSTRAINT ADHERENT_PK PRIMARY KEY (code_adherent)
);


CREATE TABLE ANNEE(
        id_annee                  Int(10)  Auto_increment  NOT NULL ,
        prix_cotisation_adulte Float(10) ,
        prix_cotisation_mineur Float(10),
        annee int(4),
        CONSTRAINT ANNEE_PK PRIMARY KEY (id_annee)
        
);



CREATE TABLE lieu(
        id_lieu Int(25)  Auto_increment  NOT NULL ,
        lieu    Varchar (50),
        CONSTRAINT lieu_PK PRIMARY KEY (id_lieu)
);




CREATE TABLE niveau(
        id_niveau   Int(4)  Auto_increment  NOT NULL ,
        niveau Varchar(50),
        CONSTRAINT niveau_PK PRIMARY KEY (id_niveau)
);



CREATE TABLE MARCHE(
        code_marche Int(10)  Auto_increment  NOT NULL ,
        date_marche Date,
        id_lieu     Int(25),
        id_niveau   Int(4),
        CONSTRAINT MARCHE_PK PRIMARY KEY (code_marche),
        CONSTRAINT MARCHE_lieu_FK FOREIGN KEY (id_lieu) REFERENCES lieu(id_lieu),
        CONSTRAINT MARCHE_niveau0_FK FOREIGN KEY (id_niveau) REFERENCES niveau(id_niveau)
);


CREATE TABLE Realiser(
        code_marche   Int (10) NOT NULL,
        code_adherent Int (10) NOT NULL,
        CONSTRAINT Realiser_PK PRIMARY KEY (code_marche,code_adherent),
        CONSTRAINT Realiser_MARCHE_FK FOREIGN KEY (code_marche) REFERENCES MARCHE(code_marche),
        CONSTRAINT Realiser_ADHERENT0_FK FOREIGN KEY (code_adherent) REFERENCES ADHERENT(code_adherent)
);



CREATE TABLE payer_cotisation(
        id_annee         Int (10) NOT NULL ,
        code_adherent Int (10) NOT NULL,
        CONSTRAINT payer_cotisation_PK PRIMARY KEY (id_annee,code_adherent),
        CONSTRAINT payer_cotisation_ANNEE_FK FOREIGN KEY (id_annee) REFERENCES ANNEE(id_annee),
        CONSTRAINT payer_cotisation_ADHERENT0_FK FOREIGN KEY (code_adherent) REFERENCES ADHERENT(code_adherent)
);


ALTER TABLE ANNEE 
ADD check(annee BETWEEN 2000 AND 2020);


INSERT INTO ADHERENT(nom, prenom, date_de_naissance) VALUES ('ALILI', 'SAMIR', '1985-12-05');
INSERT INTO ADHERENT(nom, prenom, date_de_naissance) VALUES ('ALILI', 'RIAD', '1989-05-14');

INSERT INTO ANNEE(prix_cotisation_adulte, prix_cotisation_mineur, annee) VALUES ('100', '40', '2018');
INSERT INTO ANNEE(prix_cotisation_adulte, prix_cotisation_mineur, annee) VALUES ('70.5', '20.5', '2016');

INSERT INTO lieu(lieu) VALUES ('MONTPELLIER');
INSERT INTO lieu(lieu) VALUES ('PARIS');

INSERT INTO niveau(niveau) VALUES ('Facile');
INSERT INTO niveau(niveau) VALUES ('Moyen');
INSERT INTO niveau(niveau) VALUES ('Difficile');
INSERT INTO niveau(niveau) VALUES ('Compétition');

INSERT INTO MARCHE(date_marche) VALUES ('2013-04-07');
INSERT INTO MARCHE(date_marche) VALUES ('2017-08-06');