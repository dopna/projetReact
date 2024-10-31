// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as JsxRuntime from "react/jsx-runtime";

function Login(props) {
  var match = React.useState(function () {
        return "";
      });
  var setUsername = match[1];
  var username = match[0];
  var match$1 = React.useState(function () {
        return "";
      });
  var setPassword = match$1[1];
  var password = match$1[0];
  var handleSubmit = function () {
    if (username !== "" && password !== "") {
      setUsername(function (param) {
            return "";
          });
      return setPassword(function (param) {
                  return "";
                });
    }
    
  };
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsx("h1", {
                      children: "Page de Connexion",
                      className: "text-2xl font-bold mb-4"
                    }),
                JsxRuntime.jsxs("form", {
                      children: [
                        JsxRuntime.jsx("input", {
                              className: "border border-gray-300 rounded-md p-2 mb-4 w-full focus:outline-none focus:ring-2 focus:ring-blue-500",
                              placeholder: "Nom d'utilisateur",
                              type: "text",
                              value: username,
                              onChange: (function (e) {
                                  setUsername(e.target.value);
                                })
                            }),
                        JsxRuntime.jsx("input", {
                              className: "border border-gray-300 rounded-md p-2 mb-4 w-full focus:outline-none focus:ring-2 focus:ring-blue-500",
                              placeholder: "Mot de passe",
                              type: "password",
                              value: password,
                              onChange: (function (e) {
                                  setPassword(e.target.value);
                                })
                            }),
                        JsxRuntime.jsx("button", {
                              children: "Se connecter",
                              className: "p-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 w-full",
                              type: "submit"
                            })
                      ],
                      className: "w-1/3",
                      onSubmit: (function (param) {
                          handleSubmit();
                        })
                    })
              ],
              className: "flex flex-col items-center mt-10"
            });
}

var make = Login;

export {
  make ,
}
/* react Not a pure module */