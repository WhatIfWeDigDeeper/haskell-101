-- parens
ex0 = (2 ^ 3) * 4
ex0' = (2*3) + (4*5)
ex0'' = 2 + (3 * (4 ^ 5))

-- fix syntax
ex1 = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]

-- last
ex2 xs = drop (length xs - 1) xs
ex2' xs = head (drop (length xs - 1) xs)
ex2'' xs = xs !! (length xs -1)

