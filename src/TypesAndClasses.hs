import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero
        | Succ Nat
        deriving Show

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

natToInteger :: Nat -> Integer
natToInteger = \ n -> length [c | c <- show n, c == 'S']

