{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Redundant if" #-}
{-# HLINT ignore "Use guards" #-}

-- 1. safetail
-- a. conditional expression
safetail1 :: [a] -> [a]
safetail1 xs =
  if null xs
    then []
    else tail xs

-- b. guarded expressions
safetail2 :: [a] -> [a]
safetail2 xs
  | null xs = []
  | otherwise = tail xs

-- c. pattern matching
safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 (_ : xs) = xs

-- 2. '||' using pattern matching
-- a
(||) :: Bool -> Bool -> Bool
True || True = True
True || False = True
False || True = True
False || False = False

-- b
(|||) :: Bool -> Bool -> Bool
False ||| False = False
_ ||| _ = True

-- c
(||||) :: Bool -> Bool -> Bool
False |||| b = b
True |||| _ = True

-- 3. '&&' using conditionals
-- replace the following pattern
-- True && True = True
-- _ && _ = False
(&&&) :: Bool -> Bool -> Bool
(&&&) x y =
  if x
    then
      if y
        then True
        else False
    else
      if y
        then False
        else False

-- 4. '&&' using conditionals
-- replace the following pattern
-- True && b = b
-- False && _ = False
(&&&&) :: Bool -> Bool -> Bool
(&&&&) x y =
  if x
    then y
    else False
