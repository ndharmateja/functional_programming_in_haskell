{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}

-- 1
-- a. and
and1 :: [Bool] -> Bool
and1 [] = True
and1 (x : xs) = x && and1 xs

-- b. concat
concat1 :: [[a]] -> [a]
concat1 [] = []
concat1 (xs : xss) = xs ++ concat1 xss

-- c. replicate a list with n identical elements
-- replicate 3 'c' -- => ['c', 'c', 'c']
replicate1 :: Int -> a -> [a]
replicate1 0 _ = []
replicate1 n x = x : replicate1 (n - 1) x

-- d. select nth element of the list
(!!!) :: [a] -> Int -> a
(!!!) (x : _) 0 = x
(!!!) (_ : xs) n = (!!!) xs (n - 1)

-- e. if a value is an element of a list
elem1 :: Eq a => a -> [a] -> Bool
elem1 _ [] = False
elem1 x' (x : xs) = (x == x') || elem1 x' xs

-- 2. merge sort
-- a. merge
merge :: Ord a => [a] -> [a] -> [a]
merge [] xs = xs
merge xs [] = xs
merge (x : xs) (y : ys)
  | x <= y = x : merge xs (y : ys)
  | x > y = y : merge (x : xs) ys

-- b. msort
msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort left) (msort right)
  where
    left = [x | (i, x) <- zip [0 ..] xs, i < length xs `div` 2]
    right = [x | (i, x) <- zip [0 ..] xs, i >= length xs `div` 2]
