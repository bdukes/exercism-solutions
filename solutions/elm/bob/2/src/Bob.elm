module Bob exposing (hey)

import Char
import Regex
import String

isShouting : String -> Bool
isShouting text =
    String.any Char.isUpper text && not (String.any Char.isLower text)

isQuestion : String -> Bool
isQuestion text =
    text
        |> String.trim
        |> String.endsWith "?"

isWhitespace : String -> Bool
isWhitespace text =
    text
        |> Regex.contains (Regex.fromString "^\\s*$" |> Maybe.withDefault Regex.never)

hey : String -> String
hey text =
    if isShouting text then
        if isQuestion text then 
          "Calm down, I know what I'm doing!"
        else
            "Whoa, chill out!"
    else if isQuestion text then
        "Sure."
    else if isWhitespace text then
        "Fine. Be that way!"
    else
        "Whatever."