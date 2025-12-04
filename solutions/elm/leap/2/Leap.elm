module Leap (isLeapYear) where


divisibleBy : Int -> Int -> Bool
divisibleBy num val =
  val % num == 0


isLeapYear : Int -> Bool
isLeapYear year =
  divisibleBy 4 year
    && (not (divisibleBy 100 year)
      || divisibleBy 400 year)