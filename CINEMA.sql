-- Exercice 1 Série 2-2
Create database CINEMA;
Use CINEMA; 

Create table Film(
idfilm int(10) not null auto_increment,
titre varchar(40), 
metteur_en_scene varchar(40), 
acteur varchar(40),

constraint Pk_film primary key (idfilm)

);

Create table Salle(
idsalle int(10) not null auto_increment,
nom_cine varchar(40),
adresse varchar(40), 
telephone int(10), 

constraint Pk_salle primary key (idsalle)

);

Create table Programme(
idprogramme int(10) not null auto_increment,
idfilm int(10),
idsalle int(10),
nom_cine varchar(40),
titre varchar(40), 
horaire time,

constraint Pk_programme primary key (idprogramme), 
constraint FK foreign key (idsalle) references Salle (idsalle),
constraint FK1 foreign key (idfilm) references Film (idfilm)

);



insert into Film (titre, metteur_en_scene, acteur) values ('Cris et chuchotements', 'Bergam', 'Ulllman');
insert into Film (titre, metteur_en_scene, acteur) values ('Cris et chuchotements', 'Bergam', 'Andersson');
insert into Film (titre, metteur_en_scene, acteur) values ('Cris et chuchotements', 'Bergam', 'Thulin');

insert into Film (titre, metteur_en_scene, acteur) values ('Speed 2', 'Jan de Bont','S Bullock');
insert into Film (titre, metteur_en_scene, acteur) values ('Speed 2', 'Jan de Bont','W Dafoe');
insert into Film (titre, metteur_en_scene, acteur) values ('Marion','M Poirier', 'C Tetard');
insert into Film (titre, metteur_en_scene, acteur) values ('Marion','M Poirier', 'MF Pisier');
insert into Film (titre, metteur_en_scene, acteur) values ('Marion','M Poirier', 'M Poirier');

insert into Film (titre, metteur_en_scene, acteur) values ('Eyes wide shut','Kubrick', 'Cruise');
insert into Film (titre, metteur_en_scene, acteur) values ('Eyes wide shut','Kubrick', 'Kidman');

insert into Salle (nom_cine, adresse, telephone) values ('Diagonal Capitole', '5 rue de Verdun', 0467585810);
insert into Salle (nom_cine, adresse, telephone) values ('Diagonal Centre', '18 place St Denis', 0467929181);
insert into Salle (nom_cine, adresse, telephone) values ('Gaumont', "Place de l'Oeuf", 0467322581);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (9, 2,'Diagonal Centre', 'Eyes wide shut', 140000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (10, 2,'Diagonal Centre', 'Eyes wide shut', 173000);

insert into Programme (idfilm, idsalle,nom_cine, titre, horaire) values (3, 3,'Gaumont', 'Speed 2', 143000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (4, 3,'Gaumont', 'Speed 2', 183000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (5, 3,'Gaumont', 'Speed 2', 223000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (6, 3,'Gaumont', 'Marion', 183000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (7, 3,'Gaumont', 'Marion', 203000);



#question a
/*select * from programme, film where programme.titre = 'Speed 2' and film.titre = 'Speed 2';*/

/*select * from film inner join 
programme on film.idfilm = idfilm 
where film.titre = 'Speed 2' and programme.titre = 'Speed 2';*/

#question b
/*select * from programme where horaire > '14:00:00' AND titre = 'Eyes wide shut';*/

/*select * from programme as p1 
inner join programme as p2 
on p1.idfilm = p2.idfilm 
where  p2.horaire > 140000 AND p2.titre = 'Eyes wide shut';*/

#question c
/*select * from film where metteur_en_scene = acteur ;*/
/*select distinct f1.titre from film as f1 inner join film as f2 on f1.idfilm = f2.idfilm
where f1.acteur = f2.metteur_en_scene;*/

#question d
/*select * from programme where titre= 'marion' or nom_cine= 'diagonal centre';*/
/*select * from programme as p1 inner join programme as p2 on p1.nom_cine = p2.nom_cine
where p1.titre ='marion' or p2.nom_cine = 'diagonal centre';*/

#question e
/*select * from film, programme where film.acteur  = 'MF Pisier' AND  film.titre = programme.titre;
select f.titre, nom_cine, horaire from film as f inner join programme as p on f.idfilm = p.idfilm
where f.acteur = 'MF Pisier' AND p.titre = f.titre;*/

#question f
/*select metteur_en_scene from film where metteur_en_scene = acteur;
select distinct f1.titre from film as f1 inner join film as f2 on f1.idfilm = f2.idfilm
where f1.acteur = f2.metteur_en_scene;*/

#question g
/*select sum(metteur_en_scene), titre from film group by titre having sum(metteur_en_scene) > 1;
select sum(f1.metteur_en_scene), f1.titre from film as f1 inner join film as f2 on f1.idfilm = f2.idfilm 
group by f1.titre having sum(f1.metteur_en_scene) > 1;*/

#question h
/*select metteur_en_scene, acteur from film where titre = 'marion';
select f1.metteur_en_scene, f1.acteur from film as f1 inner join film as f2 on f1.idfilm = f2.idfilm
where f1.titre = 'marion';*/


