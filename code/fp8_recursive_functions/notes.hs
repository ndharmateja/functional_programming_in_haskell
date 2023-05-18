{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}

-- Recursive functions
-- defining functions in terms of itself
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n - 1)

-- Using other functions
fac2 :: Int -> Int
fac2 n = product [2 .. n]

-- expressions are evaluated by stepwise process of applying functions
-- eg:
-- fac2 4
-- = product [2..4]
-- = product [2, 3, 4]
-- = 2 * 3 * 4
-- = 24
--
-- eg:
-- fac 4
-- = 4 * fac 3
-- = 4 * (3 * fac 2)
-- = 4 * (3 * (2 * fac 1))
-- = 4 * (3 * (2 * (1 * fac 0)))
-- = 4 * (3 * (2 * (1 * 1)))
-- = 4 * (3 * (2 * (1)))
-- = 4 * (3 * (2))
-- = 4 * (6)
-- = 24

-- why recursion?
-- many functions can naturally be defined in terms of themselves
-- properties of functions defined using recursion can be proved using the simple but powerful mathematical technique of induction

-- recursion on lists
product1 :: [Int] -> Int
product1 [] = 1
product1 (x : xs) = x * product1 xs

length1 :: [a] -> Int
length1 [] = 0
length1 (_ : xs) = 1 + length1 xs

reverse1 :: [a] -> [a]
reverse1 [] = []
reverse1 (x : xs) = reverse1 xs ++ [x]

zip1 :: [a] -> [b] -> [(a, b)]
zip1 [] _ = []
zip1 _ [] = []
zip1 (x : xs) (y : ys) = (x, y) : zip1 xs ys

drop1 :: Int -> [a] -> [a]
drop1 0 xs = xs
drop1 _ [] = []
drop1 n (_ : xs) = drop1 (n - 1) xs

(+++) :: [a] -> [a] -> [a]
[] +++ ys = ys
(x : xs) +++ ys = x : (xs +++ ys)

-- Quick sort
-- rule 1: empty list is already sorted
-- rule 2: partition
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x : xs) = qsort [x' | x' <- xs, x' <= x] ++ [x] ++ qsort [x' | x' <- xs, x' > x]