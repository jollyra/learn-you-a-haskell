-- (())
-- ()()
-- )(
-- (()
-- ())

lint :: String -> String -> Bool
lint "" "" = True
lint (x:xs) stack
    | x == '(' = True && (lint x:xs '(':stack)
    | x == ')' = case stack of
                    ('(':rest) -> True && lint xs rest
                    (')':rest) -> False
