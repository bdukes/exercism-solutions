module HelloWorld (..) where


helloWorld : Maybe String -> String
helloWorld name =
  "Hello, " ++ (Maybe.withDefault "World" name) ++ "!"