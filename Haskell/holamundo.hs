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
