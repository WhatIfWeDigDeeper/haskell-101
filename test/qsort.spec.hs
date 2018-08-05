-- ghci qsort.spec.hs
-- cabal install QuickCheck

module QsortTest where

import Test.QuickCheck
import Data.List

prop_revapp :: [Int] -> [Int] -> Bool
prop_revapp xs ys = reverse (xs++ys) == reverse ys ++ reverse xs

-- split :: Char -> [Char] -> [Char]
-- split c [] = [""]
split c xs = xs' : if null xs'' then [] else split c (tail xs'')
    where xs' = takeWhile (/=c) xs
          xs''= dropWhile (/=c) xs

examples = [('@',"pbv@dcc.fc.up.pt"), ('/',"/usr/include")]

test (c,xs) = unwords ["split", show c, show xs, "=", show ys]
    where ys = split c xs

unsplit :: Char -> [String] -> String
unsplit c = concat . intersperse [c]

-- show
-- prop_split_inv c xs = unsplit c (split c xs) == xs

-- gather statistics on test data
-- prop_split_inv c xs 
--     = let ys = split c xs in 
--       collect (length ys) $ unsplit c ys == xs

prop_split_inv xs
    = forAll (elements xs) $ \c -> 
        unsplit c (split c xs) == xs

-- main = quickCheck prop_revapp
main = quickCheck prop_split_inv
-- /show