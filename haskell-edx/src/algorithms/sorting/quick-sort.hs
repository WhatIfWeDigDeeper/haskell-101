module Qsort
(
    qsort,
    qsortDesc
) where

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
    where
        smaller = [a | a <- xs, a <= x]
        larger =  [b | b <- xs, b > x]


qsortDesc :: Ord a => [a] -> [a]
qsortDesc [] = []
qsortDesc (x:xs) = qsortDesc larger' ++ [x] ++ qsortDesc smaller'
    where
        smaller' = [a | a <- xs, a <= x]
        larger' =  [b | b <- xs, b > x]
