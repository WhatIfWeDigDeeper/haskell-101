
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
           where n = (length xs) `div` 2

halve2 xs = (take(n `div` 2) xs, drop (n `div` 2) xs)
            where n = length xs
  
splitHalf xs = splitAt (length xs `div` 2) xs

splitHalf2 xs = splitAt (div (length xs) 2) xs

halve3 xs = (take n xs, drop n xs)
            where n = length xs `div` 2
            
