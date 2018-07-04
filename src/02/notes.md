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

Types are Capitalized in Haskell

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

## Polymorphic Functions

"A function is called polymorphic ('of many forms') if its type contains one or more type variables."

    -- any value type a
    length :: [a] -> Int
    head :: [a] -> a
    take :: Int -> [a] -> [a]
    zip :: [a] -> [b] -> [(a,b)]
    -- simplest function
    id :: a -> a

### Overloaded functions

more like interfaces in OO, restricting types of the parameters.

"A polymorphic function is called overloaded if its type contains one or more class contraints.

    sum :: Num a => [a] -> a

for any numeric type a, sum takes a list ovalues of type a and returns value of type a.

Num - Numeric types
Eq - Equality types
Ord - Ordered types
