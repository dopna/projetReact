
type taskType = {
  id: int,
  title: string,
  description: string,
  isComplete: bool
}

@react.component
let make = (~task: taskType, ~completeTask, ~removeTask) => {
  <div className={"task-item " ++ (task.isComplete ? "completed" : "")}>
   
  /*  <span onClick={_ => completeTask()} className="task-text">
      {React.string(task.title)}
      {" - "->React.string} // Utilisé pour séparer le titre et la description
      {React.string(task.description)}
    </span><button onClick={_ => removeTask()} className="remove-button">
      {"Supprimer"->React.string}
    </button> */ 
  </div>
}