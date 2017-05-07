%%%EJERCICIO 9
%%% partir(L, L1, L2) divide la lista L en dos partes L1 y L2, tales que
%%% los elementos de L1 son menores o iguales que un cierto elemento N
%%% perteneciente a L y los de L2 son mayores que ese elemento N. El
%%% elemento N seleccionado no se incluye en las listas partidas L1 y L2.
borra(X, [X|Y], Y).
partir(_, [], [], []).
partir(X, [Y|L], [Y|L1], L2) :- Y =< X, partir(X, L, L1, L2).
%%% otra manera de poner partir (auxiliar).
%%% ! (predicado corte) detiene la búsqueda de nuevas soluciones. impide
%%% el backtracking.
% partir(X, [Y|L], [Y|L1], L2) :- Y =< X, !, partir(X, L,
% L1, L2).
% partir(X, [Y|L], L1, [Y|L2]) :- partir(X, L, L1, L2).
partir(X, [Y|L], L1, [Y|L2]) :- Y > X, partir(X, L, L1, L2).
partir(L, L1, L2) :- borra(X, L, S), partir(X, S, L1, L2).
%%%Otro modo de partir (método de pascual).
partir_pascual(_, [], [], []).
partir_pascual(X, [Y|Xs], [Y|L1], L2) :-  Y =< X, partir_pascual(X, Xs, L1, L2).
partir_pascual(X, [Y|Xs], L1, [Y|L2]) :-  Y > X, partir_pascual(X, Xs, L1, L2).
partir_pascual([], [], []).
partir_pascual([X|Xs], L1, L2) :- partir_pascual(X, Xs, L1, L2).
%%%EJERCICIO 10
%%% quicksort(Lista, ListaOrdenada).
quicksort([], []).
quicksort([X|Lista], ListaOrdenada) :- partir([X|Lista], L1, L2),
	quicksort(L1, OrdenadaL1), quicksort(L2, OrdenadaL2),
	append(OrdenadaL1, [X|OrdenadaL2], ListaOrdenada).
%%% EJERCICIO 11
%%% merge_sort(Lista, ListaOrdenada).
%%% split(Lista, ListaPartida1, ListaPartida2): Lista es una lista que
%%% será partida en 2 partes: ListaPartida1 y ListaPartida2.
split(L, N, L1, L2) :- length(L1, N), append(L1, L2, L).
split(L, L1, L2) :- length(L, X), Half is X // 2, split(L, Half, L1, L2).
mezcla([X|L], [], [X|L]).
mezcla([], [X|L], [X|L]).
mezcla([X|L1], [Y|L2], [Y|L]) :- X >= Y, mezcla([X|L1], L2, L).
mezcla([X|L1], [Y|L2], [X|L]) :- X < Y, mezcla(L1, [Y|L2], L).
merge_sort([], []).
merge_sort([X], [X]).
merge_sort([X|Lista], ListaOrdenada) :- length(Lista, S), S > 0, split([X|Lista], L1, L2), merge_sort(L1, OrdenadaL1), merge_sort(L2, OrdenadaL2), mezcla(OrdenadaL1, OrdenadaL2, ListaOrdenada).
%%% EJERCICIO 12
%% El polinomio Cnxn + : : : + C2x2 + C1x + C0, donde Cn; ... ;C1;C0 son
%% coeficientes enteros, puede representarse en Prolog mediante el
%% siguiente término:
%cn * x ** n + ... + c2 * x ** 2 + c1 * x + c0.

% El operador “**” es un operador binario infijo. Cuando se evalúa la
% expresión “X ** n”, computa la potencia enésima de X. Observe que el
% operador “**” liga más que el operador binario infijo “*”, que a su vez
% liga más que el operador binario infijo “+” (por lo tanto no se
% requiere el uso de paréntesis). Observe también que, en la
% representación anterior, la variable x se trata como una constante.
% Defina un predicado eval(P, V, R) que devuelva el resultado R de
% evaluar un polinomio P para un cierto valor V de la variable x. A modo
% de ejemplo, el objetivo ?- eval(5 * x ** 2 + 1, 4, R). debe tener éxito
% con respuesta R = 81.
sustituir(P + A, V, R) :- sustituir(P, V, X), sustituir(A, V, Z), R is X + Z, !.
sustituir(C * x ** N, V, C * V ** N).
sustituir(x ** N, V, V ** N).
sustituir(E, _V, E) :- integer(E).
sustituir(x, V, V).
sustituir(C, _V, C) :- integer(C).
sustituir(C*x, V, C*V) :- integer(C).
eval(P, V, R) :- sustituir(P, V, E), R is E.
%%% EJERCICIO 11
% d(P, D), derivada D de un polinomio P con respecto a x. Se requiere
% que el polinomio D, que se obtiene como resultado, se presente en un
% formato simplificado.
sus(P + A, P + A) :- P \= 0, A \= 0.
sus(P + A, P) :- A == 0.
sus(P + A, A) :- P == 0.
susd(P + A, R) :- susd(P, Z), susd(A, X), sus(Z + X, W), R = W.
susd(C*x, C) :- integer(C).
susd(x, C) :- C is 1.
susd(C, N) :- integer(C), N is 0.
susd(x ** N, N * x ** Z) :- Z is N - 1.
susd(C * x ** N, A * x ** Z) :- N - 1 > 1, A is C * N, Z is N - 1.
susd(x ** N, x) :- N =:= 1.
susd(C * x ** N, A * x) :- N - 1 =:= 1, A is C * N.
susd(C * x ** N, C * x) :- N =:= 1.
d(P, D) :- susd(P, Z), D = Z.













