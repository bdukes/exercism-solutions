module Raindrops (raindrops) where

import String

getPrimeFactors : Int -> List Int
getPrimeFactors value =
  let
    addPrimeFactor num factor factors =
      if num <= 1 then
        factors
      else if rem num factor == 0 then
        addPrimeFactor (num // factor) factor (factor :: factors)
      else
        addPrimeFactor num (factor + 1) factors
  in
    addPrimeFactor value 2 []

raindrops : Int -> String
raindrops value =
  let
    factors =
      getPrimeFactors value
    isFactorOf factor =
      List.member factor factors
    getFactorText raindropWord =
      if isFactorOf raindropWord.factor then
        Just raindropWord.text
      else
        Nothing
    raindropWords =
      [ { factor = 3, text = "Pling" }
      , { factor = 5, text = "Plang" }
      , { factor = 7, text = "Plong" }
      ]
    words =
      raindropWords
        |> List.filterMap getFactorText
  in
    if List.isEmpty words then
      toString value
    else
      String.concat words