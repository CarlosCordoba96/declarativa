%%%LABORATORIO2
%%%REGLAS
%%% EJERCICIO4. sus(X, Y, L1, L2), X es un elemento que se cambia por
%%% otro Y en la lista L1, para dar lugar a L2.
sus(_, _, [], []).
sus(X, Y, [X|A], [Y|Z]) :- sus(X, Y, A, Z), !.
sus(X, Y, [W|A], [W|Z]) :- sus(X, Y, A, Z), !.
%%%EJERCICIO5. aplanar(L, A), A es el resultado de aplanar L.
aplanar([], []).
aplanar([X|R], [X|P]) :- atomic(X), aplanar(R, P).
aplanar([X|R], P) :- not(atomic(X)), aplanar(X, P_X),
	aplanar(R, P_R), append(P_X, P_R, P).
%%% EJERCICIO6. igualesElem(L1, L2), comprobar que L1 y L2 son listas
%%% que contienen los mismos elementos independientemente del orden de
%%% aparición.
%%% borra(X, Y, Z): true si Z es el resultado de borrar un elemento X
%%% que está en la lista Y.
borra(X, [X|S], S).
borra(X, [Y|S], [Y|Z]) :- borra(X, S, Z).
igualesElem(L1, L2) :- length(L1, N), length(L2, N), igualesE(L1, L2).
igualesE([],[]).
igualesE([X|S],[X|Z]) :- igualesE(S, Z).
igualesE([X|S], Y) :- borra(X, Y, Z), igualesE(S, Z).
%%% EJERCICIO7. descomponer(N, A, B), donde N es un número natural. A y
%%% B son los valores que devuelve de tal modo que N = A + B.
descomponer(N, A, B) :- between(1, N, A), between(1, N, B), A mod 2 =:= 0,
	B mod 2 =:= 0, A + B =:= N.
%%% EJERCICIO8. numBrandeth(N, C), N es un número tal que su cuadrado,
%%% C, descompuesto por la mitad sea igual a N. Ejemplo: N = 45. C =
%%% 2025. N = 20 + 25 (descomponer por la mitad a C).
numBrandeth(N, C) :- between(32, 99, N), C is N*N, C div 100 + C mod 100 =:= N.







