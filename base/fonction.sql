CREATE OR REPLACE FUNCTION generer_etudiants(nb_etudiants INTEGER) RETURNS VOID AS $$
DECLARE
    i INTEGER;
    semestre_id INTEGER;
BEGIN
    FOR i IN 1..nb_etudiants LOOP
        INSERT INTO Etudiant (id_etudiant, nom, prenom, date_naissance, num_inscription)
        VALUES (
            i,
            'Nom' || i,
            'Prenom' || i,
            DATE '1990-01-01' + (RANDOM() * (365 * 20))::INTEGER,
            '2023A' || LPAD(i::TEXT, 5, '0')
        );
        semestre_id := (RANDOM() * 1 + 1)::INTEGER; -- Sélectionne un ou deux semestres aléatoirement
        INSERT INTO Inscri_semestre (id_etudiant, id_semestre)
        VALUES (i, semestre_id);
        IF semestre_id = 2 THEN -- Si le semestre sélectionné est le deuxième, inscrit également dans le premier semestre
            INSERT INTO Inscri_semestre (id_etudiant, id_semestre)
            VALUES (i, 1);
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Appel de la fonction
SELECT generer_etudiants(80000);

CREATE OR REPLACE FUNCTION generer_examens(nb_examens INTEGER) RETURNS VOID AS $$
DECLARE
    i INTEGER;
    etudiant_id INTEGER;
    semestre_id INTEGER;
    matiere_id INTEGER;
BEGIN
    FOR i IN 1..nb_examens LOOP
        etudiant_id := (RANDOM() * 79999 + 1)::INTEGER;
        semestre_id := (RANDOM() * 1 + 1)::INTEGER;
        matiere_id := (RANDOM() * 11 + 1)::INTEGER;
        
        IF NOT EXISTS (
            SELECT 1
            FROM Matiere_semestre
            WHERE id_matiere = matiere_id AND id_semestre = semestre_id
        ) THEN
            CONTINUE;
        END IF;
        
        IF EXISTS (
            SELECT 1
            FROM Examen
            WHERE id_etudiant = etudiant_id AND id_matiere = matiere_id AND id_semestre = semestre_id
        ) THEN
            CONTINUE;
        END IF;
        
        INSERT INTO Examen (id_examen, note, id_etudiant, id_semestre, id_matiere)
        VALUES (
            i,
            ROUND((RANDOM() * 12 + 8)::NUMERIC, 1),
            etudiant_id,
            semestre_id,
            matiere_id
        );
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Appel de la fonction
SELECT generer_examens(800000);