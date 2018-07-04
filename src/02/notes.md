## What is a Type?

A name for a collection of related values

    Bool
      True
      False

every expression e produces a value of type t

     e::t
     -- type of expression
     :t not False
     not False :: Bool

Int - 16 or 32 bit
Integer - not bounded

## Function Types

"A function is a mapping from values of one type to values of another type"

    not :: Bool -> Bool

### Multiple Arguments? **Curried Functions**

-- named after Haskell B. Curry

    add' :: Int -> (Int -> Int)
    add' x y = x + y

"Functions with multiple arguments are also possible by returning functions as results"

    -- tuple
    add :: (Int,Int) -> Int

"Functions with more than two arguments can be curried by returning nested functions"

### Why is Currying Useful?

"Curried functions are more flexible than functions on tuples, because useful functions can often be made by partially applying a curried function."

increment n = add 1

function application associates to the left

    mult x y z
    -- ((mult x)y)z
