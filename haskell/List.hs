-- This definition of a list is a "Recursive Type" meaning it refers to itself in the definition. "Cons" is the constructor so if we want to create a new value we must supply a value of type 'a' to Cons and another of type List a.

data List a = Cons a (List a)
            | Nil
              deriving (Show)

l0 = Nil
la = Cons 1 Nil
lb = Cons 1 (Cons 2 (Cons 3 Nil))
