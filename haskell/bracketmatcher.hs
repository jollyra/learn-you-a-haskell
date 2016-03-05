import Test.HUnit
import Data.Maybe

-- (())
-- ()()
-- )(
-- (()
-- ())

-- Use 'lookup'
delims = [('(', ')'), ('{', '}'), ('[', ']')]

-- write a function that looks through the second part of each tuple

--                Input     Stack     Result
bracketmatcher :: String -> String -> Bool
bracketmatcher [] []     = True
bracketmatcher [] stack
                    | not $ null stack = False
bracketmatcher (x:xs) []
                    | (isJust x) == True = bracketmatcher xs (x:[])
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

validList = TestCase $ assertEqual "" True (bracketmatcher "()")

tests = TestList [
            TestLabel "()" validList
        ]

testRunner = do
    runTestTT tests

main = testRunner
