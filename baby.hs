doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallerNumber x = if x > 100
                          then x
                          else x*2

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = product [1..n]

factorialRecursive :: (Integral a) => a -> a
factorialRecursive 0  = 1
factorialRecursive n = n * factorialRecursive (n - 1)
