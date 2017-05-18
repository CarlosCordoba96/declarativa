%%ARBOLES BINARIOS
%Ejercicio 14.
%Las rosadelfas se han representado en Prolog mediante los constructores:
%1.nil;
%2.hoja(X), donde X elemento de tipo T;
%3.nodo(X, [T_1, ..., T_M]), donde X es un elemento de tipo T, T_i es un �rbol $n$--%ario de tipo T, y M =< N.
% El predicado esRosadelfa(O) permite determinar si un objeto O es o no
% un rosadelfa.

% esRosadelfa(O), el objeto O es una rosadelfa.
esRosadelfa(nil).
esRosadelfa(hoja(_)).
esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).

esListaRosadelfas([R]) :- esRosadelfa(R).
esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).

%%%%Ejercicio 15.
%Defina los siguientes predicados acerca de los �rboles n�arios:
% a) peso(A, P) que calcule el peso P de un �rbol n�ario A, entendiendo
% por �peso� el n�mero de nodos que contiene dicho �rbol. Esta magnitud
% tambi�n recibe el nombre de �tama�o� del �rbol.
%
%

% b) grado(A, G) que calcule el grado G de un �rbol n�ario A; el �grado�
% de un nodo es el n�mero de hijos de ese nodo y el �grado� de un �rbol
% es el grado m�ximo de los nodos que lo componen.
% grado(A,G): si G es el grado de A
%
grado(nil,0).
grado(hoja(X),0).
% Tenemos varios grados en los nodos, tenemos que hayar el maximo de los
% grados del conjunto de los nodos
grado(nodo(X,Ts),G):-length(Ts,G1),maxGrado(Ts,G2),G is max(G1,G2).
%Se podr�a decir con:
%grado(nodo(X,Ts),G):-length(Ts,G1),maxGrado(Ts,G2),(G1>G2->G=G1;G=G2).
%O CON:
%grado(nodo(X,Ts),G1):-length(Ts,G1),maxGrado(Ts,G2),G1>G2.
%grado(nodo(X,Ts),G2):-length(Ts,G1),maxGrado(Ts,G2),G2>G1.

%Ahora tenemos que trabajar con maxGrado:
% maxGrado(Ts,G): G es el grado maximo hallado para los �rboles de la
% lista Ts
%Caso base lista vac�a,es 0
maxGrado(Ts,G):-maxGrado(Ts,0,G).

% maxGrado(Ts,A,G): A es el valor acumulado, cuando la lista es vac�a en
% el acumulador est� el valor del grado
maxGrado([],A ,A ).
maxGrado([T|Ts],A,G):-grado(T,GT),(GT>A->maxGrado(Ts,GT,G);
                                  maxGrado(Ts,A,G)).

%suma(L,S): S es la suma de la lista de n�meros L
%suma([],0).
%suma([N|Ns],S):-suma(Ns,SR), S is N+SR.
suma(L,S):-suma(L,0,S).
suma([],A,A).
suma([N|Ns],A,S):-NewA is A+N,suma(Ns,NewA,S).

% c) frontera(A, F) que permite determinar la frontera F del �rbol n�ario
% A. La fronter de un �rbol es la lista de sus hojas.
%
%
%
% d) preorden(A, L) que permita recorrer los nodos del �rbol n�ario A en
% orden preorden, obteniendo la lista L de nodos visitados y en el orden
% que fueron visitados. Un recorrido preorden consiste en visitar primero
% la ra�z y despu�s los sub�rboles de izquierda a derecha.
