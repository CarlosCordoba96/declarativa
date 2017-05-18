%Ejercicio 17.
% Sean P1 y P2 dos programas que implementan una misma especificaci�n, es
% decir, pueden considerarse sem�nticamente equivalentes. Si el programa
% P1 se ejecuta en un tiempo T1 y el programa P2 en un tiempo T2, el
% speedup S de P1 con respecto a P2 se define como: S=T2/T1.
% Implementar un predicado speedup(S, G1, G2) que calcule el speedup S de
% un programa Prolog P1, en el que se lanza el objetivo G1, con respecto
% al programa P2, en el que se lanza el objetivo G2.
% (Ayuda: utilizar el operador cputime, que se eval�a al n�mero de
% segundos utilizados por Prolog hasta el momento de su ejecuci�n. As�
% pues, un objetivo como el siguiente:
%?- T1 is cputime, Goal, T2 is cputime, T is T2 � T1.
%eval�a el tiempo T consumido durante la ejecuci�n del objetivo Goal.)



%EJERCICIO 18
% invertir(L,I), I es la lista que resulta de invertir L
invertir1([],[]).
invertir1([H|T],L) :- invertir1(T,Z), append(Z,[H],L).
%VERSION CON ACUMULADOR
%
invertir(L,I):-inv(L,I,[]).
%Hemos inicializado el acumulador, la lista vac�a
inv([],I,I).
% Esta es la condicion de parada, cuando no haya nada que invertir el
% acumulador es lo mismo que invertir
inv([X|R],I,A):-inv(R,I,[X|A]).
% Invierto el resto y almaceno la cabeza en el acumulador.
% ! De segundo argumento nos da una lista con la primera columna, y el
% 3� da una lista con el resto
columna([],[],[]).
% ! [X|Xs] se refiere a la primera fila de la matriz y filas el resto de
% filas
columna([[X|Xs]|Filas],[X|RestoColumna],[Xs|Restofilas]):-columna(Filas,RestoColumna,Restofilas).
%Trasponer
%
trasponer([[]|_],[]).
trasponer(M,[C|Cs]):-columna(M,C,Filas),trasponer(Filas,Cs).


