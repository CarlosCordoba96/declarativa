module Main where

import Stack

stack :: Stack Int
stack = (push 3 (push 2 (push 1 Stack.empty)))
total :: Int
total = fst (pop stack)

main :: IO ()
main = print (total)