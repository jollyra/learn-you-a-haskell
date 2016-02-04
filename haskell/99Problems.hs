-- https://wiki.haskell.org/99_questions/1_to_10

-- Find the last element of a list.
last' [x]    = x
last' (x:xs) = last' xs

-- Find the last but one el of a list.
lastButOne :: [a] -> a
lastButOne (x:y:[]) = x
lastButOne (x:y:ys) = lastButOne (y:ys)

-- Find the k'th element of a list
index' (x:xs) 0 = x
index' (x:xs) k = index' xs (k - 1)
