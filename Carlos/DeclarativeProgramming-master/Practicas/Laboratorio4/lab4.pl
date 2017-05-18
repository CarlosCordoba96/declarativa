%%%EJERCICIO 14
% esRosadelfa(O), el objeto O es una rosadelfa.
esRosadelfa(nil).
esRosadelfa(hoja(_)).
esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).
esListaRosadelfas([R]) :- esRosadelfa(R).
esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).
%%%EJERCICIO 15
% grado(A, G): si G es el grado de A.
% maxGrado(T, S): S es el grado máximo de la lista de árboles T.
% maxGrado(T, A, G):
maxGrado([], 0).
maxGrado(Ts, G) :- maxGrado(Ts, 0, G).
maxGrado([], A, A).
maxGrado([T|Ts], A, G) :- grado(T, GT),
	(GT > A -> maxGrado(Ts, GT, G); maxGrado(Ts, A, G)).
grado(nil, 0).
grado(hoja(_X), 0).
grado(nodo(_X, Ts), G) :- length(Ts, G1), maxGrado(Ts, G2),
	G is max(G1, G2).
% suma(L, S): S es la suma de la lista de números L.
suma([], 0).
suma([N|Ns], S) :- suma(Ns, SR), S is N + SR.
suma(L, S) :- suma(L, 0, S).
suma([], A, A).
suma([N|Ns], A, S) :- NewA is A+N, suma(Ns, NewA, S).
% peso(A, P): P es el peso del arbol A
peso([], 0).
peso(A, P) :- peso(A, 0, P).
peso([], A, A).
peso([T|Ts], A, P) :- pesoNodo(T, Z), H is A + Z, peso(Ts, H, P).
% pesoNodo(N, P): P es el peso del Nodo N
pesoNodo(nil, 0).
pesoNodo(hoja(_X), 1).
pesoNodo(nodo(_, T), N) :- peso(T, P), N is P + 1.
% frontera(A, L): L es la lista de hojas del arbol A
frontera(nil, []).
frontera(arbol(nil, X, nil), [X]).
frontera(hoja(X), [X]).
frontera(arbol(X, _Z, Y), L) :-  frontera(X, Z), frontera(Y, W), append(Z, W, L).
% preorden(A, L): L es la lista de nodos visitados del Arbol A en
% recorrido preorden
preorden(nil, []).
preorden(hoja(X), [X]).
preorden(arbol(nil, X, nil), [X]).
preorden(arbol(X, Z, Y), L) :- preorden(X, L1), preorden(Y, L2),
	append([Z|L1], L2, L).
% postorden(A, L): L es la lista de nodos visitados del Arbol A en
% recorrido postorden
postorden(nil, []).
postorden(hoja(X), [X]).
postorden(arbol(nil, X, nil), [X]).
postorden(arbol(X, Y, Z), L) :- postorden(X, L1), postorden(Z, L2),
	append(L1, L2, L3), append(L3, [Y], L).










