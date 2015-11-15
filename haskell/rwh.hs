data List a = Cons a (List a)
            | Nil
            deriving (Show)

fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

-- "The will to win means nothing without the will to prepare."
-- exercise 3.1
fromList' (Cons x xs) = x : fromList' xs
fromList' Nil = []
