-- Intercalar --

-- Entrelaza dos listas para obtener una tercera --

intercalar :: [a] -> [a] -> [a]

intercalar [] [] = []
intercalar [] ys = ys
intercalar xs [] = xs
intercalar (x:xs) (y:ys) = x:y:(intercalar xs ys)