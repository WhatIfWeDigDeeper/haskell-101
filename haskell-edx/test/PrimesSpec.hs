module PrimesSpec(prop_validPrimesOnly) where

import Data.Maybe(isJust)
import Primes(isPrime, primes)
import QuickCheck

prop_validPrimesOnly val = 
    if val < 0 || val >= length primes
    then result == Nothing
    else isJust result
    where result = isPrime val
