{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

main :: IO ()
main = do
    TIO.putStrLn "Enter a word and I'll let you know if it's a palindrome!"
    -- text <- TIO.getLine
    someFunc
    -- let response = someFunc
    -- TIO.putStrLn response
-- main = someFunc
