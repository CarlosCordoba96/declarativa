-- Take --

{- Toma un entero y una lista, y devuelve el número de
elementos de esa lista que ha sido especificado en el 
primer parámetro -}

take' :: Int -> [a] -> [a]

take' x _
    | x <= 0   = []

take' _ []     = []
take' x (y:ys) = y:(take' (x - 1) (ys))