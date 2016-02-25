-- (())
-- ()()
-- )(
-- (()
-- ())
data Bracket = Round Char Char
             | Hard  Char Char
             | Curly Char Char
               deriving (Show)

readBracket :: Char -> Maybe Bracket
readBracket '(' = Just (Round '(' ')')
readBracket  _  = Nothing


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
popAndCompare (x:_)
                | x == '('  = True
                | otherwise = False
