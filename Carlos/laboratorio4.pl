%%ARBOLES BINARIOS
%Ejercicio 14.
%Las rosadelfas se han representado en Prolog mediante los constructores:
%1.nil;
%2.hoja(X), donde X elemento de tipo T;
%3.nodo(X, [T_1, ..., T_M]), donde X es un elemento de tipo T, T_i es un árbol $n$--%ario de tipo T, y M =< N.
% El predicado esRosadelfa(O) permite determinar si un objeto O es o no
% un rosadelfa.

% esRosadelfa(O), el objeto O es una rosadelfa.
esRosadelfa(nil).
esRosadelfa(hoja(_)).
esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).

esListaRosadelfas([R]) :- esRosadelfa(R).
esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).

%%%%Ejercicio 15.
%Defina los siguientes predicados acerca de los árboles n–arios:
% a) peso(A, P) que calcule el peso P de un árbol n–ario A, entendiendo
% por “peso” el número de nodos que contiene dicho árbol. Esta magnitud
% también recibe el nombre de “tamaño” del árbol.
%
%

% b) grado(A, G) que calcule el grado G de un árbol n–ario A; el “grado”
% de un nodo es el número de hijos de ese nodo y el “grado” de un árbol
% es el grado máximo de los nodos que lo componen.
% grado(A,G): si G es el grado de A
%
grado(nil,0).
grado(hoja(X),0).
% Tenemos varios grados en los nodos, tenemos que hayar el maximo de los
% grados del conjunto de los nodos
grado(nodo(X,Ts),G):-length(Ts,G1),maxGrado(Ts,G2),G is max(G1,G2).
%Se podría decir con:
%grado(nodo(X,Ts),G):-length(Ts,G1),maxGrado(Ts,G2),(G1>G2->G=G1;G=G2).
%O CON:
%grado(nodo(X,Ts),G1):-length(Ts,G1),maxGrado(Ts,G2),G1>G2.
%grado(nodo(X,Ts),G2):-length(Ts,G1),maxGrado(Ts,G2),G2>G1.

%Ahora tenemos que trabajar con maxGrado:
% maxGrado(Ts,G): G es el grado maximo hallado para los árboles de la
% lista Ts
%Caso base lista vacía,es 0
maxGrado(Ts,G):-maxGrado(Ts,0,G).

% maxGrado(Ts,A,G): A es el valor acumulado, cuando la lista es vacía en
% el acumulador está el valor del grado
maxGrado([],A ,A ).
maxGrado([T|Ts],A,G):-grado(T,GT),(GT>A->maxGrado(Ts,GT,G);
                                  maxGrado(Ts,A,G)).

%suma(L,S): S es la suma de la lista de números L
%suma([],0).
%suma([N|Ns],S):-suma(Ns,SR), S is N+SR.
suma(L,S):-suma(L,0,S).
suma([],A,A).
suma([N|Ns],A,S):-NewA is A+N,suma(Ns,NewA,S).

% c) frontera(A, F) que permite determinar la frontera F del árbol n–ario
% A. La fronter de un árbol es la lista de sus hojas.
%
%
%
% d) preorden(A, L) que permita recorrer los nodos del árbol n–ario A en
% orden preorden, obteniendo la lista L de nodos visitados y en el orden
% que fueron visitados. Un recorrido preorden consiste en visitar primero
% la raíz y después los subárboles de izquierda a derecha.
