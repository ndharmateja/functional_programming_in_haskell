-- base case
-- takes and returns an empty list
qsort [] = []
-- (x: xs) -- => is breaking up a list into x and [remaining elements]
qsort (x : xs) = qsort ys ++ [x] ++ qsort zs
  where
    ys = [a | a <- xs, a <= x]
    zs = [a | a <- xs, a > x]

-- above is doing a quick sort