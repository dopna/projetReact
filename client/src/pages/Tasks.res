open TaskItem;
open TaskTable;

type task = TaskItem.taskType
type data = {title: string, description: string}

@react.component
let make = () => {
  // État des tâches
  let (tasks, setTasks) = React.useState(() => ([]: array<task>));

  // Charger les tâches au démarrage via l'API
  React.useEffect(() => {
    let getTasks = async () => {
      let response = await Fetch.fetch("http://localhost:3000/tasks", {
        method: #GET
      })
      let json = await Fetch.Response.json(response)
      let data = json -> Js.Json.decodeArray -> Option.map(array => {
        array -> Array.map(item => {
          let object = item -> Js.Json.decodeObject -> Option.getExn
          {
            id: object->Js.Dict.get("id")->Option.getExn->Js.Json.decodeNumber->Option.getExn->Float.toInt,
            title: object->Js.Dict.get("title")->Option.getExn->Js.Json.decodeString->Option.getExn,
            description: object->Js.Dict.get("description")->Option.getExn->Js.Json.decodeString->Option.getExn,
            isComplete: object->Js.Dict.get("isComplete")->Option.getExn->Js.Json.decodeNumber->Option.getExn->Float.toInt === 1,
          }
        })
      }) -> Option.getExn
      
      setTasks(_ => data)
      
    }
    let _ = getTasks()
    
    None;
  }, []);


  // Fonction pour ajouter une tâche via l'API
let addTask = async (title: string, description: string) =>{
  Console.log("plop")
  
  let data = {title, description}
  let body = data->Js.Json.stringifyAny->Belt.Option.getExn->Fetch.Body.string


  let response = await Fetch.fetch(
    "http://localhost:3000/tasks",
    {
      method: #POST,
      body,
      headers: Fetch.Headers.fromObject({
        "Content-type": "application/json",
      }),
    },
  )
     let json = await Fetch.Response.json(response)
      let task = json->Js.Json.decodeObject->Option.map(obj => {
        {
          id: obj->Js.Dict.get("id")->Option.getExn->Js.Json.decodeNumber->Option.getExn->Float.toInt,
          title: obj->Js.Dict.get("title")->Option.getExn->Js.Json.decodeString->Option.getExn,
          description: obj->Js.Dict.get("description")->Option.getExn->Js.Json.decodeString->Option.getExn,
          isComplete: obj->Js.Dict.get("isComplete")->Option.getExn->Js.Json.decodeNumber->Option.getExn->Float.toInt === 1,
        }
      })
     switch task {
      | Some(task) => setTasks(tasks => Array.concat(tasks, [task]))
      }

 }
  // Fonction pour compléter une tâche (via l'API)
  let completeTask = _id => {
    ()
  }

  // Fonction pour supprimer une tâche via l'API
  let removeTask = async (id: int) => {
  let url = "http://localhost:3000/tasks/" ++ string_of_int(id)

  // Envoyer la requête DELETE
  let _ = await Fetch.fetch(
    url,
    {
      method: #DELETE,
    }
  )
    // Mise à jour locale des tâches
      setTasks(_ => tasks->Array.filter(task => task.id !== id))

}
  <div className="p-6">
    <header className="flex items-center justify-between p-4 bg-blue-500 text-white">
      /* Titre */
      <div className="text-lg font-bold">
        {"Gestion des Tâches"->React.string}
      </div>

      /* Menu de navigation */
      <nav>
        <ul className="flex space-x-4">
          <li>
            <a href="#" className="hover:underline">{"Accueil"->React.string}</a>
          </li>
          <li>
            <a href="#" className="hover:underline">{"À propos"->React.string}</a>
          </li>
          <li>
            <a href="#" className="hover:underline">{"Contact"->React.string}</a>
          </li>
        </ul>
      </nav>
    </header>

    

    /* Formulaire pour ajouter une tâche */
    <TaskInput addTask={addTask} /> /* Envoie `addTask` avec deux paramètres */

    /* Liste de tâches */
    <TaskList tasks={tasks} completeTask={completeTask} removeTask={removeTask} />

    /* Tableau des tâches */
    <TaskTable tasks={tasks} onModify={task => RescriptReactRouter.push("/modifier/"++ task.title ++ "/"++task.description)} onDelete={removeTask} />
   
  </div>
}