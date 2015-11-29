-- Exercise 1 - return the element before the last
lastButOne :: [a] -> a
lastButOne (x:y:[]) = x
lastButOne (x:y:ys) = lastButOne (y:ys)
