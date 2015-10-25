doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallerNumber x = if x > 100
                          then x
                          else x*2

-- Factorial
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = product [1..n]

factorialRecursive :: (Integral a) => a -> a
factorialRecursive 0  = 1
factorialRecursive n = n * factorialRecursive (n - 1)

-- Adding vectors
-----------------
-- Class Constraint :: arg -> arg -> return
-- Args must obey the class contraint
-- Class contraint is a Typeclass
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Fibonacci calculator
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

-- Bracket matching interview question
-- Test cases:
-- (())
-- ()()
-- (()
-- )(
brack :: [Char] -> Bool
brack [] = True
brack [x] = False
brack (a:b:xs) = case a of ')' -> False
                           '(' -> if b == ')' then brack xs
                                              else brack (b:xs)
