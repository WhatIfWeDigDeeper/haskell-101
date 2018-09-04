module Primes(isPrime, primes) where

noRemainder :: Int -> Bool
noRemainder n = n == 0

hasRemainder :: Int -> Bool
hasRemainder n = not (noRemainder n)

divHasRemainder :: Int -> Int -> Bool
divHasRemainder n p = hasRemainder (p `mod` n)

sieve :: [Int] -> [Int]
sieve [] = []
sieve (nextPrime:rest) = nextPrime : sieve noFactors
    where noFactors = filter (divHasRemainder nextPrime) rest
    -- original
    -- where noFactors = filter (not . (== 0) . (`mod` nextPrime)) rest

primes :: [Int]
primes = sieve [2 .. 10000]

isPrime :: Int -> Maybe Bool
isPrime n | n < 0 = Nothing
          | n >= length primes = Nothing
          | otherwise = Just (n `elem` primes)

