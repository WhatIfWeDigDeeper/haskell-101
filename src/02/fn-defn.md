## Function Definitions

### Conditional Expressions

    -- if then else
    abs :: Int -> Int
    abs n = if n >= 0 then n else -n

    -- guarded equations
    abs'' n | n >= 0 =      n
            | otherwise =   -n

    -- nested conditionals
    signum' n | n < 0       = -1
            | n == 0      = 0
            | otherwise   = 1

## Pattern Matching

    not' :: Bool -> Bool
    not' False = True
    not' True = False

Good example of input output table
not maps False to True and True to False

### Lists

    -- syntactic sugar
    [1,2,3,4]

    -- for
    1:(2:(3:(4:[])))

## Lambda Expressions

    add :: Int -> Int -> Int
    add x y = x + y

    -- shows fn takes x, returns fn takes y
    addLambda = \x -> (\y -> x + y)

Avoid naming functions used only once. **Naming is hard**.

### Sections (operators)

    1+2
    (+) 1 2
    // curried, fn + given 1 and expects second arg
    (1+) 2
    (+2) 1

    successor = (1+)
