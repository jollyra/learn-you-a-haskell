import Data.List

-- Recursive type definition
-- -------------------------
data List a = Cons a (List a)
            | Nil
            deriving (Show)

fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

-- "The will to win means nothing without the will to prepare."
-- Exercise 3.1
fromList' (Cons x xs) = x : fromList' xs
fromList' Nil = []

-- Throwing errors
second' :: [a] -> a
second' xs = if null (tail xs)
             then error "list too short"
             else head (tail xs)

-- Exercise 3.1
length' :: [a] -> Int
length' (x:xs) = 1 + (length' xs)
length' []     = 0

-- Exercise 3.3
mean xs = total / lengthOfList
    where total = sum xs
          lengthOfList = (fromIntegral (length xs))

-- Exercise 3.4
toPalindrome :: [a] -> [a]
toPalindrome xs = xs ++ reverse xs


-- Exercise 3.5
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (x:xs) = (x == last xs) && (isPalindrome $ init xs)

-- Exercise 3.6
sortByLength xs = sortBy lengthGT xs
    where lengthGT (xs) (ys)
            | length xs > length ys = GT
            | length ys > length xs = LT

-- Exercise 3.7
intersperseLists :: a -> [[a]] -> [a]
intersperseLists s [] = []
intersperseLists s (x:[]) = x
intersperseLists s (x:xs) = x ++ s : (intersperseLists s xs)

-- Exercise 3.8
data Tree' a = Node' a (Maybe (Tree' a)) (Maybe (Tree' a))
              deriving (Show)

simpleTree0' = Node' "parent" (Just (Node' "left child" Nothing Nothing))
                           (Just (Node' "right child" Nothing Nothing))
simpleTree1' = Node' "parent" Nothing Nothing

-- Define the Tree type as a recursive type
data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

-- Create a tree
h2 = Node "parent" (Node "left child" Empty Empty)
                   (Node "right child" Empty Empty)
h0 = Empty
h4 = Node "parent" (Node "left child" h2 Empty)
                   (Node "right child" Empty Empty)

height :: Tree a -> Int
height Empty = 0
height (Node x left right)
    | height left > height right = 1 + height left | otherwise = 1 + height right
