n2l(N,L):- n2l(N,L,[]).
n2l(N,As,A):-N>0, N=< 9, append([N],A,As).
n2l(N,L,A):- N>0,NewN is N//10,N1 is N mod 10, append([N1],A,As),n2l(NewN,L,As).

preorden(nil, []).
preorden([], []).
preorden(hoja(X), [X]).
preorden(nodo(X, T), [X|L]) :- preorden(T, L).
preorden([N|Ns], L) :- preorden(N, L1), preorden(Ns, L2), append(L1, L2, L).




% Ej 1
% int2nat(I, N) : true si N es I en notacion de Peano
int2nat(0, cero).
int2nat(I, suc(N)) :- NewI is I-1, int2nat(NewI, N).

% nat2int(N, I) : true si N es I en notacion de Peano
nat2int(N, I) :- int2nat(N,I).

% aplanar(Lista, Aplanada) : true si Aplanada es el resultado de
% reorganizar las listas anidadas de Lista en un unico nivel.
aplanar([], []).
aplanar([X|Xs], [X|PXs]) :- atomic(X), aplanar(Xs, PXs).
aplanar([X|Xs], P) :- aplanar(X, PX), aplanar(Xs, PXs), append(PX, PXs, P).
% Ej 2
% transponer(A, T) : true si T es el arbol resultado de transponer las
% ramas del arbol binario A
transponer([], []).
transponer(nil, nil).
transponer(hoja(H), hoja(H)).
transponer(nodo(N, [NL, NR]), nodo(N, [NRT, NLT])) :- transponer(NL, NLT), transponer(NR, NRT).

% preorden(A, L) : true si L es el resultado de recorrer el árbol A en
% orden preorden.
preorden(nil, nil).
preorden(hoja(H), hoja(H)).
preorden(nodo(X, []), X).
preorden(nodo(X, [L|[]]), [X|LP]) :- preorden(L, LP).
preorden(nodo(X, [L|Ls]),[L1|L2]):- preorden(L, L1), preorden(Ls, Ls2).

preordenLista([L|[]], P) :- preorden(L, P).
preordenLista([L|Ls], [P1|P2]) :- preorden(L, P1), preordenLista(Ls, P2).

% Ej 3
% ntol(N, L) true si L es la lista de digitos del numero entero N
ntol(N, L) :- ntol(N, L, 1).

ntol(N, L, D) :- N =:= N mod D.
ntol(N, [Ls|L], D) :- L is N // D - N // (D * 10) * 10, NewD is D * 10, ntol(N, Ls, NewD).












