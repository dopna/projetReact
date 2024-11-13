open TaskItem
open TaskTable
type task = {
  id: int, 
  title: string,
  description: string,
  isComplete: bool
}

@react.component
let make = () => {
  let (tasks, setTasks) = React.useState(() => ([]: array<TaskItem.taskType>))

  React.useEffect(() => {
    Console.log("init")
    None
  }, [])

  // Fonction pour ajouter une tâche avec title et description
  let addTask = (title: string, description: string) => {
    let newTask: TaskItem.taskType = { id: Js.Date.now() |> int_of_float, title, description, isComplete: false }
    setTasks(tasks => [...tasks, newTask])
  }

  // Fonction pour compléter une tâche
  let completeTask = index => setTasks(tasks => 
    tasks->Array.mapWithIndex((task, i) => 
      if i === index { {...task, isComplete: !task.isComplete}} else {task}
    )
  )

  // Fonction pour supprimer une tâche avec `id`
  let removeTask = id => setTasks(tasks =>
    tasks->Array.filter(task => task.id !== id)
  );

  <div className="p-6">
     <header className="flex items-center justify-between p-4 bg-blue-500 text-white">
    // titre
    <div className="text-lg font-bold">
      {"Gestion des Tâches"->React.string}
    </div>
    
    // Menu de navigation
    <nav>
      <ul className="flex space-x-4">
        <li>
          <a href="#" className="hover:underline">{"Accueil"->React.string}</a>
        </li>
        <li>
          <a href="#" className="hover:underline">{"À propos"->React.string}</a>
        </li>
        <li>
          <a href="#" className="hover:underline">{"contact"->React.string}</a>
        </li>
      </ul>
    </nav>
  </header>
    /* Titre principal */
    <h1 className="text-3xl font-semibold"> {"Liste de Tâches"->React.string} </h1>

    /* Formulaire pour ajouter une tâche */
    <TaskInput addTask={addTask} /> // Envoie `addTask` avec deux paramètre s

    /* Liste de tâches */
    <TaskList tasks={tasks} completeTask={completeTask} removeTask={removeTask} />

    /* Tableau des tâches */
    <TaskTable tasks={tasks} onModify={(_) => ()} onDelete={(_) => ()} />
   
  </div>
}