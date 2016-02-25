-- (())
-- ()()
-- )(
-- (()
-- ())

-- An delimiter consists of an open delim and a close delim
data Parentheses = Parentheses OpenParen | CloseParen
                   deriving (Show)

class DelimiterMatch a where
    isMatch :: a -> a -> Bool

instance DelimiterMatch Parentheses where
    isMatch OpenParen CloseParen = True
    isMatch _         _          = False


--                Input     Stack     Result
bracketmatcher :: String -> String -> Bool
bracketmatcher [] []     = True
bracketmatcher [] stack
                    | not $ null stack = False
bracketmatcher (x:xs) []
                    | x == '(' = bracketmatcher xs (x:[])
                    | x == ')' = False
                    | otherwise = bracketmatcher xs []
bracketmatcher (x:xs) (y:ys)
                    | x == '(' = bracketmatcher xs (x:y:ys)
                    | x == ')' = (popAndCompare (y:ys)) && (bracketmatcher xs ys)
                    | otherwise = bracketmatcher xs (y:ys)


popAndCompare :: String -> Bool
popAndCompare [] = False
popAndCompare (x:__)
                | x == '('  = True
                | otherwise = False
