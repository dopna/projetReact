
@react.component
let make = (~tasks, ~completeTask, ~removeTask) => {
  <div className="task-list">
    {tasks->Array.mapWithIndex((task, index) =>
      <TaskItem
        key={index->string_of_int}
        task
        completeTask={() => completeTask(index)}
        removeTask={() => removeTask(index)}
      />
    )->React.array}
  </div>
}