sumsqrs :: (Num a, Enum a) => a -> a
sumsqrs n = sum [x * x | x <- [0..n]]

grid :: Int -> Int -> [(Int, Int)]
