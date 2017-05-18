-- Repeat --

-- Toma un valor y genera una lista infinita de ese valor --

repeat' :: a -> [a]

repeat' x = x:(repeat' x)