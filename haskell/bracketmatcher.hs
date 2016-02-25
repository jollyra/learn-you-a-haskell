-- (())
-- ()()
-- )(
-- (()
-- ())


data Bracket = Bracket BType BPosition deriving (Show)
data BType = Round | Hard | Curly deriving (Show)
data BPosition = Open | Close deriving (Show)

readBracket :: Char -> Maybe Bracket
readBracket '('= Just (Bracket Round Open)
readBracket ')' = Just (Bracket Round Close)
readBracket  _  = Nothing

matchBracket :: Bracket -> Bracket -> Bool
matchBracket (Bracket Round Open) (Bracket Round Close) = True
matchBracket _                    _                     = False

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
