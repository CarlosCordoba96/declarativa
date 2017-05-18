-- Quicksort --

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let small_list = [c | c <- xs, c <= x] 
        big_list = [c | c <- xs, c > x] 
    in  quicksort small_list ++ [x] ++ quicksort big_list