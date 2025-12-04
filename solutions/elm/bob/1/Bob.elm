module Bob (hey) where

import Char
import Regex
import String

isShouting : String -> Bool
isShouting text =
  String.any Char.isUpper text && not (String.any Char.isLower text)

isQuestion : String -> Bool
isQuestion text =
  String.endsWith "?" text

isWhitespace : String -> Bool
isWhitespace text =
  Regex.contains (Regex.regex "^\\s*$") text

hey : String -> String
hey text =
  if isShouting text then
    "Whoa, chill out!"
  else if isQuestion text then
    "Sure."
  else if isWhitespace text then
    "Fine. Be that way!"
  else
    "Whatever."