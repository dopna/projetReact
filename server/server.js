const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');
const cors = require('cors');

// Initialisation de l'application Express
const app = express();
const port = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Connexion à la base de données SQLite
const db = new sqlite3.Database('./tasks.db', (err) => {
  if (err) {
    console.error("Erreur lors de la connexion à la base de données:", err.message);
  } else {
    console.log("Connecté à SQLite!");
  }
});

// Création de la table "tasks" si elle n'existe pas déjà
db.run(`
  CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    isComplete INTEGER DEFAULT 0
  )
`, (err) => {
  if (err) {
    console.error("Erreur lors de la création de la table:", err.message);
  } else {
    console.log("Table 'tasks' prête.");
  }
});

// Routes

// Récupérer toutes les tâches
app.get('/tasks', (req, res) => {
  db.all('SELECT * FROM tasks', [], (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json(rows);
  });
});

// Ajouter une nouvelle tâche
app.post('/tasks', (req, res) => {
  const { title, description } = req.body;
  db.run(`INSERT INTO tasks (title, description) VALUES (?, ?)`, [title, description], function (err) {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json({ id: this.lastID, title, description, isComplete: 0 });
  });
});

// Mettre à jour une tâche
app.put('/tasks/:id', (req, res) => {
  const { id } = req.params;
  const { title, description, isComplete } = req.body;
  db.run(`
    UPDATE tasks 
    SET title = ?, description = ?, isComplete = ? 
    WHERE id = ?
  `, [title, description, isComplete, id], function (err) {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json({ message: "Tâche mise à jour." });
  });
});

// Supprimer une tâche
app.delete('/tasks/:id', (req, res) => {
  const { id } = req.params;
  db.run(`DELETE FROM tasks WHERE id = ?`, [id], function (err) {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json({ message: "Tâche supprimée." });
  });
});

// Démarrage du serveur
app.listen(port, () => {
  console.log(`Serveur Express démarré sur http://localhost:${port}`);
});