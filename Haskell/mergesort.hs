-- Merge sort --

mergesort :: (Ord a) => [a] -> [a]
merge :: (Ord a) => [a] -> [a] -> [a]

merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
	| x <= y 	= x:(merge xs (y:ys))
	| otherwise = y:(merge (x:xs) ys)

mergesort [] = []
mergesort [x] = [x]
mergesort xs = 
    let (a, b) = splitAt (div (length xs) 2) xs
    in merge (mergesort a) (mergesort b)