divides' :: Int -> Int -> Bool
divides' x y = (x `mod` y) == 0

lowestFactor :: Int -> Int -> Int
lowestFactor num factor | divides' num factor = factor
                        | factor^2 > num = num
                        | otherwise = lowestFactor num (factor + 1)

isPrime :: Int -> Bool
isPrime num = (lowestFactor num 2) == num

primes :: Int -> [Int]
primes n  = [x | x <- [0..n], x > 1 && isPrime x]

removeFst :: Int -> [Int] -> [Int]
removeFst _ [] = []
removeFst num (x:xs) = if (num == x) then xs else [x] ++ removeFst num xs

minList :: [Int] -> Int
minList [] = 0
minList [x] = x
minList (x:xs) = x `min` minList xs

maxList :: [Int] -> Int
maxList [] = 0
maxList [x] = x
maxList (x:xs) = x `max` maxList xs

-- reuse by passing in function
-- higher order function
mList :: (Int -> Int -> Int) -> [Int] -> Int
mList fn [] = 0
mList fn [x] = x
mList fn (x:xs) = x `fn` mList fn xs

-- *******GOOD EX for Presentation
miniList :: [Int] -> Int
miniList xs = mList min xs

-- *******GOOD EX for Presentation
maxyList :: [Int] -> Int
maxyList xs = mList max xs

-- where version
srtList :: [Int] -> [Int]
srtList [] = []
srtList [x] = [x]
srtList xs = m : (srtList (removeFst m xs))
             where m = miniList xs

-- let version
srtListLet :: [Int] -> [Int]
srtListLet [] = []
srtListLet [x] = [x]
srtListLet xs = let m = miniList xs
                in m : (srtListLet (removeFst m xs))

averageList :: [Int] -> Rational
averageList [] = error "empty list -> div by 0"
averageList xs = toRational (sum xs) / toRational (length xs)

-- srtString :: String -> String
-- srtString [] = []
-- srtString [s] = [s]
-- srtString (x:xs)
  
