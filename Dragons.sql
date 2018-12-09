-- exercice 2 de la serie 2-2

CREATE DATABASE DRAGONS;
USE DRAGONS;

CREATE TABLE dragons(
id_dragons int(10) AUTO_INCREMENT NOT NULL,
nom_dragon varchar(25),
sexe Enum('M', 'F'),
longeur int(10),
nombre_ecailles int(10),
crachedufeu bool,
comportementamoureux varchar(25),
constraint Pk_dragons primary key (id_dragons)
);

CREATE TABLE aime(
nom_dragon varchar(25) NOT NULL,
id_dragons int(10),
force_aimer varchar(25),
CONSTRAINT pk_nom_dragon PRIMARY KEY (nom_dragon),
CONSTRAINT fk_nom_dragon foreign key (id_dragons) references dragons (id_dragons)
);

CREATE TABLE nourritures(
produit varchar(25) NOT NULL,
calories int(10),
CONSTRAINT pk_produit PRIMARY KEY (produit)
);

CREATE TABLE repas(
id_dragons int(10) NOT NULL,
produit varchar(25) NOT NULL,
CONSTRAINT pk_repas PRIMARY KEY (id_dragons,produit),
CONSTRAINT FK1_dragons_produit FOREIGN KEY (id_dragons) REFERENCES dragons(id_dragons),
CONSTRAINT FK2_dragons_produit FOREIGN KEY (produit) REFERENCES nourritures(produit)
);
