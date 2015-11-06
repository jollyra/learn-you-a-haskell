validate :: String -> Bool
validate xs =
        let validatedExpression = foldl foldingFunction [] xs
                where   foldingFunction [] ')' = ')':[]
                        foldingFunction stack '(' = stack ++ "("
                        foldingFunction stack ')' = init stack
                        foldingFunction stack _ = stack
        in length validatedExpression == 0
