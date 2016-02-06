-- https://wiki.haskell.org/99_questions/1_to_10

-- Find the last element of a list.
last' [x]    = x
last' (x:xs) = last' xs

-- Find the last but one el of a list.
lastButOne :: [a] -> a
lastButOne (x:y:[]) = x
lastButOne (x:y:ys) = lastButOne (y:ys)

-- Find the k'th element of a list.
index' (x:xs) 0 = x
index' (x:xs) k = index' xs (k - 1)
index' _ _      = error "Index out of bound"

-- Find the number of elements in a list.
length' [] = 0
length' (x:xs) = countElements (x:xs) 0
    where countElements (x:xs) n = countElements xs (n + 1)
          countElements [] n = n

-- Reverse a list.
backwards xs = last xs : backwards (init xs)

-- Find out whether a list is palindrome.
isPalindrome []  = True
isPalindrome (x:[]) = True
isPalindrome (x:xs) = (x == last xs) && isPalindrome (init xs)

-- Flatten a nested list structure
-- Need a custom data type for this problem because 
-- lists in Haskell are homogeneous.
data NestedList a = Elem a | List [NestedList a]

flatten' :: (NestedList a) => a -> a

