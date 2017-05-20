-- Partir --

{- Toma una lista L y devuelve dos listas L1 y L2,
tal que la primera L1 tendrá todos los elementos 
menores o iguales que un cierto elemento n de la 
lista L y los de L2 son mayores que los de ese elemento.
El elemento n no estará contenido en ninguna lista. -}

partir :: [Int] -> ([Int], [Int])

partir [] = ([], [])
partir (x:xs) =
	let left  = [a | a <- xs, a <= x]
	    rigth = [a | a <- xs, a > x]
	in  (left, rigth)