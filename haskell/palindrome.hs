-- Is a string palindrome or not?
palindrome :: String -> Bool
palindrome [] = True
palindrome [x] = True
palindrome (x:xs)
	| x == last xs = palindrome (init xs)
	| otherwise = False
