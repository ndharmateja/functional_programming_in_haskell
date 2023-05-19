{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Use product" #-}
{-# HLINT ignore "Use and" #-}
{-# HLINT ignore "Use or" #-}
{-# HLINT ignore "Avoid lambda" #-}

-- higher order functions
-- a function is higher order if it takes a function as an argument or returns a function as a result
twice :: (a -> a) -> a -> a
twice f x = f (f x)

-- COMMON PROGRAMMING IDIOMS
-- can be encoded as functions within the language itself
-- eg: if we are applying a function twice frequently, we can use the above 'twice' function

-- DOMAIN SPECIFIC LANGUAGES
-- can be defined as a collection of higher order functions
-- haskell libraries often are defined in this manner

-- ALGEBRAIC PROPERTIES of higher order functions can be used to reason about programs

-- map function
-- map (+1) [1, 3, 5, 7] -- => [2, 4, 6, 8]
map1 :: (a -> b) -> [a] -> [b]
map1 f xs = [f x | x <- xs]

-- can also be defined using recursion (for purpose of proofs)
map2 :: (a -> b) -> [a] -> [b]
map2 _ [] = []
map2 f (x : xs) = f x : map2 f xs

-- filter function
-- filter even [1..10] -- => [2, 4, 6, 8, 10]
filter1 :: (a -> Bool) -> [a] -> [a]
filter1 f xs = [x | x <- xs, f x]

-- using recursion
filter2 :: (a -> Bool) -> [a] -> [a]
filter2 _ [] = []
filter2 f (x : xs)
  | f x = x : filter2 f xs
  | otherwise = filter2 f xs

-- foldr function
-- a number of list functions can be defined using the following pattern of recursion
-- f [] = v (f maps the empty list to some value v)
-- f (x : xs) = x ⊕ f xs (and any non empty list to some function ⊕ applied to its head and f of its tail)

-- eg: sum function
sum1 :: Num a => [a] -> a
sum1 [] = 0 -- v = 0
sum1 (x : xs) = x + sum1 xs -- ⊕ = +

-- eg: product function
product1 :: Num a => [a] -> a
product1 [] = 1 -- v = 1
product1 (x : xs) = x * product1 xs -- ⊕ = *

-- eg: and function
and1 :: [Bool] -> Bool
and1 [] = True -- v = True
and1 (x : xs) = x && and1 xs -- ⊕ = &&

-- foldr function encapsulates this pattern with ⊕ and v as args
sum2 :: Num a => [a] -> a
sum2 = foldr (+) 0

product2 :: Num a => [a] -> a
product2 = foldr (*) 1

and2 :: [Bool] -> Bool
and2 = foldr (&&) True

or2 :: [Bool] -> Bool
or2 = foldr (||) False

-- foldr itself can be defined using recursion
foldr2 :: (a -> b -> b) -> b -> [a] -> b
foldr2 f v [] = v
foldr2 f v (x : xs) = f x (foldr2 f v xs)

-- it is best to think of 'foldr' non-recursively
-- replace each (:) by the given '⊕' function and [] by the given 'v' value

-- eg: sum
-- sum [1, 2, 3]
-- = foldr (+) 0 [1, 2, 3]
-- = foldr (+) 0 (1 : (2 : (3 : [])))
-- => replace each (:) by (+) and [] by 0
-- = 1 + (2 + (3 + 0))
-- = 6

-- eg: product
-- product [1, 2, 3]
-- = foldr (*) 1 [1, 2, 3]
-- = foldr (*) 1 (1 : (2 : (3 : [])))
-- => replace each (:) by (*) and [] by 1
-- = 1 * (2 * (3 * 1))
-- = 6

-- foldr examples
-- even though foldr encapsulates a simple pattern of recursion
-- it can be used to define more functions than might first be expected

-- eg: length
length1 :: [a] -> Int
length1 [] = 0
length1 (_ : xs) = 1 + length1 xs

-- length2 [1, 2, 3]
-- = length2 (1:(2:(3:[])))
-- = (1 + (1 + (1 + 0))) -- => replace each (:) by (\ _ n -> 1 + n) and [] by 0
-- = 3
length2 :: [a] -> Int
length2 = foldr (\_ n -> 1 + n) 0

-- eg: reverse
reverse1 :: [a] -> [a]
reverse1 [] = []
reverse1 (x : xs) = reverse xs ++ [x]

-- reverse [1, 2, 3]
-- = reverse (1:(2:(3:[])))
-- = (([] ++ [3]) ++ [2]) ++ [1] -- => replace each (:) by (\ x n -> n ++ [x]) and [] by []
-- [3, 2, 1]
reverse2 :: [a] -> [a]
reverse2 = foldr (\x xs -> xs ++ [x]) []

-- (++) append function
-- has a compact definition using foldr
-- eg: to append a list xs to ys
-- (++) ys (1: (2: (3: []))) -- => replace (:) by (:) and [] by ys
-- [1, 2, 3, <ys>]
-- (+++ ys) = foldr (:) ys

-- Foldr uses
-- 1. some recursive functions are simpler to define using foldr
-- 2. properties of functions defined using foldr can be proved using algebraic properties of folder
--     a. fusion
--     b. banana split rule
-- 3. advanced program optimizations can be simpler if foldr is used instead of explicit recursion

-- Other library functions
-- 1. (.) returns the composition of two functions
-- eg: odd :: Int -> Bool
-- odd = not . even
(.) :: (b -> c) -> (a -> b) -> (a -> c)
f . g = \x -> f (g x)

-- 2. all - decides if every element of a list satisfies a given predicate
-- all even [2, 4, 6, 8, 10] -- => True
all :: (a -> Bool) -> [a] -> Bool
all p xs = and [p x | x <- xs]

-- 3. any
-- any (== ' ') "abc def" -- => True
any :: (a -> Bool) -> [a] -> Bool
any p xs = or [p x | x <- xs]

-- 4. takeWhile - selects elements from a list while a predicate holds, of all the elements
-- takeWhile (/= ' ') "abc def" -- => "abc"
takeWhile1 :: (a -> Bool) -> [a] -> [a]
takeWhile1 _ [] = []
takeWhile1 p (x : xs)
  | p x = x : takeWhile1 p xs
  | otherwise = []

-- 5. dropWhile - drops elements from a list while a predicate holds, of all the elements
-- dropWhile (== ' ') "   abc" -- => "abc"
dropWhile1 :: (a -> Bool) -> [a] -> [a]
dropWhile1 _ [] = []
dropWhile1 p (x : xs)
  | p x = dropWhile1 p xs
  | otherwise = x : xs