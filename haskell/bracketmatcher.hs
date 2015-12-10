validate :: String -> Bool
validate xs = length validatedExpression == 0
        where validatedExpression = foldl foldingFunction [] xs

foldingFunction stack '(' = stack ++ "("
foldingFunction stack ')' = case stack of
                            ('(':xs) -> init stack
                            (')':xs) -> stack
                            ([]) -> stack
foldingFunction stack _ = stack
