@react.component
let make = () => {
    let url = RescriptReactRouter.useUrl()
    switch url.path {
    | list{"login"} => <Login />
    | list{"inscription"} => <Inscription />
    | list{"modifier", text, description} => <Modifier text={text} description={description}/>
    | _ => <Tasks />
    }
}