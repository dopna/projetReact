@react.component
let make = (~addTask: string => unit) => {
  let (task, setTask) = React.useState(() => "")

  let handleSubmit = () => {
    if (task !== "") {
      addTask(task)
     setTask(prevTask => "")   // Réinitialiser la tâche correctement
    }
  }

  <div className="flex flex-col items-center">
    <h1 className="font-bold" style={ReactDOM.Style.make(~fontFamily="Times New Roman", ~fontSize="15px", ())}>
      {"Gestionnaire de tâches minimaliste"->React.string}
    </h1>
    <h2 className="text-xl " style={ReactDOM.Style.make( ~fontSize="15px", ())}>
      {"Liste de Tâches"->React.string}
    </h2>
    <form className="task-input mt-4" onSubmit={_ => {
      handleSubmit() // Appeler handleSubmit à la soumission
      // Éviter la soumission par défaut
    }}>
      <input
        value=task
        onChange={e => setTask(_ => ReactEvent.Form.target(e)["value"])}
        placeholder="Ajouter une nouvelle tâche..."
        className="border border-gray-300 rounded-l-md p-2 flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500" // Styles pour l'input
      />
      <button 
        type_="submit" 
        className="ml-2 p-2 bg-blue-500 text-white rounded-md hover:bg-blue-600" // Styles pour le bouton
      >
        {"Ajouter"->React.string}
      </button>
    </form>
  </div>
}