validate :: String -> Bool
validate xs = length validatedExpression == 0
        where validatedExpression = foldl foldingFunction [] xs
                where foldingFunction [] ')' = error "Bad"
                      foldingFunction stack '(' = stack ++ "("
                      foldingFunction stack ')' = init stack
                      foldingFunction stack _ = stack
