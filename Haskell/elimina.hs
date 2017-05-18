-- Elimina --

{- Genera una lista que es el resultado de
eliminar todas las apariciones del elemento x -}

elimina :: (Eq a) => a -> [a] -> [a]

elimina _ [] = []
elimina x (y:ys)
    | x == y    = elimina x ys
    | otherwise = y:(elimina x ys)