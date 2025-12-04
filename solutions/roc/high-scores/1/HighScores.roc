module [latest, personalBest, personalTopThree]

Score : U64

latest : List Score -> Result Score _
latest = \scores ->
    scores
    |> List.last

personalBest : List Score -> Result Score _
personalBest = \scores ->
    scores
    |> List.sortDesc
    |> List.first

personalTopThree : List Score -> List Score
personalTopThree = \scores ->
    scores
    |> List.sortDesc
    |> List.takeFirst 3
