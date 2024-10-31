@react.component
let make = (~addTask: (string, string) => unit) => {
  // Définition des états pour le titre et la description
  let (title, setTitle) = React.useState(() => "")
  let (description, setDescription) = React.useState(() => "")

  let handleSubmit = () => {
    if (title !== "" && description !== "") {
      // Appel de la fonction addTask avec le titre et la description
      addTask(title, description)
      // Réinitialisation des champs après l'ajout
      setTitle(_ => "")
      setDescription(_ => "")
    }
  }

  <div className="flex flex-col items-center p-4 bg-gray-900 text-black rounded-lg">
    // Titre principal de la page
    <h1 className="font-bold mb-2 text-white" style={ReactDOM.Style.make(~fontFamily="Times New Roman", ~fontSize="15px", ())}>
      {"Gestionnaire de tâches minimaliste"->React.string}
    </h1>

    // Titre de la liste
   <h2 className="text-xl mb-4 text-white" style={ReactDOM.Style.make(~fontSize="13px", ())}>
      {"Liste de Tâches"->React.string}
    </h2>   <form 
  className="flex flex-col sm:flex-row items-center space-y-4 sm:space-y-0 sm:space-x-4"
  onSubmit={event => {
    event->ReactEvent.Form.preventDefault
    handleSubmit() // Appeler handleSubmit à la soumission
  }}
>
      // Champ pour le titre de la tâche
      <div className="flex flex-col ">
        <label className="text-sm mb-1 text-white">{"Title:"->React.string}</label>
        <input
          value=title
          onChange={e => setTitle(_ => ReactEvent.Form.target(e)["value"]) }
          placeholder="What's the title of your To Do?"
          className="border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      // Champ pour la description de la tâche
      <div className="flex flex-col ">
        <label className="text-sm mb-1 text-white">{"Description:"->React.string}</label>
        <input
          value=description
          onChange={e => setDescription(_ => ReactEvent.Form.target(e)["value"]) }
          placeholder="What's the description of your To Do?"
          className="border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      // Bouton "Add" pour ajouter la tâche
      <button 
        type_="submit"
        className="p-2 bg-green-500 text-white rounded-md hover:bg-green-200"
      >
        {"Add"->React.string}
      </button>
    </form>
       
  </div>
  
}