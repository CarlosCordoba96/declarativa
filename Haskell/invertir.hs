-- Invertir una lista --

invertir :: [a] -> [a]

invertir [] = []
invertir (x:xs) = invertir xs ++ [x]