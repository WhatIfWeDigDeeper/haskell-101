-- > ghci or ghci src/01/test.hs
-- > :cd directory
-- > :load fileName
-- > :reload or :r
-- > :type expr or :t
-- > :? - show all commands
-- > :q

-- > groovysh

import Data.Char

double x = x + x

quadruple x = double (double x)

factorial n = product [1..n]

average ns = sum ns `div` length ns

lasty xs = xs !! (length xs - 1)

init' xs = reverse (tail (reverse xs))

summy [] = 0 -- base case when empty
summy (x:xs) = x + summy xs

n = a `div` length xs
  where
    a = 10
    xs = [1..5]

qsort [] = []
qsort (x : xs) = qsort smaller ++ [x] ++ qsort larger
  where smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]

qsortDesc [] = []
qsortDesc (x : xs) = qsortDesc larger' ++ [x] ++ qsortDesc smaller'
  where smaller' = [a | a <- xs, a <= x]
        larger' = [b | b <- xs, b > x]

second xs = head (tail xs)

swap (x, y) = (y, x)

pair x y = (x, y)

double' x = x * 2

palindrome xs = reverse xs == xs

twice f x = f (f x)

f xs = take 3 (reverse xs)

-- tuples
-- fst (1, 3)
-- snd (1, 3)

third :: [a] -> a
third xs = head (tail (tail xs))

thirdIndex xs = xs !! 2

-- thirdPattern :: [a] -> [a]
thirdPattern (_:_:x:_) = x

abs' :: Int -> Int
abs' n = if n >= 0 then n else -n

-- signum' n = if n < 0 then -1 else
--            if n == 0 then 0 else 1
signum' n
  | n < 0 = -1
  | n == 0 = 0
  | otherwise = 1

halve :: [a] -> ([a],[a])
halve xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
    where n = length xs

halve2 :: [a] -> ([a],[a])
halve2 xs = splitAt (length xs `div` 2) xs

halve3 :: [a] -> ([a],[a])
halve3 xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
    where n = length xs

halve4 :: [a] -> ([a],[a])
halve4 xs = splitAt (length xs `div` 2) xs

halve5 :: [a] -> ([a],[a])
halve5 xs = (take n xs, drop n xs)
    where n = length xs `div` 2


safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

safetail2 :: [a] -> [a]
safetail2 [] = []
safetail2 (_:xs) = xs

safetail3 :: [a] -> [a]
safetail3 xs
    | null xs = []
    | otherwise = tail xs

safetail4 :: [a] -> [a]
safetail4 [] = []
safetail4 xs = tail xs

safetail5 :: [a] -> [a]
safetail5
    = \ xs ->
        case xs of
            [] -> []
            (_:xs) -> xs

(|||) :: Bool -> Bool -> Bool
False ||| b = b
True ||| _ = True

or1 :: Bool -> Bool -> Bool
or1 b c
    | c == False = b
    | otherwise = True

or2 False False = False
or2 _ _ = True

-- original
or3 b c = if b == c then b else True

(&&&) :: Bool -> Bool -> Bool
a &&& b = if a then b else False

mult :: Integer -> Integer -> Integer -> Integer
mult =  \ x -> (\ y -> (\ z -> x * y * z))

remove n xs = take n xs ++ drop (n + 1) xs

funct :: Int -> [a] -> [a]
funct x xs = take (x + 1) xs ++ drop x xs

e7 :: [a] -> [b] -> (a, b)
e7 xs ys = (head xs, head ys)

concat' :: [[a]] -> [a]
concat' xss = [x | xs <- xss, x <- xs]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

primes :: Int -> [Int]
primes n = [x| x <- [2..n], prime x]

pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x, y) <- pairs xs]

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [index | (original,index) <- zip xs [0..n], x == original] where n = length xs -1

replicate' :: Int -> a -> [a]
replicate' n a = [a | _ <- [1..n]]

pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z)| x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

isPerfect :: Int -> Bool
isPerfect n = n == (sum (init (factors n)))

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], isPerfect' x]
    where isPerfect' num = (sum(init (factors num))) == num

scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x * y | (x, y) <- xs `zip` ys]
-- creates pairs (x,y) and then multiplies pairs and results in [mult pair] then sum[mult pair]
-- *Main> [x * y | (x,y) <- [(1,4),(2,5)]]
--  [4,10]

--Caesar cipher
let2int :: Char -> Int
let2int c = ord c - ord 'a'

