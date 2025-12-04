module [convert]

convert : U64 -> Str
convert = \number ->
    []
        |> List.appendIfOk (getDropSound number 3 "Pling")
        |> List.appendIfOk (getDropSound number 5 "Plang")
        |> List.appendIfOk (getDropSound number 7 "Plong")
        |> ifEmpty (Num.toStr number)
        |> Str.joinWith ""

getDropSound : U64, U64, Str -> Result Str _
getDropSound = \number, multiplier, sound ->
    if number % multiplier == 0 then
        Ok sound
    else
        Err WasNotAMultiple

ifEmpty : List a, a -> List a
ifEmpty = \values, default ->
    if List.isEmpty values then
        [default]
    else
        values