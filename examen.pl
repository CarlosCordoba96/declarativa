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

fibo(0,0).
fibo(1,1).
fibo(N,F):- N1 is N -1,N2 is N-2, fibo(N1,F1),fibo(N2,F2), F is F1 + F2.

fibon(0,0).
fibon(1,1).
fibon(N,F):-fibon(N,F,2,1,1).
fibon(N,F,I,FN1,_):-I>= N,F=FN1.
fibon(N,F,I,FN1,FN2):-I<N, NF is FN1+FN2,
                      NFN2=FN1,
                      NFN1=NF,
                      NI is I+1,
                      fibon(N,F,NI,NFN1,NFN2).

my_fibonacci(_, _, 0).

my_fibonacci(A, B, N):-
          write(A),
          write(' '),
          N1 is N-1,
          C is A+B,
          my_fibonacci(B, C, N1).

factor(0,1).
factor(1,1).
factor(N,F):-Z is N-1, factor(Z,F1), F is F1* N.

mfactor(N,F):-mfactor(N,1,F).
mfactor(1,F,F).
mfactor(N,A,F):- N > 1,N1 is N-1,S is A*N,mfactor(N1,S,F).
