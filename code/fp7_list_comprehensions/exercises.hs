{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}

-- 1. pythogorean triplets
-- pyths 5 -- => [(3, 4, 5), (4, 3, 5)]
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1 .. n], y <- [1 .. n], z <- [1 .. n], x ^ 2 + y ^ 2 == z ^ 2]

-- 2. Perfect numbers
-- perfects 500 -- => [6, 28, 496]
-- sum of all factors of number (excluding itself) is equal to the number
factors :: Int -> [Int]
factors n = [x | x <- [1 .. n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1 .. n], sum (init (factors x)) == x]

-- 3. Scalar product of two lists of integers xs and ys
scalar :: [Int] -> [Int] -> Int
scalar xs ys = sum [x * y | (x, y) <- zip xs ys]
