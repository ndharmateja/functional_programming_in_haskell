-- [] empty list
-- [2] single ton list
-- [1, 2] ++ [3, 4, 5] list concatenation [1, 2, 3, 4, 5]
-- 1 : [2, 3, 4] adds to list [1, 2, 3, 4]

-- [ a | a <- xs, a <= x] this is a list of elements such that for each 'a' belonging to 'xs' and a <= x

-- base case
-- takes and returns an empty list
qsort [] = []
-- [x: xs] is breaking up a list into x and [remaining elements]
qsort (x : xs) = qsort ys ++ [x] ++ qsort zs
  where
    ys = [a | a <- xs, a <= x]
    zs = [a | a <- xs, a > x]

-- above is doing a quick sort