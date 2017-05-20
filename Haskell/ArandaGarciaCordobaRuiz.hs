qsort :: Ord a => [a] -> [a]

qsort [] = []
qsort (x:xs) = qsort menor ++ [x] ++ qsort mayor  where menor  = filter (< x) xs    mayor = filter (>= x) xs



mi_map :: (a -> b) -> [a] -> [b]

mi_map func [] = []
mi_map func (x:xs) = func x:(mi_map func xs)

suma func (x) = suma_aux func 0 x
suma_aux func acum [] = acum
suma_aux func acum (x:xs) = suma_aux func suma_parcial xs  where suma_parcial = (func x) + acum

suma' func (x) = foldl (\x y -> x + y) 0 (map func x)
