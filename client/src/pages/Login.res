
@react.component
let make = () => {
  let (username, setUsername) = React.useState(() => "")
  let (password, setPassword) = React.useState(() => "")

  let handleSubmit = () => {
    if (username !== "admin" && password !== "admin") {
      //onSubmit(username, password) // Appelle la fonction de soumission
      setUsername((_) => "") // Réinitialise le champ nom d'utilisateur
      setPassword((_) => "") // Réinitialise le champ mot de passe
    }
  }

  <div className="flex flex-col items-center mt-10">
    <h1 className="text-2xl font-bold mb-4">{"Page de Connexion"->React.string}</h1>
    <form className="w-1/3" onSubmit={_ => {
      handleSubmit()
             // Évite la soumission par défaut
     
    }}>
      <input
        type_="text" 
        value=username
        
        onChange={e => setUsername(ReactEvent.Form.target(e)["value"])}
        placeholder="Nom d'utilisateur"
        className="border border-gray-300 rounded-md p-2 mb-4 w-full focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
      <input
        type_="password"
        value=password
        onChange={e => setPassword(ReactEvent.Form.target(e)["value"])}
        placeholder="Mot de passe"
        className="border border-gray-300 rounded-md p-2 mb-4 w-full focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
      <button onClick={_event => {
        RescriptReactRouter.push("tasks")
      }}
        type_="submit" 
        className="p-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 w-full"
      >
        {"Se connecter"->React.string}
      </button>
    </form>
  </div>
}