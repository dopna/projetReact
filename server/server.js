const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 5173;

app.use(cors());
app.use(express.json());

let tasks = []; // Tableau temporaire pour stocker les tâches

// Route pour récupérer toutes les tâches
app.get('/tasks', (req, res) => {
  res.json(tasks);
});

// Route pour ajouter une nouvelle tâche
app.post('/tasks', (req, res) => {
  const { title, description } = req.body;
  const newTask = { id: Date.now(), title, description, isComplete: false };
  tasks.push(newTask);
  res.status(201).json(newTask);
});

// Route pour mettre à jour une tâche
app.put('/tasks/:id', (req, res) => {
  const { id } = req.params;
  const { title, description, isComplete } = req.body;
  tasks = tasks.map(task =>
    task.id === parseInt(id) ? { ...task, title, description, isComplete } : task
  );
  res.json({ message: 'Task updated' });
});

// Route pour supprimer une tâche
app.delete('/tasks/:id', (req, res) => {
  const { id } = req.params;
  tasks = tasks.filter(task => task.id !== parseInt(id));
  res.json({ message: 'Task deleted' });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});