-- Last --

-- Toma una lista y devuleve su último elemento --

last' :: [a] -> a

last' [] = error "Empty list"
last' (x:[]) = x
last' (x:xs) = last'(xs)