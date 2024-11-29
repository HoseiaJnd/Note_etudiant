-- Sélectionne le nom et le prénom des étudiants inscrits au semestre 1
SELECT e.nom, e.prenom
FROM Inscri_semestre ins
JOIN Etudiant e ON ins.id_etudiant = e.id_etudiant
WHERE ins.id_semestre = 1 LIMIT 100;

SELECT e.nom, e.prenom
FROM Inscri_semestre ins
JOIN Etudiant e ON ins.id_etudiant = e.id_etudiant
WHERE ins.id_semestre = 2 LIMIT 100;

-- Sélectionne l'intitulé des matières du semestre 1
SELECT m.intitule
FROM Matiere_semestre ms
JOIN Matiere m ON ms.id_matiere = m.id_matiere
WHERE ms.id_semestre = 1;

SELECT m.intitule
FROM Matiere_semestre ms
JOIN Matiere m ON ms.id_matiere = m.id_matiere
WHERE ms.id_semestre = 2;

-- Sélectionne l'intitulé et la note des examens de l'étudiant 1 au semestre 1
SELECT m.intitule, ex.note
FROM Examen ex
JOIN Matiere m ON ex.id_matiere = m.id_matiere
WHERE ex.id_etudiant = 1 AND ex.id_semestre = 1;

-- Sélectionne l'intitulé, la note et la description du semestre des examens de l'étudiant 1 au semestre 1 de l'année 1
SELECT m.intitule, ex.note, s.description
FROM Examen ex
JOIN Matiere m ON ex.id_matiere = m.id_matiere
JOIN Semestre s ON ex.id_semestre = s.id_semestre
WHERE ex.id_etudiant = 1 AND s.id_annee = 1;

-- Sélectionne la description du semestre de l'année 1
SELECT s.description
FROM Semestre s
WHERE s.id_annee = 1;

-- Sélectionne la mention correspondant à une note de 12.5
SELECT r.mention
FROM Resultat r
WHERE 12.5 BETWEEN r.note_min AND r.note_max;

DELETE FROM examen
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM examen
    GROUP BY id_etudiant, id_matiere, id_semestre
);

URL : http://localhost:3000/etudiants/semestre/:semestre
Exemple : http://localhost:3000/etudiants/semestre/1
2. Matières d'un semestre
Méthode : GET
URL : http://localhost:3000/matieres/semestre/:semestre
Exemple : http://localhost:3000/matieres/semestre/1
3. Notes d'un étudiant pour un semestre
Méthode : GET
URL : http://localhost:3000/notes/etudiant/:etudiant/semestre/:semestre
Exemple : http://localhost:3000/notes/etudiant/1/semestre/1
4. Notes d'un étudiant pour une année
Méthode : GET
URL : http://localhost:3000/notes/etudiant/:etudiant/annee/:annee
Exemple : http://localhost:3000/notes/etudiant/1/annee/1
5. Semestres d'une année
Méthode : GET
URL : http://localhost:3000/semestres/annee/:annee
Exemple : http://localhost:3000/semestres/annee/1
6. Mention pour une note
Méthode : GET
URL : http://localhost:3000/mention/note/:note
Exemple : http://localhost:3000/mention/note/12.5