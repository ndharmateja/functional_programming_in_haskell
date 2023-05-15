-- Exercises
-- 1. ['a', 'b', 'c'] :: [Char]
-- 2. ('a', 'b', 'c') :: (Char, Char, Char)
-- 3. [(False, '0'), (True, '1')] :: [(Bool, Char)]
-- 4. ([False, True], ['0', '1']) :: ([Bool], [Char])
-- 5. [tail, init, reverse] :: [[a] -> [a]]
-- 6
second :: [a] -> a
second xs = head (tail xs)

-- 7
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

-- 8
pair :: a -> b -> (a, b)
pair x y = (x, y)

-- 9
double :: Num a => a -> a
double x = x * 2

-- 10
palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

-- 11
twice :: (Int -> Int) -> Int -> Int
twice f x = f (f x)
