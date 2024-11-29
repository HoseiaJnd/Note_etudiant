const express = require('express');
const cors = require('cors');
const {
  getEtudiantsSemestre,
  getMatieresSemestre,
  getNotesEtudiantSemestre,
  getNotesEtudiantAnnee,
  getSemestresAnnee,
  getMentionPourNote,
} = require('./controllers/etudiantController');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get('/etudiants/semestre/:semestre', getEtudiantsSemestre);
app.get('/matieres/semestre/:semestre', getMatieresSemestre);
app.get('/notes/etudiant/:etudiant/semestre/:semestre', getNotesEtudiantSemestre);
app.get('/notes/etudiant/:etudiant/annee/:annee', getNotesEtudiantAnnee);
app.get('/semestres/annee/:annee', getSemestresAnnee);
app.get('/mention/note/:note', getMentionPourNote);

app.listen(port, () => {
  console.log(`Serveur en cours d'exécution sur le port: ${port}`);
});