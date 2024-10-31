

type task = TaskItem.taskType

type action =
  | Modify(task)
  | Delete(task)

@react.component
let make = (~tasks: array<task>, ~onModify, ~onDelete) => {

    <div className="container mx-auto mt-8">
      <table className="min-w-full bg-white">
        <thead>
          <tr>
           <th className="py-2 px-4 border-b">{"ID"->React.string}</th>
            <th className="py-2 px-4 border-b">{"Titre"->React.string}</th>
            <th className="py-2 px-4 border-b">{"Description"->React.string}</th>
            <th className="py-2 px-4 border-b">{"Actions"->React.string}</th>
          </tr>
        </thead>
        <tbody>
          {tasks->Array.map(task =>
            <tr key=task.title>
             //<td className="py-2 px-4 border-b">{task->React.string}</td>
              <td className="py-2 px-4 border-b">{task.title->React.string}</td>
              <td className="py-2 px-4 border-b">{task.description->React.string}</td>
              <td className="py-2 px-4 border-b">
                <button className="bg-green-500 text-white px-4 py-2 rounded mr-2" onClick={_ => onModify(task)}>
                  {React.string("Modifier")} 
                </button>
                <button className="bg-red-500 text-white px-4 py-2 rounded" onClick={_ => onDelete(task.id)}>
                  {React.string("Supprimer")}
                </button>
              </td>
            </tr>
          )->React.array}
        </tbody>
      </table>
    </div>
}