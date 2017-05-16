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

factorial(0,F,F).
factorial(N,A,F):- N>0,A1 is N*A, N1 is N - 1,factorial(N1,A1,F).
