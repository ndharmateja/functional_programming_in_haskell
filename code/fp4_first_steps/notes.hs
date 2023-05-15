-- common list functions
-- head [1, 2, 3] -- => 1
-- tail [1, 2, 3] remove first element from list -- => [2, 3]
-- [1, 2, 3, 4] !! 2 gets element a index 2 -- => 3
-- take 3 [1, 2, 3, 4, 5] gets first 3 elements -- => [1, 2, 3]
-- drop 3 [1, 2, 3, 4, 5] removes first 3 elements -- => [4, 5]
-- length [1, 2, 3, 4, 5] -- => 5
-- sum [1, 2, 3, 4, 5] -- => 15
-- product [1, 2, 3, 4, 5] -- => 120
-- [1, 2, 3] ++ [3, 4] -- => [1, 2, 3, 3, 4]
-- reverse [1, 2, 3] -- => [3, 2, 1]
-- f a b -- => f(a, b)
-- f a + b -- => (f a) + b and not f(a + b) -- => functions have highest priority
-- Math to haskell representation
-- f(x) -- => f x
-- f(x, y) -- => f x y
-- f(g(x)) -- => f (g x)
-- f(x, g(y)) -- => f x (g y)
-- f(x) * g(y) -- => f x * g y
-- New functions defined with script, a text file consisting of function definitions
-- usually have .hs but not mandatory
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use last" #-}
{-# HLINT ignore "Use init" #-}

double x = x + x

quadraple x = double (double x)

-- x `f` y is same as f x y
factorial n = product [1 .. n]

average ns = sum ns `div` length ns

-- useful ghci commands
-- :load <file>
-- :reload
-- :set editor <name>
-- :edit <name> -- => edit script name
-- :edit -- => edit current script
-- :type <expr> -- => show type of expression
-- :? -- => show all commands
-- :quit -- => quit ghci