let3int :: Char -> Int
let3int c = ord c - ord 'A'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

int3let :: Int -> Char
int3let n = chr (ord 'A' + n)

shift :: Int -> Char -> Char
shift n c
  | isLower c = int2let ((let2int c + n) `mod` 26)
  | isUpper c = int3let ((let3int c + n) `mod` 26)
  | otherwise = c

encode :: Int -> String -> String
encode n xs = [shift n x| x <- xs]

riffle :: [a] -> [a] -> [a]
riffle xs ys = concat [[x,y] | (x, y) <- xs `zip` ys]

divides :: Int -> Int -> Bool
divides x y = (x `mod` y) == 0

divisors :: Int -> [Int]
divisors x = [d | d <- [1..x], x `divides` d]

recursiveFactorial :: Int -> Int
recursiveFactorial 0 = 1
recursiveFactorial n = n * recursiveFactorial (n-1)

recursiveProduct :: [Int] -> Int
recursiveProduct [] = 1
recursiveProduct (n:ns) = n * product ns

recursiveLength :: [a] -> Int
recursiveLength [] = 0
recursiveLength (_:xs) = 1 + recursiveLength xs

recursiveReverse :: [a] -> [a]
recursiveReverse [] = []
recursiveReverse (x:xs) = recursiveReverse xs ++ [x]

recursiveZip :: [a] -> [b] -> [(a,b)]
recursiveZip [] _ = []
recursiveZip _ [] = []
recursiveZip (x:xs) (y:ys) = (x,y) : recursiveZip xs ys

--recurse over a number and a list
recursiveDrop :: Int -> [a] -> [a]
recursiveDrop 0 xs = xs -- drop 0 elements is just going to be the list
recursiveDrop _ [] = [] -- anything and the empty list is going to be the empty list
recursiveDrop n (_:xs) = recursiveDrop (n-1) xs

