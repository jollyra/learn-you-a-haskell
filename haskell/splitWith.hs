module SplitWith (splitWith) where

import Test.HUnit

splitWith :: (a -> Bool) -> [a] ->[[a]]
splitWith f [] = []
splitWith f xs
            | null (fst chunk) = (splitWith f (snd chunk))
            | otherwise        = (fst chunk) : (splitWith f (snd chunk))
    where chunk = splitWhen f xs


splitWhen :: (a -> Bool) -> [a] -> ([a], [a])
splitWhen f xs = (takeUntil f xs, dropUntil f xs)


takeUntil f xs = takeWhile (not . f) xs


dropUntil :: (a -> Bool) -> [a] -> [a]
dropUntil _ [] = []
dropUntil f (x:xs)
              | f x == True = xs
              | otherwise   = dropUntil f xs


-- Tests
emptyList = TestCase $ assertEqual "" [] (splitWith odd [])
standard = TestCase $ assertEqual "" [[2,2,2],[2,4],[8]] (splitWith odd [2,2,2,1,2,4,7,8])
startWithSplitter = TestCase $ assertEqual "" [[2]] (splitWith odd [1,1,2])
lambaSplitter = TestCase $ assertEqual "" [[2],[4]] (splitWith (\x -> x == 3) [2,3,4])
noSplits = TestCase $ assertEqual "" [[2,4]] (splitWith odd [2,4])

tests = TestList [
            emptyList,
            standard,
            startWithSplitter,
            lambaSplitter,
            noSplits
        ]

main = do
    runTestTT tests
