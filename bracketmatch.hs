sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

stackTest :: (Num a) => [a] -> [a]
stackTest xs = foldr (\x acc -> x : acc) [] xs
