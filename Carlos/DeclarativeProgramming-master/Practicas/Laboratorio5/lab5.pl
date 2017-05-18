%%%%%%%EJERCICIO 18
%invertir(L, I), I es la lista que resulta de invertir L
% Un poco ineficiente este método
invertir1([],[]).
invertir1([H|T],L) :- invertir1(T,Z), append(Z,[H],L).
% invertir2(L,I), I es la lista que resulta de invertir L
% Usando un parametro de acumulacion.
% Más eficiente
invertir2(L,I) :- inv(L, [], I).
% inv(Lista, Acumulador, Invertida)
inv([], I, I).
inv([X|R], A, I) :- inv(R, [X|A], I).
%%%%%%%EJERCICIO 19
% longitud1(L,N), N es la longitud de la lista L
longitud1([],0).
longitud1([_H|T], N) :- longitud1(T, Z), N is Z + 1.
%Utilizando parámetros de acumulación, definir una versión
% longitud2(L,N) más eficiente.
longitud2(L, N) :- longitud(L, 0, N).
longitud([], N, N).
longitud([_X|L], A, N) :- Z is A + 1, longitud(L, Z, N).

%%%%%%%EJERCICIO 20
% suma1(L,N), N es la suma de los elementos de una lista de enteros.
suma1([],0).
suma1([H|T], N) :- suma1(T, Z), N is Z + H.
% Utilizando parámetros de acumulación,
% definir una versión suma2(L,N) más eficiente.
suma2(L, N) :- sum(L, 0, N).
sum([], N, N).
sum([X|L], A, N) :- Z is X + A, sum(L, Z, N).

%%%%%%%EJERCICIO 21
% fib(N, F), F es el número Fibonacci de N
fib(0, 0).
fib(1, 1).
fib(X, F) :- X > 1, N1 is X - 1, fib(N1, S), N2 is X - 2, fib(N2, R),
	F is S + R.
