-- Map --

{- Toma una función y una lista, y el resultado
es aplicar esa función a cada elemento de la lista
generando una nueva -}

map' :: (a -> b) -> [a] -> [b]

map' _ [] = []
map' f (x:xs) = (f x):(map' f xs)

{- El resultado es una lista [b] porque (a -> b)
es una función que toma un parámetro a y devuelve
un valor b, por lo tanto, la lista resultante estará
compuesta de valores de b -}