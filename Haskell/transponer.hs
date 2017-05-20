-- Transponer --

{- Toma como argumento la matriz y devuelve
su transpuesta -}

-- ObtenerFila --

{- Toma una matriz y devuelve una lista
con los primeros elementos que forman 
la primera columna de dicha matriz -}

transponer :: [[a]] -> [[a]]
obtenerFila :: [[a]] -> [a]

obtenerFila [[]] = []
obtenerFila xs   = map head xs

transponer ([]:_) = []
transponer xs     = (obtenerFila xs):(transponer (map tail xs))