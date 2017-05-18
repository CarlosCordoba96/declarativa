-- igualesElem --

{- igualesElem: devuelve true si las listas son iguales
sin importar el orden de aparición -}

igualesElem :: (Eq a) => [a] -> [a] -> Bool
borrar :: (Eq a) => a -> [a] -> [a]

borrar x [] = []
borrar x (y:ys)
    | x == y 	= ys
    | otherwise = y:(borrar x (ys))
 
igualesElem [] [] = True
igualesElem (x:xs) (ys)
    | length (x:xs) == length ys = igualesElem (xs) (borrar x (ys))
    | otherwise                  = False