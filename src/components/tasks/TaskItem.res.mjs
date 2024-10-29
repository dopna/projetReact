// Generated by ReScript, PLEASE EDIT WITH CARE

import * as JsxRuntime from "react/jsx-runtime";

function TaskItem(props) {
  var removeTask = props.removeTask;
  var completeTask = props.completeTask;
  var task = props.task;
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsx("span", {
                      children: task.text,
                      className: "task-text",
                      onClick: (function (param) {
                          completeTask();
                        })
                    }),
                JsxRuntime.jsx("button", {
                      children: "Supprimer",
                      className: "remove-button",
                      onClick: (function (param) {
                          removeTask();
                        })
                    })
              ],
              className: "task-item " + (
                task.isComplete ? "completed" : ""
              )
            });
}

var make = TaskItem;

export {
  make ,
}
/* react/jsx-runtime Not a pure module */
