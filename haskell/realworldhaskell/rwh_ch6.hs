-- Typeclasses
class BasicEq a where
    isEqual :: a -> a -> Bool

instance BasicEq Bool where
    isEqual True True   = True
    isEqual False False = False
    isEqual _      _    = False
