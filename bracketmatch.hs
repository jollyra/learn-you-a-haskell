import Data.List

-- Test Cases:
-- "( )"
-- ")"
-- "( ) ( )"
-- "( ( )"
-- "( ) )"
-- "( ( ) )"

validate :: [Char] -> Bool
validate expression =
        let validatedExpression = foldl foldingFunction [] (words expression)
                where   foldingFunction [] ")" = "Invalid!"
                        foldingFunction stack "(" = stack ++ "("
                        foldingFunction stack ")" = init stack
        in length validatedExpression == 0
