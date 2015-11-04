sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

stackTest :: (Num a) => [a] -> [a]
stackTest xs = foldr foldingFun [] xs

foldingFun :: (Num a) => a -> [a] -> [a]
foldingFun y xs = y : xs
