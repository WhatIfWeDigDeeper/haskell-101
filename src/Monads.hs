import System.IO


putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = putChar x >> putStr' xs

putStrLn' :: String -> IO ()
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putStrLn' ""

--putStrLn' xs = putStr' xs >> putChar '\n'
--putStrLn' xs = putStr' xs >> putStrLn' "\n"
--putStrLn' xs = putStr' xs >> putStr' "\n"
--putStrLn' xs = putStr' xs >>= \ x -> putChar '\n'
--putStrLn' xs = putStr' xs >> putChar '\n'
--putStrLn' xs = putStr' xs >> putStrLn' ""

get :: String -> IO String
get xs = do x <- getChar
            case x of
                 '\n' -> return xs
                 _ -> get (xs ++ [x])


getLine' :: IO String
getLine' = get []

interact' :: (String -> String) -> IO ()
interact' f = do input <- getLine'
                 putStrLn' (f input)

sequence_' :: Monad m => [m a] -> m ()
sequence_' [] = return ()
sequence_' (m:ms) = (foldl (>>) m ms) >> return ()

applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right) | abs (( left + n) - right) < 4 = Just (left + n, right)
    | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right) | abs (left - (right + n)) < 4 = Just (left, right + n)
    | otherwise = Nothing







