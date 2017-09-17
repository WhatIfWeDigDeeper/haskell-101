import System.IO

getCh :: IO Char
getCh = do hSetEcho stdin False
           c <- getChar
           hSetEcho stdin True
           return c

--main loop to check if guesses are correct
--uses tail recursion, which avoids stack overflow
guess :: String -> IO ()
guess word = do putStr "> "
                xs <- getLine
                if xs == word then
                   putStrLn "You got it!"
                else
                   do putStrLn (diff word xs)
                      guess word

--pure function, uses list comprehension
--example: diff "haskell" "pascal" = "-as--ll"
diff :: String -> String -> String
diff xs ys = [if elem x ys then x else '-' | x <- xs]



hangman :: IO ()
hangman = do putStrLn "Think of a word: "
             word <- sgetLine
             putStrLn "Try to guess it:"
             guess word

--echos each line of text as dashes
sgetLine :: IO String
sgetLine = do x <- getCh
              if x == '\n' then
                 do putChar x
                    return []
              else
                 do putChar '-'
                    xs <- sgetLine
                    return (x:xs)

