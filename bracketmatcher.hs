validate :: [Char] -> Bool
validate expression =
        let validatedExpression = foldl foldingFunction [] expression
                where   foldingFunction "" ')' = ')':[]
                        foldingFunction stack '(' = stack ++ "("
                        foldingFunction stack ')' = init stack
                        foldingFunction stack _ = stack
        in length validatedExpression == 0
