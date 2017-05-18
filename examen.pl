%%Miembro miembro(X,L), cierto si el elemento X esta en la lista L
miembro(X,[X|_]):-!.
miembro(X,[_|Xs]):-miembro(X,Xs).

%%Subconjunto(L,K) cierto si L es un subconjunto de K
subconjunto([],_).
subconjunto([X|Xs],K):-miembro(X,K),subconjunto(Xs,K).

%%Disjuntos(L,K) cierto si L y K son conjuntos Disjuntos
disjunto([],_).
disjunto([X|Xs],K):-not(miembro(X,K)),disjunto(Xs,K).

%% Interseccion(A,B,R) cierto si R es la interseccion de A y B
interseccion([],_,[]).
interseccion([A|B],D,[A|R]):-member(A,D),interseccion(B,D,R).
interseccion([A|B],D,R):-not(member(A,D)),interseccion(B,D,R).

%%Diferencia(A,B,R) cierto si R es la diferencia de A y B

diferencia([],_,[]).
diferencia([A|B],K,M):- miembro(A,K), diferencia(B,K,M).
diferencia([A|B],K,[A|M]):- not(miembro(A,K)), diferencia(B,K,M).

%%Elimina(X,L,LR) cierto si LR es la lista de eliminar X en L

elimina(X,[X|Xs],Xs).
elimina(X,[Y|Ys],[Y|Ls]):-elimina(X,Ys,Ls).

%%Longitud de una lista

long([],0).
long([_|C],N):-long(C,N1),N is N1 + 1.

%%Media de una lista

suma([],0).
suma([X|Xs],S):-suma(Xs,S1), S is S1+X.

media(X,S):-long(X,L),suma(X,SU), S is SU / L.

%Factorial de un numero
factorial(0, 1).
factorial(1, 1).
factorial(N, F) :- N > 1, Z is N - 1, factorial(Z, S), F is S * N.

fac2(N,A):-fac2(N,1,A).
fac2(1,F,F):- !.

fac2(N,S,F):- N2 is N - 1,T2 is S * N,
          fac2(N2, T2, F).


%BET numeros entre 2 numeros
bet(N,M,K):-N=<M,K=N.
bet(N,M,K):-N < M,N1 is N+1,bet(N1,M,K).

%Maxlist nos da el elemento más grande de la lista


maxlist(X,A):-maxlist(X,0,A).
maxlist([],A,A).
maxlist([X|A],As,L):-X>As,Z is X,maxlist(A,Z,L).
maxlist([X|A],As,L):-X<As,maxlist(A,As,L).
