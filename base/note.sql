CREATE DATABASE Note_semestre;

\c note_semestre;

CREATE TABLE Matiere(
   id_matiere INTEGER,
   cle_matiere VARCHAR(50) NOT NULL,
   intitule VARCHAR(50) NOT NULL,
   credits INTEGER NOT NULL,
   PRIMARY KEY(id_matiere)
);

CREATE TABLE Etudiant(
   id_etudiant INTEGER,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   date_naissance DATE NOT NULL,
   num_inscription VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_etudiant)
);

CREATE TABLE Semestre(
   id_semestre INTEGER,
   description VARCHAR(50) NOT NULL,
   session DATE NOT NULL,
   PRIMARY KEY(id_semestre)
);

CREATE TABLE Resultat(
   id_resultat INTEGER,
   mention VARCHAR(50) NOT NULL,
   note_min NUMERIC(4,2) NOT NULL,
   note_max NUMERIC(4,2) NOT NULL,
   PRIMARY KEY(id_resultat)
);

CREATE TABLE Examen(
   id_examen INTEGER,
   note NUMERIC(4,2) NOT NULL,
   id_etudiant INTEGER,
   id_semestre INTEGER,
   id_matiere INTEGER,
   PRIMARY KEY(id_examen),
   FOREIGN KEY(id_etudiant) REFERENCES Etudiant(id_etudiant),
   FOREIGN KEY(id_semestre) REFERENCES Semestre(id_semestre),
   FOREIGN KEY(id_matiere) REFERENCES Matiere(id_matiere)
);

CREATE TABLE Inscri_semestre(
   id_etudiant INTEGER,
   id_semestre INTEGER,
   PRIMARY KEY(id_etudiant, id_semestre),
   FOREIGN KEY(id_etudiant) REFERENCES Etudiant(id_etudiant),
   FOREIGN KEY(id_semestre) REFERENCES Semestre(id_semestre)
);

CREATE TABLE Matiere_semestre(
   id_matiere INTEGER,
   id_semestre INTEGER,
   PRIMARY KEY(id_matiere, id_semestre),
   FOREIGN KEY(id_matiere) REFERENCES Matiere(id_matiere),
   FOREIGN KEY(id_semestre) REFERENCES Semestre(id_semestre)
);

CREATE TABLE Annee(
   id_annee INTEGER,
   annee VARCHAR(9) NOT NULL,
   PRIMARY KEY(id_annee)
);

ALTER TABLE Semestre ADD COLUMN id_annee INTEGER;
ALTER TABLE Semestre ADD FOREIGN KEY(id_annee) REFERENCES Annee(id_annee);
