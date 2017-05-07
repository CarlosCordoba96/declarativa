%%%%%%%EJERCICIO 23
% add(X, L, L1): añade un elemento X a la lista L para dar la lista L1,
% sin incurrir en repeticiones
add(X, [], [X]).
add(X, L, L1) :- member(X, L), L1 = L, !.
add(X, L, [X | L]).
% sin el corte, el programa es el siguiente
add2(X, [], [X]).
add2(X, L, L1) :- member(X, L), L1 = L.
add2(X, L, [X | L]).
%%%%%%%EJERCICIO 25
% cubo: solicita un número por teclado y calcula su cubo
cubo :- write('Siguiente numero: '), read(X),
	(X \= 'stop' -> Z is X ** 3, write('El cubo de '), write(X), write(' es '), write(Z), nl, cubo;
	write('yes')).
	suma2(X,Y):- Y is X+2.
neg(A,B):- B is -A.
%% map(Fun, L1, L2).

map(_, [], []).
map(Fun, [X|L1], [Y|L2]) :- apply(Fun, X, Y), map(Fun, L1, L2).
apply(Fun, X, Y) :- T=..[Fun|[X,Y]], T.
