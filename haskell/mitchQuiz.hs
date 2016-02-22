join :: [a] -> [a] -> [a]
join [] ys = ys
join xs ys = head xs : join (tail xs) ys



la = [2,2,2,1,2,4,7,8]
-- [[2,2,2],[2,4],[8]]

splitWith :: (a -> Bool) -> [a] ->[[a]]
splitWith f [] = []
splitWith f xs
            | null (fst chunk) = (splitWith f (snd chunk))
            | otherwise        = (fst chunk) : (splitWith f (snd chunk))
    where chunk = splitWhen f xs


splitWhen :: (a -> Bool) -> [a] -> ([a], [a])
splitWhen f xs = (takeUntil f xs, dropUntil f xs)


takeUntil f xs = takeWhile (not . f) xs


dropUntil :: (a -> Bool) -> [a] -> [a]
dropUntil _ [] = []
dropUntil f (x:xs)
              | f x == True = xs
              | otherwise   = dropUntil f xs
