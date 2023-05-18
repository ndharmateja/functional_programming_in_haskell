-- comprehension notation can be used to construct new lists from old lists
-- [x^2 | x <- [1..5]] -- => [1, 4, 9, 16, 25]
-- x <- [1..5] is called a generator, as it states how to generate values for x

-- comprehensions can have multiple generators, separated by commas
-- [(x, y) | x <- [1..3], y <- [4, 5]] -- => [(1, 4), (1, 5), (2, 4), (2, 5), (3, 4), (3, 5)]

-- changing order of generators changes the order of elements
-- [(x, y) | y <- [4, 5], x <- [1..3]] -- => [(1, 4), (2, 4), (3, 4), (1, 5), (2, 5), (3, 5)]

-- multiple generators are like nested loops, with later generators as more deeply nested loops

-- dependant generators
-- later generators can depend on the variables that are introduced by earlier ones
-- [(x, y) | x <- [1..3], y <- [x..3]] -- => [(1, 1), (1, 2), (1, 3), (2, 2), (2, 3), (3, 3)]

-- using a dependant generator, we can define the library function that concatenates list of lists
concat2 :: [[a]] -> [a]
concat2 xss = [x | xs <- xss, x <- xs]

-- Guards
-- list comprehensions can use guards to restrict the values produced by earlier generators
-- [x | x <- [1..10], even x] -- => [2, 4, 6, 8, 10]

-- define a function that maps a positive integer to list of its factors
factors :: Int -> [Int]
factors n = [x | x <- [1 .. n], n `mod` x == 0]

-- is prime
isPrime :: Int -> Bool
isPrime n = factors n == [1, n]

-- all primes below 'n'
primes :: Int -> [Int]
primes n = 2 : [x | x <- [3 .. n], isPrime x]

-- the zip function
zip2 :: [a] -> [b] -> [(a, b)]
zip2 xs ys = [(xs !! i, ys !! i) | i <- [0 .. (min (length xs) (length ys) - 1)]]

-- the pairs function
-- pairs [1, 2, 3, 4] -- => [(1, 2), (2, 3), (3, 4)]
pairs :: [a] -> [(a, a)]
pairs xs = zip2 xs (tail xs)

-- check if list is sorted
-- and [True, True, False] -- => False
-- and [True, True, True] -- => True
isSorted :: Ord a => [a] -> Bool
isSorted xs = and [x <= y | (x, y) <- pairs xs]

-- positions function
-- returns the list of all positions of x in xs
-- positions 0 [1, 0, 0, 1, 0, 1, 1, 0] -- => [1, 2, 4, 7]
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (i, x') <- zip [0 ..] xs, x' == x] -- [0..] is 0 to infinite but lazy evaluation

-- String comprehensions
-- string is a sequence of chars
-- internally strings are represented as lists of chars
-- "abc" :: String
-- ['a', 'b', 'c'] :: [Char]
-- both above are same, so any polymorphic list functions can be applied to strings, which is essentially a list of chars
-- length "abcde" -- => 5
-- take 3 "abcde" -- => "abc"
-- zip "abcde" [1..3] -- => [('a', 1), ('b', 2), ('c', 3)]

-- list comprehensions can be used to define functions on strings
count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']
