module CaesarCipher(encode, crack) where

import Data.Char

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [index | (original,index) <- zip xs [0..n], x == original]
            where n = length xs -1

-- letter frequency
table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2,
        2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4,
        6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.0,
        2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

lowers :: [Char] -> [Char]
lowers xs = [x | x <- xs, isLower x]

uppers :: [Char] -> [Char]
uppers xs = [x | x <- xs, isUpper x]

lowerCount :: [Char] -> Int
lowerCount xs = length  (lowers xs)

upperCount :: [Char] -> Int
upperCount xs = length (uppers xs)

letter2int :: Char -> Int
letter2int c = ord c - ord 'a'

int2letter :: Int -> Char
int2letter n = chr (ord 'a' + n)

letterCounter :: Char -> [Char] -> Int
letterCounter x xs = length [x'| x' <- xs, x == x']

-- shift 3 'a'
-- 'd'
shift :: Int -> Char -> Char
shift n c | isLower c = int2letter (((letter2int c) + n) `mod` 26)
          | otherwise = c

-- encode (3) "haskell is fun"
-- "kdvnhoo lv ixq"
encode :: Int -> String -> String
encode n xs = [shift n x| x <- xs]

-- percent 5 15
-- 33.333336
percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100

freqs :: String -> [Float]
freqs xs = [percent (letterCounter x xs) n | x <- ['a'..'z']]
            where n = lowerCount xs

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o-e)^2)/e | (o,e) <- zip os es]

-- rotate 2 "abc"
-- "cab"
rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

-- crack "kdvnhoo lv ixq"
-- "haskell is fun"
crack :: String -> String
crack xs = encode (-factor) xs
    where
        factor = head (positions (minimum chitab) chitab)
        chitab = [chisqr (rotate n table') table | n <- [0..25]]
        table' = freqs xs





