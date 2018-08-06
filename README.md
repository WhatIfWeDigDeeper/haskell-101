# haskell-101
[EdX Introduction to Functional Programming in Haskell](https://courses.edx.org/courses/course-v1:DelftX+FP101x+3T2015/course/)

## List Comprehensions
Haskell uses lists instead of sets

    [x^2 | x <-[1..5]]

`x <-[1..5]` called a generator as it defines how to generate values for `x`

can have multiple comma separated generators, which act like nested loops with later generators acting as the nested value.

    >[(x, y) | x <-[1,2,3], y <- [4,5]]
    [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]


    > [(x, y) | y <-[4,5], x <- [1,2,3]]
    [(1,4),(2,4),(3,4),(1,5),(2,5),(3,5)]

2nd generator varies vaster as it acts as inner loop.

List comprehensions same idea as LINQ and SQL

### Dependent Generators
later generators can refer to earlier generator variables just like an inner loop can reference variables in an outer loop

    > [(x, y) | x <-[1..3], y <- [x..3]]
    [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]


    -- flatten list
    concat :: [[a]] -> [a]
    concat xss = [x | xs <- xss, x <- xs]

### Guards (where clause)

    [x | x <- [1..10], even x]

    factors :: Int -> [Int]
    factors n = [x | x <- [1..n], n `mod` x == 0]

    prime :: Int -> Bool
    prime n = factors n == [1,n]
    
