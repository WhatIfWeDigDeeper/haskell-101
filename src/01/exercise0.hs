-- 0. parens
paren0 = (2 ^ 3) * 4
paren0' = (2*3) + (4*5)
paren0'' = 2 + (3 * (4 ^ 5))

-- 1. fix syntax
avg1 = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]

-- 2. last
last2 xs = drop (length xs - 1) xs
last2' xs = head (drop (length xs - 1) xs)
last2'' xs = xs !! (length xs -1)
last2''' xs = head (reverse xs)

-- 3. init or initial (drops last item)
init3 xs = reverse (tail (reverse xs))
init3' xs = take (length xs -1) xs

-- 5. recursive sum
sum5 [] = 0
sum5 (x:xs) = x + sum xs

-- 6. recursive product
prod6 [] = 1
prod6 (x:xs) = x * prod6 xs

-- 7. descending quick sort
qs7 [] = []
qs7 (x:xs) = qs7 larger ++ [x] ++ qs7 smaller
        where
            smaller = [a | a <- xs, a <= x]
            larger = [b | b <- xs, b > x]

qs7' [] = []
qs7' (x:xs) = qs7' larger ++ [x] ++ qs7' smaller
        where
            larger = [a | a <- xs, a > x || a == x]
            smaller = [b | b <- xs, b < x]
          
qs7'' [] = []
qs7'' (x:xs)
    = reverse 
        (reverse (qs7'' smaller) ++ [x] ++ reverse (qs7'' larger))
    where
        smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]


