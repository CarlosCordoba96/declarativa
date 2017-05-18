-- Elem --

{- Toma un valor y una lista y verifica si el elemento
está en la lista -}

elem' :: (Eq a) => a -> [a] -> Bool

elem' _ [] = False
elem' x (y:ys)
	| x == y    = True
	| otherwise = elem' x ys