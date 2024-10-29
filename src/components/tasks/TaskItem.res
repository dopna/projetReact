type taskType = {
  text: string,
  isComplete: bool,
}
@react.component
let make = (~task: taskType, ~completeTask: unit => unit, ~removeTask: unit => unit) => {
  <div className={"task-item " ++ (task.isComplete ? "completed" : "")}>
    <span onClick={_ => completeTask()} className="task-text">
      {task.text->React.string}  // Utilisez task.text pour accéder au champ text
    </span>
    <button onClick={_ => removeTask()} className="remove-button">
      {"Supprimer"->React.string}
    </button>
  </div>
}