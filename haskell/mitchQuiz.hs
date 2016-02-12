join :: [a] -> [a] -> [a]
join [] ys = ys
join xs ys = head xs : join (tail xs) ys
