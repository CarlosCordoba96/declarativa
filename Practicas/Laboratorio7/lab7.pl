%%%%%%%EJERCICIO 27

ficha(L) :- tratamiento_ficha(L, 0).
tratamiento_ficha(Termino, N) :- atomic(Termino), tab(N), write(Termino), nl.
tratamiento_ficha(Termino, N) :- compound(Termino), Termino =..[Functor|Args], tab(N),
			write(Functor), nl, NewN is N + 1, tratar_Args(Args, NewN).
tratar_Args([], _).
tratar_Args([Arg|Argumentos], Tabs_in) :- tratar_Args(Arg, Tabs_in), tratar_Args(Argumentos, Tabs_in).
tratar_Args(Arg, Tabs_in) :- atomic(Arg), tab(Tabs_in + 2), write(Arg), nl.
tratar_Args(Arg, Tabs_in) :- compound(Arg), Arg =..[Func|Args], tab(Tabs_in), write(Func), nl,
			tratar_Args(Args, Tabs_in).

%%%%%%%EJERCICIO 29

suma2(X, Y) :- Y is X + 2.
cuadrado(X, Y) :- Y is X * X.
doble(X, Y) :- Y is 2 * X.

%% map(Fun, L1, L2).

map(_, [], []).
map(Fun, [X|L1], [Y|L2]) :- apply(Fun, X, Y), map(Fun, L1, L2).
apply(Fun, X, Y) :- T=..[Fun|[X,Y]], T.

%% reduce(L, F, B, R): L es una lista, F es el functor, B es el valor base
% Y R es el resultado
