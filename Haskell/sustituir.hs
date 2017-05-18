-- Sustituir --

-- sus: sustituye un elemento de una lista por otro --
sus :: (Eq a) => a -> a -> [a] -> [a]
sus x y [] = []
sus x y (z:zs)
    | x == z 	= y:(sus x y (zs))
    | otherwise = z:(sus x y (zs))