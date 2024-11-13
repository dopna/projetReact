@react.component
let make = () => {
  let (username, setUsername) = React.useState(() => "")
  let (password, setPassword) = React.useState(() => "")
  let (email, setEmail) = React.useState(() => "")

  let handleSubmit = (event) => {
    event->ReactEvent.Form.preventDefault // Évite la soumission par défaut
    if (username !== "" && password !== "" && email !== "") {
      // Ici, vous pouvez ajouter la logique de soumission
      Js.log2("Nom d'utilisateur:", username)
      Js.log2("Mot de passe:", password)
      Js.log2("Email:", email)

      // Réinitialiser les champs
      setUsername((_) => "")
      setPassword((_) => "")
      setEmail((_) => "")
      
      // Redirection ou autre action après la soumission
     // RescriptReactRouter.push("home") // Redirection vers la page d'accueil, par exemple
     RescriptReactRouter.push("login") // Assurez-vous que "login" est le chemin correct pour la page de connexion

    } else {
      Js.log("Veuillez remplir tous les champs.")
    }
  }
  <div className= "flex flex-col items-center mt-10 backgroundColor #f0f4f8" >

    <div className="flex flex-col items-center mt-10" style={ReactDOM.Style.make(~width= "600px", ~borderWidth= "10px", ~borderColor="bleu",())}>
        <h1 className="text-2xl font-bold mb-4">{"Page d'Inscription"->React.string}</h1>
        <form className="w-1/3" onSubmit={handleSubmit}>
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
        <input
            type_="email"
            value=email
            onChange={e => setEmail(ReactEvent.Form.target(e)["value"])}
            placeholder="Email"
            className="border border-gray-300 rounded-md p-2 mb-4 w-full focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <button 
            type_="submit" 
            className="p-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 w-full"
        >
            {"S'inscrire"->React.string}
        </button>
        </form>
    </div>
    </div>
}