-- Année
INSERT INTO Annee (id_annee, annee) VALUES
(1, '2023-2024');

-- Semestres
INSERT INTO Semestre (id_semestre, description, session, id_annee) VALUES
(1, 'Semestre 1', '2023-09-01', 1),
(2, 'Semestre 2', '2024-01-01', 1);

-- Matières dans le domaine de l'informatique
INSERT INTO Matiere (id_matiere, cle_matiere, intitule, credits) VALUES
(1, 'INF101', 'Introduction à l informatique', 4),
(2, 'INF102', 'Programmation en Python', 3),
(3, 'INF103', 'Systemes d exploitation', 3),
(4, 'INF104', 'Reseaux informatiques', 3),
(5, 'INF105', 'Bases de donnees', 2),
(6, 'INF106', 'Securite informatique', 2),
(7, 'INF201', 'Analyse de données', 4),
(8, 'INF202', 'Developpement web', 3),
(9, 'INF203', 'Intelligence artificielle', 3),
(10, 'INF204', 'Systemes embarques', 3),
(11, 'INF205', 'Gestion de projet', 2),
(12, 'INF206', 'Cyber-sécurit', 2);

-- Étudiants
INSERT INTO Etudiant (id_etudiant, nom, prenom, date_naissance, num_inscription) VALUES
(1, 'Dupont', 'Jean', '2000-01-01', '2023A001'),
(2, 'Martin', 'Marie', '1999-05-15', '2023A002'),
(3, 'Durand', 'Paul', '2001-03-22', '2023A003'),
(4, 'Lefevre', 'Sophie', '2000-07-30', '2023A004'),
(5, 'Moreau', 'Luc', '1998-11-11', '2023A005');

-- Inscriptions aux semestres
INSERT INTO Inscri_semestre (id_etudiant, id_semestre) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2),
(3, 1), (3, 2),
(4, 1), (4, 2),
(5, 1), (5, 2);

-- Matières par semestre
INSERT INTO Matiere_semestre (id_matiere, id_semestre) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1),
(7, 2), (8, 2), (9, 2), (10, 2), (11, 2), (12, 2);

-- Examens
INSERT INTO Examen (id_examen, note, id_etudiant, id_semestre, id_matiere) VALUES
(1, 12.5, 1, 1, 1), (2, 14.0, 1, 1, 2), (3, 15.0, 1, 1, 3),
(4, 16.0, 1, 1, 4), (5, 17.0, 1, 1, 5), (6, 18.0, 1, 1, 6),
(7, 10.0, 2, 1, 1), (8, 11.0, 2, 1, 2), (9, 12.0, 2, 1, 3),
(10, 13.0, 2, 1, 4), (11, 14.0, 2, 1, 5), (12, 15.0, 2, 1, 6),
(13, 9.0, 3, 1, 1), (14, 10.0, 3, 1, 2), (15, 11.0, 3, 1, 3),
(16, 12.0, 3, 1, 4), (17, 13.0, 3, 1, 5), (18, 14.0, 3, 1, 6),
(19, 15.0, 4, 1, 1), (20, 16.0, 4, 1, 2), (21, 17.0, 4, 1, 3),
(22, 18.0, 4, 1, 4), (23, 19.0, 4, 1, 5), (24, 20.0, 4, 1, 6),
(25, 8.0, 5, 1, 1), (26, 9.0, 5, 1, 2), (27, 10.0, 5, 1, 3),
(28, 11.0, 5, 1, 4), (29, 12.0, 5, 1, 5), (30, 13.0, 5, 1, 6);

-- Résultats
INSERT INTO Resultat (id_resultat, mention, note_min, note_max) VALUES
(1, 'P', 10.00, 11.99),
(2, 'AB', 12.00, 13.99),
(3, 'B', 14.00, 15.99),
(4, 'TB', 16.00, 20.00),
(5, 'AJ', 0.00, 9.99);