@react.component
let make = (~text, ~description) => {
  // États pour stocker les valeurs du texte et de la description de la tâche
  let (text, setText) = React.useState(() => text)
  let (description, setDescription) = React.useState(() => description)

  // États pour stocker les valeurs initiales de la tâche (pour réinitialiser avec "Annuler")
  let initialText = "Texte de la tâche initial"
  let initialDescription = "Description de la tâche initiale"

  // State hooks to manage the modified text and description
let (currentText, setCurrentText) = React.useState(() => initialText)
let (currentDescription, setCurrentDescription) = React.useState(() => initialDescription)


  // Fonction pour gérer la soumission du formulaire
  let handleSubmit = (event) => {
    event->ReactEvent.Form.preventDefault

   
  }

  // Fonction pour gérer l'annulation des modifications
  let handleCancel = (_) => {
    setText(_ => initialText)
    setDescription(_ => initialDescription)
  }
  // Fonction pour gérer le OK des modifications
  let handleOk = (_: unit) => {
  // Here you apply the changes to the state or to the task list
  setText(_ => currentText)
  setDescription(_ => currentDescription)
}

  <div className="border border-gray-300 shadow-md p-6 rounded-lg w-3/4 bg-white">
    <h1 className="text-2xl font-bold mb-2">{"Modifier la Tâche"->React.string}</h1>
    <form className="w-1/3" onSubmit={handleSubmit}>
     // Label pour le champ de texte
      <label className="block text-gray-700 font-bold mb-2" htmlFor="taskText">
        {"TiTRE :"->React.string}
      </label>
      <input
        type_="text"
        value=text
        onChange={e => setText(ReactEvent.Form.target(e)["value"])}
        placeholder="Modifier le texte de la tâche"
        className="border border-gray-300 rounded-md p-2 mb-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
         // Label pour le champ de description
      <label className="block text-gray-700 font-bold mb-2" htmlFor="taskDescription">
        {"DESCRIPTION :"->React.string}
      </label>
      <textarea
        value=description
        onChange={e => setDescription(ReactEvent.Form.target(e)["value"])}
        placeholder="Modifier la description de la tâche"
        className="border border-gray-300 rounded-md p-2 mb-4 w-full focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
      <div className="flex space-x-4">

        <button 
         type_="text"

          className="p-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 w-1/2"
        >
          {"OK"->React.string}
        </button>
        <button
          type_="button"
          onClick={handleCancel}
          className="p-2 bg-gray-300 text-black rounded-md hover:bg-gray-400 w-1/1"
        >
          {"Annuler"->React.string}
        </button>
      </div>
    </form>
  </div>
}