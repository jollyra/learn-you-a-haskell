import Data.list

stackTest :: (Num a) => String -> a
stackTest xs = foldl (\acc x -> acc + x) 0 xs
