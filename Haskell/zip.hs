-- Zip --

-- Tomas dos listas y las comprime juntas --

zip' :: [a] -> [b] -> [(a,b)]

zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):(zip' xs ys)