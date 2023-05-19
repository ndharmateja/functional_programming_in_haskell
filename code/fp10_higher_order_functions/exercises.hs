{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use map" #-}

-- 1. What are higher order functions that return functions as results better known as?
-- Curried functions

-- 2. Express [f x | x <- xs, p x] using map and filter
-- map f (filter p xs)

-- 3. Redefine map and filter using foldr
-- a. map
-- map :: (a -> b) -> [a] -> [b]
-- map _ [] = []
-- map f (x: xs) = f x : map f xs
map1 :: (a -> b) -> [a] -> [b]
map1 f = foldr (\x xs -> f x : xs) []

-- b. filter
-- filter :: (a -> Bool) -> [a] -> [a]
-- filter f (x: xs)
--     | f x = x : filter f xs
--     | otherwise = filter f xs
filter1 :: (a -> Bool) -> [a] -> [a]
filter1 f = foldr (\x xs -> if f x then x : xs else xs) []