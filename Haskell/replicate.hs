-- Replicate --

{- Toma un entero y un valor, y devuelve una 
lista con ese valor replicado -}

replicate' :: Int -> a -> [a]

replicate' x _
	| x <= 0   = []
	
replicate' x y = y:(replicate' (x - 1) y)