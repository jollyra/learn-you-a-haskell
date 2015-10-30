-- Bracket matching interview question
-- Test cases:
-- (())
-- ()()
-- (()
-- )(
brack :: [Char] -> Bool
brack [] = True
brack [x] = False
brack (a:b:xs) = case a of ')' -> False
                           '(' -> if b == ')' then brack xs
                                              else brack (b:xs)
