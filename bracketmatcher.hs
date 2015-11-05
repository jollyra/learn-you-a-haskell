import Data.List

validate :: [Char] -> Bool
validate expression =
        let validatedExpression = foldl foldingFunction [] expression
                where   foldingFunction "" c = c:[]
                        foldingFunction stack '(' = stack ++ "("
                        foldingFunction stack ')' = init stack
        in length validatedExpression == 0
