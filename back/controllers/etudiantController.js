const pool = require('../models/db');
const createErrorResponse = require('../utils/errorHandler');

// Étudiants inscrits pour un semestre
const getEtudiantsSemestre = async (req, res) => {
  try {
    const { semestre } = req.params;
    const result = await pool.query(
      'SELECT e.nom, e.prenom FROM Inscri_semestre ins JOIN Etudiant e ON ins.id_etudiant = e.id_etudiant WHERE ins.id_semestre = $1 LIMIT 100',
      [semestre]
    );
    res.json({ status: 'success', data: result.rows, error: null });
  } catch (error) {
    res.status(500).json(createErrorResponse(500, 'Erreur serveur', error.message));
  }
};

// Matières d'un semestre
const getMatieresSemestre = async (req, res) => {
  try {
    const { semestre } = req.params;
    const result = await pool.query(
      'SELECT m.intitule FROM Matiere_semestre ms JOIN Matiere m ON ms.id_matiere = m.id_matiere WHERE ms.id_semestre = $1',
      [semestre]
    );
    res.json({ status: 'success', data: result.rows, error: null });
  } catch (error) {
    res.status(500).json(createErrorResponse(500, 'Erreur serveur', error.message));
  }
};

// Notes d'un étudiant pour un semestre
const getNotesEtudiantSemestre = async (req, res) => {
  try {
    const { etudiant, semestre } = req.params;
    const result = await pool.query(
      'SELECT m.intitule, ex.note FROM Examen ex JOIN Matiere m ON ex.id_matiere = m.id_matiere WHERE ex.id_etudiant = $1 AND ex.id_semestre = $2',
      [etudiant, semestre]
    );
    res.json({ status: 'success', data: result.rows, error: null });
  } catch (error) {
    res.status(500).json(createErrorResponse(500, 'Erreur serveur', error.message));
  }
};

// Notes d'un étudiant pour une année
const getNotesEtudiantAnnee = async (req, res) => {
  try {
    const { etudiant, annee } = req.params;
    const result = await pool.query(
      'SELECT m.intitule, ex.note, s.description FROM Examen ex JOIN Matiere m ON ex.id_matiere = m.id_matiere JOIN Semestre s ON ex.id_semestre = s.id_semestre WHERE ex.id_etudiant = $1 AND s.id_annee = $2',
      [etudiant, annee]
    );
    res.json({ status: 'success', data: result.rows, error: null });
  } catch (error) {
    res.status(500).json(createErrorResponse(500, 'Erreur serveur', error.message));
  }
};

// Semestres d'une année
const getSemestresAnnee = async (req, res) => {
  try {
    const { annee } = req.params;
    const result = await pool.query(
      'SELECT s.description FROM Semestre s WHERE s.id_annee = $1',
      [annee]
    );
    res.json({ status: 'success', data: result.rows, error: null });
  } catch (error) {
    res.status(500).json(createErrorResponse(500, 'Erreur serveur', error.message));
  }
};

// Mention pour une note
const getMentionPourNote = async (req, res) => {
  try {
    const { note } = req.params;
    const result = await pool.query(
      'SELECT r.mention FROM Resultat r WHERE $1 BETWEEN r.note_min AND r.note_max',
      [note]
    );
    res.json({ status: 'success', data: result.rows, error: null });
  } catch (error) {
    res.status(500).json(createErrorResponse(500, 'Erreur serveur', error.message));
  }
};

module.exports = {
  getEtudiantsSemestre,
  getMatieresSemestre,
  getNotesEtudiantSemestre,
  getNotesEtudiantAnnee,
  getSemestresAnnee,
  getMentionPourNote,
};