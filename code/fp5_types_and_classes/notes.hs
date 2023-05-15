-- e :: t -- => expression 'e' evaluates to type 't'
-- every (well) expression can be evaluated at compile time. type infernce.
-- haskell is strongly typed, so type checks are not necessary and type errors are found at compile time
-- :type evaluates any expression's type without evaluating it
-- basic types: Bool, Char, String, Int, Float

-- to form new types: lists, tuples, functions
-- [1, 2, 3] :: [Int]
-- [['a'], ['a', 'b']] :: [[Char]]
-- type of the list doesn't say anything about the length

-- tuple is a sequence of values of different types
-- (False, True) :: (Bool, Bool)
-- (False, 'a', True) :: (Bool, Char, Bool)
-- type of tuple - encodes its size

-- Function types
-- not :: Bool -> Bool
-- even :: Int -> Bool
-- t1 -> t2 -- => t1 and t2 could be any type, even functions

add :: (Int, Int) -> Int
add (x, y) = x + y

zeroto :: Int -> [Int]
zeroto n = [0 .. n]

-- Currying
add1 :: Int -> Int -> Int
add1 x y = x + y

-- mult x :: Int -> (int -> Int)
-- mult x y :: (Int -> Int)
-- mult x y z :: Int
mult :: Int -> (Int -> (Int -> Int))
mult x y z = x * y * z

-- Currying uses:
-- 1. partial applications
-- 2. more flexible than applying fns on tuples
-- addTo3 10 -- => 13
-- addTo3 7 -- => 10
addTo3 :: Int -> Int
addTo3 = add1 3

-- take5 [1..10] -- => [1, 2, 3, 4, 5]
take5 :: [Int] -> [Int]
take5 = take 5

-- conventions to avoid excess parantheses
-- 1. arrow - associates to right
-- Int -> Int -> Int -- => Int -> (Int -> (Int -> Int))
-- 2. as a consequence, function application associates to left
-- mult x y z -- => ((mult x) y) z
-- unless tupling is explicitly required, all functions are normally defined in curried form

-- Polymorphic functions
-- if the function's type contains one or more type variables
-- example: length function doesn't care about the element's type in the list
-- length :: [a] -> Int
-- length [True, False] -- => a = Bool
-- type variables must begin with lower case - usually a, b, c etc
-- many defined functions are polymorphic
-- fst :: (a, b) -> a
-- head :: [a] -> a
-- take :: Int -> ([a] -> [a])
-- zip :: [a] -> [b] -> [(a, b)]
-- id :: a -> a

-- Overloaded functions
-- a polymorphic function is overloaded if its type contains one or more class constraints
-- (+) :: Num a => a -> (a -> a)
-- Num a - says that 'a' should be of type Num
-- 1 + 2 -- => 3 (a = Int)
-- 1.0 + 2.0 -- => 3.0 (a = Float)
-- 'a' + 'b' -- => ERROR (Char is not numeric type)

-- Haskell has number of type classes: Num (numeric types), Eq (equality types), Ord (ordered types) etc
-- (+) :: Num a => a -> a -> a
-- (--) :: Eq a => a -> a -> Bool
-- (<) :: Ord a => a -> a -> Bool

-- tips:
-- when defining a new function, write down its type
-- within a script, useful to state type of every new function defined
-- when stating types of polymorphic functions, take care to include necessary class constraints
