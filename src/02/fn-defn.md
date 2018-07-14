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
