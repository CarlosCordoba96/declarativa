-- Sum --

{- Toma una lista y devuelve la suma de todos
los elementos de la lista pasa como parámetro-}

sum' :: (Num a) => [a] -> a

sum' [] = 0
sum' (x:xs) = x + (sum' xs)