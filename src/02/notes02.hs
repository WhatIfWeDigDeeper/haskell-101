
zeroto n = [0..n]

-- add' :: Num a => a -> a -> a
add' x y = x + y

-- returns the add = (1 + n) function waiting for n
incr = add' 1

-- dad = true
palindrome xs = reverse xs == xs

-- twice :: (t -> t) -> t -> t
twice f x = f (f x)

-- if then else
abs' n = if n >= 0 then n else -n

-- guarded equations
abs'' n | n >= 0 =      n
        | otherwise =   -n

-- nested conditionals
signum' n | n < 0       = -1
          | n == 0      = 0
          | otherwise   = 1

-- pattern matching
not' :: Bool -> Bool
not' False = True
not' True = False

and' :: Bool -> Bool -> Bool
and' x y | x == True    = y
and' x _ | x == False   = False

head' :: [a] -> a
head' (x:xs) = x

tail' :: [Char] -> [Char]
tail' (_:xs) = xs

isLower :: Char -> Bool
isLower c = c >= 'a' && c <= 'z'

isUpper :: Char -> Bool
isUpper c = c >= 'A' && c <= 'Z'

lowers :: [Char] -> [Char]
lowers xs = [x | x <- xs, isLower x]

uppers :: [Char] -> [Char]
uppers xs = [x | x <- xs, isUpper x]

lowerCount :: [Char] -> Int
lowerCount xs = length  (lowers xs)

upperCount :: [Char] -> Int
upperCount xs = length (uppers xs)


