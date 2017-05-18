-- Num2List --

-- convierte un número entero a una lista de dígitos --

num2List :: Int -> [Int]

num2List x 
    | x < 10    = [x]
	| x > 9     = (num2List newElem) ++ [lastElem]
	where newElem = div x 10
	      lastElem  = mod x 10