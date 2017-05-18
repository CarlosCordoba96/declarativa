-- SplitAt --

{- Toma un entero y una lista, y el resultado es
devolver una tupla con los primeros n elementos de 
la lista en la parte izquierda de la tupla y los demás
elementos en la parte derecha de la tupla -}

splitAt' :: Int -> [a] -> ([a], [a])

splitAt' n xs = (take n xs, drop n xs)