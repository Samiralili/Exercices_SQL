-- Exercice 2 de la série 1-2
CREATE DATABASE HOLLYWOOD;
USE HOLLYWOOD;

CREATE TABLE ARTISTE(
nom VARCHAR(45),
nation VARCHAR(45),
sexe Enum('Homme', 'Femme')
);

CREATE TABLE FILM(
titre VARCHAR(45),
producteur VARCHAR(45),
realisateur VARCHAR(45)
);

CREATE TABLE JOUE(
titre VARCHAR(45),
acteur VARCHAR(45)
);

CREATE TABLE SEANCE(
numero INT(11),
nom_cine VARCHAR(45),
horaire DATETIME,
titre VARCHAR(45)
);

CREATE TABLE VISIONNAGE(
spectateur VARCHAR(45),
titre VARCHAR(45)
);

CREATE TABLE AIME(
spectateur VARCHAR(45),
titre VARCHAR(45)
);

-- Contraintes d'intégrités fonctionnelles
alter table ARTISTE add constraint PK_artiste  primary key (nom);
alter table FILM add constraint PK_film  primary key (titre);
alter table JOUE add constraint PK_joue  primary key (titre,acteur);
alter table SEANCE add constraint PK_seance  primary key (numero,nom_cine,horaire);
alter table VISIONNAGE add constraint PK_avis  primary key (spectateur,titre);
alter table AIME add constraint PK_aime  primary key (spectateur,titre);

-- Contraintes d'intégrités référentielles
Alter table FILM add constraint FK_Film_Realise foreign key (realisateur) references artiste(nom);
Alter table FILM add nom varchar (45);
Alter table FILM add constraint FK1_Film_realise foreign key (nom) references artiste (nom);

Alter table JOUE add titre_film VARCHAR(45),
ADD nom VARCHAR(45);

Alter table JOUE add constraint FK_joue_film foreign key (titre_film) references film (titre);
Alter table JOUE add constraint FK_joue_acteur foreign key (nom) references artiste (nom);


Alter table SEANCE add titre_film VARCHAR(45);
Alter table SEANCE add constraint FK_seance_titre foreign key (titre_film) references film (titre);

-- Contraintes de domaines 
Alter table seance add nb_salles tinyint(4)
DELIMITER 
CREATE TRIGGER before_insert_nb_salles BEFORE INSERT ON seance FOR EACH ROW BEGIN IF NEW.nb_salles > 10 THEN SET NEW.nb_salles = 10; 
END IF; 
END 
DELIMITER ;

ALTER TABLE seance
ADD heure_ouverture TIME;
DELIMITER 
CREATE TRIGGER before_insert_heure_ouverture BEFORE INSERT ON seance FOR EACH ROW IF NEW.heure_ouverture > '00:00:00' AND NEW.heure_ouverture < '10:00:00' THEN SET NEW.heure_ouverture = NULL;
END IF;
END 
DELIMITER ;