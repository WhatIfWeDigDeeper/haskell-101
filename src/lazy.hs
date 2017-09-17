
sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

primes :: [Int]
primes = sieve [2..]

fibs :: [Integer]
fibs = 0 : 1 : [x + y | (x, y) <- zip fibs (tail fibs)]

fib :: Int -> Integer
fib n = fibs !! n

largeFib :: Integer
largeFib = head (dropWhile (<= 1000) fibs)

data Tree a = Leaf
            | Node (Tree a) a (Tree a)

--repeatTree :: a -> Tree a


