-- Drop --

{- Toma un entero y una lista, y devuelve una lista que
contiene los elementos desde la posición que pasamos como
primer parámetro hasta el final esa lista -}

drop' :: Int -> [a] -> [a]

drop' _ []           = []

drop' n xs@(_:ys)
	| n > 0          = (drop' (n - 1) xs)
	| otherwise      = ys

{- el patrón xs@ coincidirá exactamente con
(_:ys). Con este patrón se puede acceder facilmente
a la lista original entera -}