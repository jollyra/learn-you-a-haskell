-- Exercise 4.1
-- Functions in Haskell can be classified as partial or total. Partial functions are defined
-- only for a subset of inputs whereas total functions are defined over the entire input domain.

-- Here are "safe" definitions of the standard partial list functions:
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast [x] = Just x
safeLast (x:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit (x:[]) = Just []
safeInit (xs) = Just (init xs)
