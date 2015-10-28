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

-- Practice using guards
-- Find the max or a list of typeclass Ord
max' :: (Ord a) => [a] -> a
max' [] = error "Hey! That's an empty list!"
max' [x] = x
max' (x:xs)
  | x > maxTail = x
  | otherwise = maxTail
  where maxTail = max' xs

-- Replicate an Int a given number of times
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x:replicate' (n-1) x

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

-- Quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerSorted = quicksort [a | a <- xs, a <= x]
      biggerSorted = quicksort [a | a <- xs, a > x]
  in smallerSorted ++ [x] ++ biggerSorted

-- Curry
compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100
