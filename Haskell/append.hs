-- Append --

{- Genera una lista, la cual es la unión de
las listas pasadas como parámetro -}

append :: [a] -> [a] -> [a]

append [] [] = []
append [] ys = ys
append (x:xs) (ys) = x:(append xs (ys))