(+++) :: [a] -> [a] -> [a]
[] +++ ys = ys
--xs +++ [] = xs --not needed since recurses over xs until empty list then = [ys], [
(x:xs) +++ ys = x : (xs +++ ys)
-- [1..3] [1..5]
-- 1 : ([2,3] +++ [1..5])
-- 1 : (2 : (3 : (+++ [1..5])))
-- 1 : (2 : (3 : (+++ ([] +++ [1..5])))
-- 1 : (2 : (3 : ([1..5])))
-- 1 : (2 : ([3,1,2,3,4,5])
-- 1 : ([2,3,1,2,3,4,5])
-- = [1,2,3,1,2,3,4,5]

qsort' :: [Int] -> [Int]
qsort' [] = []
qsort' (x:xs) = qsort' smaller ++ [x] ++ qsort' larger
    where
        smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]

recursiveReplicate :: Int -> a -> [a]
recursiveReplicate 0 a = [] --if hits this first then returns []
recursiveReplicate n a = [a] ++ recursiveReplicate (n-1) a

index :: [a] -> Int -> a
index xs 0 = head xs
index xs n = index (tail xs) (n-1)

contains :: Eq a => a -> [a] -> Bool
contains a [] = False
contains a xs = if (head xs) == a then True else contains a (tail xs)

--power
(^^^) :: Integer -> Integer -> Integer
m ^^^ 0 = 1
m ^^^ n = m * m ^^^ (n - 1)
--m ^^^ n = m * (^^^) m (n-1)

len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs

and' :: [Bool] -> Bool
and' [] = True
and' (b:bs) = b && and' bs


replica :: Int -> a -> [a]
replica 0 _ = []
replica n x = x : replica (n-1) x

el :: Eq a => a -> [a] -> Bool
el _ [] = False
el x (y:ys)
    | x == y = True
    | otherwise = el x ys

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    = if x <= y then x : merge xs (y: ys) else y : merge (x:xs) ys

halve' :: [a] -> ([a],[a])
halve' xs = splitAt (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
    where (ys, zs) = halve' xs

isPositive :: Integer -> Bool
isPositive n = n >= 0


toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits n = toDigits (n `div` 10) ++ [n `mod` 10]
    --where n = n >= 0


toDigitsRev :: Integer -> [Integer]
toDigitsRev n = reverse (toDigits n)

isEven :: Int -> Bool
isEven n = (n `mod` 2) == 0

doubleSec :: [Integer] -> [Integer]
doubleSec [] = []
doubleSec xs = if (isEven (length xs)) then double (last xs) : doubleSec (init xs) else last xs : doubleSec (init xs)

doubleSecond :: [Integer] -> [Integer]
doubleSecond xs = reverse (doubleSec xs)

--doubleSecond xs = if (isEven (length xs)) then double (head xs) : doubleSecond (tail xs) else head xs : doubleSecond (tail xs)
        --where x = head xs
        --  ys = tail xs


--doubleSecond (x:xs) = if (isEven (length xs)) then double x : doubleSecond xs else x : doubleSecond xs

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs) = digits + sumDigits xs
    where digits = (x `div` 10) + (x `mod` 10)

isValidCC :: Integer -> Bool
isValidCC n = if ( sumDigits (doubleSecond (toDigitsRev n))) `mod` 10 == 0 then True else False



numValid :: [Integer] -> Integer
numValid xs = sum . map (\_ -> 1) $ filter isValidCC xs


creditcards :: [Integer]
creditcards = [ 4716347184862961,
                4532899082537349
              ]

--higher order functions

twice' :: (a -> a) -> a -> a
twice' f x = f (f x)

mappy :: (a -> b) -> [a] -> [b]
mappy f xs = [f x | x <- xs] --list comprehension

mapRecursive :: (a -> b) -> [a] -> [b] -- function a that returns b
mapRecursive f [] = []
mapRecursive f (x:xs) = (f x) : mapRecursive f xs

filtery :: (a -> Bool) -> [a] -> [a]
filtery p xs = [x | x <- xs, p x]

filterRecursive :: (a -> Bool) -> [a] -> [a]
filterRecursive p [] = []
filterRecursive p (x:xs) = if (p x) then x : filterRecursive p xs else filterRecursive p xs

filterRecursive' :: (a -> Bool) -> [a] -> [a]
filterRecursive' p [] = []
filterRecursive' p (x:xs)
    | p x       = x : filterRecursive' p xs
    | otherwise = filterRecursive' p xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v [] = v
foldr' f v (x:xs) = f x (foldr f v xs)

reversy :: [a] -> [a]
reversy xs = foldr (\x xs -> xs ++ [x]) [] xs

any' :: (a -> Bool) -> [a] -> Bool
any' p xs = foldr (||) False (map p xs)
--any' p xs = foldr (\ x acc -> (p x) || acc) False xs
--any' p xs = not (all (\ x -> not (p x)) xs)
--any' p = not . null . dropWhile (not . p)
--any' predicate = or . map predicate
--any' p xs = length (filter p xs) > 0
--any' predicate xs = or [predicate x | x <- xs]

takeWhile' :: (a -> Bool) -> [a] -> [a] --predicate returns bool, list arg, & returns list
takeWhile' p [] = []
takeWhile' p (x:xs)
    | p x       = x : takeWhile' p xs
    | otherwise = []

dropWhile' :: (a -> Bool) -> [a] -> [a] --predicate returns bool, list arg, & returns list
dropWhile' p [] = []
dropWhile' p (x:xs)
    | p x       = dropWhile' p xs
    | otherwise = x:xs

--dropWhile' isSpace "   abc"

map' :: (a -> b) -> [a] -> [b]
map' f = foldl (\ xs x -> xs ++ [f x]) []

filtery' :: (a -> Bool) -> [a] -> [a]
filtery' p = foldl (\ xs x -> if p x then x : xs else xs) []

dec2int :: [Integer] -> Integer
dec2int = foldl (\ x y -> 10 * x + y) 0

compose :: [a -> a] -> (a -> a)
compose = foldr (.) id

curry' :: ((a, b) -> c) -> a -> b -> c
curry' f = \ x y -> f (x, y)

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f = \ (x, y) -> f x y

unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x
    | p x = []
    | otherwise = h x : unfold p h t (t x)

type Bit = Int

int2bin :: Int -> [Bit]
int2bin = unfold (== 0) (`mod` 2) (`div` 2)
--int2bin 0 = []
--int2bin n = n `mod` 2 : int2bin (n `div` 2)

chop8 :: [Bit] -> [[Bit]]
chop8 = unfold null (take 8) (drop 8)
--chop8 [] = []
--chop8 bits = take 8 bits : chop8 (drop 8 bits)

mapUnfold :: (a -> b) -> [a] -> [b]
mapUnfold f = unfold null (f . head) tail

iterate' :: (a -> a) -> a -> [a]
iterate' f = unfold (const False) id f

--church :: (a -> a) -> a -> a
--church 0 = \s z -> z
