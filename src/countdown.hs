import System.IO

data Op = Add | Sub | Mul | Div

apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y

valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = x `mod` y == 0

data Expr = Val Int | App Op Expr Expr

-- either succeeds and returns a singleton list
-- or fails and returns the empty list
eval :: Expr -> [Int]
eval (Val n) = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l, y <- eval r, valid o x y]

interleave                    :: a -> [a] -> [[a]]
interleave x []               =  [[x]]
interleave x (y:ys)           =  (x:y:ys) : map (y:) (interleave x ys)

perms                         :: [a] -> [[a]]
perms []                      =  [[]]
perms (x:xs)                  =  concat (map (interleave x) (perms xs))

subs                          :: [a] -> [[a]]
subs []                       =  [[]]
subs (x:xs)                   =  yss ++ map (x:) yss
                                  where yss = subs xs

--return a list of all possible ways of choosing zero or more elements from a list
-- example: > choices [1,2]
-- [[],[1],[2],[1,2],[2,1]]
choices :: [a] -> [[a]]
choices xs = [zs | ys <- subs xs, zs <- perms ys]

--return a list of all the values in an expression
values :: Expr -> [Int]
values (Val n) = [n]
values (App _ l r) = values l ++ values r

solution :: Expr -> [Int] -> Int -> Bool
solution e ns n = elem (values e) (choices ns)
                  && eval e == [n]

--split list into non-empty lists
--example: > split [1,2,3,4]
--[([1],[2,3,4]),([1,2],[3,4]),([1,2,3],[4])]
split :: [a] -> [([a],[a])]
split [] = []
split [_] = []
split (x : xs) = ([x], xs) : [(x : ls, rs) | (ls, rs) <- split xs]

--combines 2 expressions using each operator
combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- [Add,Sub,Mul,Div]]

--returns a list of all possible expressions whose values are
--precisely a given list of numbers
exprs :: [Int] -> [Expr]
exprs [] = []
exprs [n] = [Val n]
exprs ns = [e | (ls, rs) <- split ns
              , l <- exprs ls
              , r <- exprs rs
              , e <- combine l r]


--return a list of all possible expressions that solve an instance of the
--countdown problem
solutions :: [Int] -> Int -> [Expr]
solutions ns n = [e | ns' <- choices ns
                    , e <- exprs ns'
                    , eval e == [n]]

removeone :: Eq a => a -> [a] -> [a]
removeone x [] = []
removeone x (y : ys)
    | x == y = ys
    | otherwise = y : removeone x ys


--whether all elements in xs are present in ys
isChoice :: Eq a => [a] -> [a] -> Bool
isChoice [] _ = True
isChoice (x : xs) [] = False
isChoice (x : xs) ys = elem x ys && isChoice xs (removeone x ys)






