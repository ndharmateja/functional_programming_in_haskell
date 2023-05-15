{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# HLINT ignore "Use guards" #-}

-- conditional expressions
abs :: Int -> Int
abs x = if x >= 0 then x else -x

-- can be nested
signum1 :: Int -> Int
signum1 n =
  if n < 0
    then -1
    else if n == 0 then 0 else 1

-- conditional expressions must always have else branch
-- it avoids possible ambiguity problems with nested conditionals

-- Guarded equations
absG :: Int -> Int
absG n
  | n >= 0 = n
  | otherwise = -n

signumG :: Int -> Int
signumG n
  | n < 0 = -1
  | n > 0 = 1
  | otherwise = 0

-- Pattern matching
-- 'not' maps False to True and True to False
not :: Bool -> Bool
not False = True
not True = False

-- functions can be defined in multiple ways using pattern matching
-- one way
(&&) :: Bool -> Bool -> Bool
True && True = True
True && False = False
False && True = False
False && False = False

-- second way (more compact)
-- underscore (_) matches anything (wildcard)
(&&&) :: Bool -> Bool -> Bool
True &&& True = True
_ &&& _ = False

-- actual way it is defined in haskell
-- more efficient
-- as it avoids evaluating second argument if first argument is false
(&&&&) :: Bool -> Bool -> Bool
True &&&& b = b -- lazy evaluation means that 'b' won't be evaluated until necessary
False &&&& _ = False

-- patterns are matched in order from top to bottom
-- patterns may not repeat variables -- => b && b = b throws error

-- list patterns
-- ':' operator is called cons - adds an element at start of list
-- (:) :: a -> [a] -> [a]
-- [1, 2, 3, 4] same as 1:(2:(3:(4:[])))

-- functions on lists can be defined using x:xs patterns
-- ':' can be used to destruct lists as well as construct
head :: [a] -> a
head (x : _) = x

tail :: [a] -> [a]
tail (_ : xs) = xs

-- x:xs patterns match only non-empty lists
-- x:xs patterns must be paranthesized because application has higher priority over :

-- lambda expressions
-- functions can be constructed without naming them using lambda expressions
-- lambda expressions can be used to give a formal meaning to functions defined using currying
add1 :: Int -> (Int -> Int)
add1 = \x -> (\y -> x + y) -- same as add1 x y = x + y

-- lambda expressions can be used to avoid naming functions that are only referenced once
odds :: Int -> [Int]
odds n = map f [0 .. n - 1]
  where
    f x = x * 2 + 1

-- above can be simplified to
odds1 :: Int -> [Int]
odds1 n = map (\x -> 2 * x + 1) [0 .. n - 1]

-- Operator sections
-- operator written between its two arguments can be converted into a curried function before its two arguments by using paranthesis
-- 1 + 2
-- (+) 1 2
-- both above are same

-- this allows one of arguments of the operator to be included in paraantheses
-- (1+) 2 -- => 3
-- (+2) 1 -- => 3
-- in general, if '+' is an operator, then functions of form (+), (x+), (+y) are called sections

-- section uses
-- useful functions can be sometimes be constructed in a compact way using sections
-- (1+) -- => successor function
-- (1/) -- => reciprocation function
-- (*2) -- => doubling function
-- (/2) -- => halving function