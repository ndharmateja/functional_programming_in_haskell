-- [] -- => empty list
-- [2] -- => single ton list
-- [1, 2] ++ [3, 4, 5] -- => list concatenation [1, 2, 3, 4, 5]
-- 1 : [2, 3, 4] -- => adds to list [1, 2, 3, 4]

-- [ a | a <- xs, a <= x] -- => this is a list of elements such that for each 'a' belonging to 'xs' and a <= x