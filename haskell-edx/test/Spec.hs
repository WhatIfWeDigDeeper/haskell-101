module MainSpec where

import PrimesSpec(prop_validPrimesOnly)
import QuickCheck

main :: IO ()
main = do
    quickCheck prop_validPrimesOnly
    putStrLn "Test suite nOt yet implemented"
