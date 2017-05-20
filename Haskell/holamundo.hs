sum:: Integer-> Integer
sum x= x+1

quicksort:: [Integer]->[Integer]
quicksort []=[]
quicksort(x:xs)= quicksort [y|y<-xs, y<x] ++ [x] ++ quicksort[y| y<- xs,y>x]

eliminar []=[]
eliminar (x:xs)= xs

add:: Integer-> Integer->Integer
add x y= x+y

map':: (a->b)->[a]->[b]
map' f []=[]
map' f (x:xs) = f x :( map' f xs)

isthere :: Eq a => a -> [a] -> Bool
isthere _ []=False
isthere x (y:ys)
    |  x==y = True
    |otherwise = isthere x ys

app :: [a] -> [a] -> [a]
app [] x= x
app (x:xs) y= x:(app xs y)

rev [] =[]
rev (x:xs)= app(rev xs) [x]

firsth :: [a]->[a]
firsth xs= take (length xs `div` 2) xs

lasth :: [a]->[a]
lasth xs= drop(length xs `div` 2) xs

merge :: Ord a => [a] -> [a] -> [a]
merge [] x=x
merge y [] =y
merge (x:xs) (y:ys)
    | (x <= y) =x:(merge xs (y:ys))
    |otherwise = y:(merge (x:xs) ys)

mergesort []= []
mergesort[x]=[x]
mergesort xs= merge (mergesort (firsth xs)) (mergesort (lasth xs))
