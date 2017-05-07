-- EJERCICIO 30 --

{- El predicado digit que aplicado
a un carácter nos dice si este es 
un dígito -}

isDigitMine :: Char -> Bool
isDigitMine x = x >= '0' && x <= '9'

{- Los predicados uppercase y lowercase que aplicados a un carácter nos
dice si es una letra mayúscula o minúscula. (nota: entienda por letra los
caracteres [a .. z] y [A .. Z] ) -}

uppercase :: Char -> Bool
uppercase c = c >='A' && c <= 'Z'

lowercase :: Char -> Bool
lowercase c = c >='a' && c <= 'z'

{- El predicado letter que aplicado a un carácter nos dice si es una
letra -}

letter :: Char -> Bool
letter c = c >= 'A' && c <= 'z'

{- La función charofdigit que aplicada a un entero entre 0 .. 9 lo
convierte en carácter -}

{- toEnum convierte un entero en su caracter ascii, mientras que 
fromEnum convierte un carácter en su entoro ascii -}
{- error lo que hace es mostrar "*** Exception:" seguido de la cadena
que le pasemos -}

charofdigit :: Int -> Char
charofdigit i
	| i >= 0 && i <=  9 	=  toEnum (fromEnum '0' + i)
	| otherwise 			=  error "it's not a digit"

-- EJERCICIO 31 --

{- La función among es un predicado. 'x' es un objeto de 
tipo a, 'ys' es una lista formada por objetos de tipo a. 
among devuelve true -}

among :: (Eq a) => (a, [a]) -> Bool
among (x, y:ys)
	| x == y 				= True
	| ys == []				= False
	| otherwise				= among(x, ys)

{- concatena un string un número entero de veces -}

stringcopy :: Int -> String -> String
stringcopy n s
	| n == 0 				= []
	| n > 0					= s ++ stringcopy (n - 1) s
	| otherwise				= error "it's not allowed to use negative values"

-- EJERCICIO 32 --

{- Definir tipo Carta, Palo y Valor. Además, especificar
las funciones "palode", "valorde" y los predicados "esvalor", "espalo" -}

data Palo = Oros | Espadas | Copas | Bastos
	deriving(Eq, Show)
data Valor = Numerico Int | Sota | Caballo | Rey | As
	deriving(Eq, Show)
data Carta = Carta Valor Palo
palode :: Carta -> Palo
valorde :: Carta -> Valor
espalo :: Palo -> Carta -> Bool
esvalor :: Valor -> Carta -> Bool
palode (Carta v p) = p
valorde (Carta v p) = v
espalo p c
	| p == palode c 		= True
	| otherwise 			= False

esvalor v c
	| v == valorde c 		= True
	| otherwise 			= False