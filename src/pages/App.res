open TaskItem
@react.component
let make = () => {
  let (tasks, setTasks) = React.useState(() => [])

  // Fonction pour ajouter une tâche
  let addTask = newTask => setTasks(tasks => [...tasks, {text: newTask, isComplete: false}])

  // Fonction pour compléter une tâche
  let completeTask = index => setTasks(tasks => 
    tasks->Array.mapWithIndex((task, i) => if i === index { {...task, isComplete: !task.isComplete}} else {task})
  )

  // Fonction pour supprimer une tâche
  let removeTask = index => setTasks(tasks => tasks->Array.filterWithIndex((_, i) => i !== index))

  <div className="p-6">
   /* <h1 className="text-3xl font-semibold"> {"Liste de Tâches"->React.string} </h1> */
    
    /* Formulaire pour ajouter une tâche */
    <TaskInput addTask={addTask} />

    /* Liste de tâches */
    <TaskList tasks={tasks} completeTask={completeTask} removeTask={removeTask} />
  </div>
}