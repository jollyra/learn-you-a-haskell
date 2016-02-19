join :: [a] -> [a] -> [a]
join [] ys = ys
join xs ys = head xs : join (tail xs) ys

-- [2,2,2,1,2,4,7,8]
-- [[2,2,2],[2,4],[8]]
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith f xs = foldr splitOrStay [] xs
                            where splitOrStay acc (x:xs)
                                      | (f x) == True
