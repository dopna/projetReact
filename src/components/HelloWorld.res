@react.component
let make = (~name) => {
    <h1>{React.string(`Hello, ${name}!`)} </h1>
}