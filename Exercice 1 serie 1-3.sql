-- Exercice 1 serie 1-3
CREATE DATABASE DOSSIER_MEDICAL;
USE DOSSIER_MEDICAL;

CREATE TABLE personne(
        NoSS    Int NOT NULL ,
        Nom     Varchar (25) NOT NULL ,
        Prenom  Varchar (25) NOT NULL ,
        Adresse Varchar (50) NOT NULL,
        CONSTRAINT personne_PK PRIMARY KEY (NoSS)
);


CREATE TABLE medicament(
        NomMed    Varchar (100) NOT NULL ,
        Nom_Subst Varchar (100) NOT NULL ,
        Prix      Float NOT NULL,
        CONSTRAINT medicament_PK PRIMARY KEY (NomMed)
);


CREATE TABLE patient(
        NossPat Int NOT NULL ,
        NoSS    Int NOT NULL,
        CONSTRAINT patient_PK PRIMARY KEY (NossPat),
        CONSTRAINT patient_personne_FK FOREIGN KEY (NoSS) REFERENCES personne(NoSS),
        CONSTRAINT patient_personne_AK UNIQUE (NoSS)
);


CREATE TABLE medecin(
        NossMed Int NOT NULL ,
        NoSS    Int NOT NULL,
        CONSTRAINT medecin_PK PRIMARY KEY (NossMed),
        CONSTRAINT medecin_personne_FK FOREIGN KEY (NoSS) REFERENCES personne(NoSS),
        CONSTRAINT medecin_personne_AK UNIQUE (NoSS)
);


CREATE TABLE consultation(
        NoCons   Int  Auto_increment  NOT NULL ,
        Date     Date NOT NULL ,
        Symptome Varchar (100) NOT NULL ,
        NossPat  Int NOT NULL ,
        NossMed  Int NOT NULL,CONSTRAINT consultation_PK PRIMARY KEY (NoCons),
        CONSTRAINT consultation_patient_FK FOREIGN KEY (NossPat) REFERENCES patient(NossPat),
        CONSTRAINT consultation_medecin0_FK FOREIGN KEY (NossMed) REFERENCES medecin(NossMed)
);



CREATE TABLE prescrire(
        NoCons Int NOT NULL ,
        NomMed Varchar (100) NOT NULL,
        CONSTRAINT prescrire_PK PRIMARY KEY (NoCons,NomMed),
        CONSTRAINT prescrire_consultation_FK FOREIGN KEY (NoCons) REFERENCES consultation(NoCons),
        CONSTRAINT prescrire_medicament0_FK FOREIGN KEY (NomMed) REFERENCES medicament(NomMed)
);

