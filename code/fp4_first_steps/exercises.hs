-- mimic last function
last1 ns = head (reverse ns)

last2 ns = ns !! (length ns - 1)

-- mimic init function (which removes last element)
init1 ns = reverse (drop 1 (reverse ns))

init2 ns = take (length ns - 1) ns

init3 ns = reverse (tail (reverse ns))