%%%EJERCICIO 9
%% Defina un predicado partir(L, L1, L2) que divida la lista L en dos
%% partes L1 y L2, tales que los elementos de L1 son menores o iguales
%% que un cierto elemento N perteneciente a L y los de L2 son mayores que
%% ese elemento N. El elemento N seleccionado no se incluye en las listas
%% partidas L1 y L2.
%%partir(L,L1,L2): verdadero si
%%caso lista vacia:
partir([],[],[]).
%%caso general:
partir([X|Xs],L1,L2):-partir(X,Xs,L1,L2).
%partir(N,L,L1,L2): definicion
%Caso base: listas vacias:
partir(_,[],[],[]).
%% Habr� dos casos, Uno en el que X sea =< que N y otro X>N
%% partir(N,[X|Xs],L1,L2):-X=<N,partir(N,Xs,Xs1,Xs2),L1=[X|Xs1],L2=Xs2.
%% Lo del final lo tenemos que poner en la cabeza de la clausula
partir(N,[X|Xs],[X|Xs1],Xs2):-X=<N,partir(N,Xs,Xs1,Xs2).
%%partir(N,[X|Xs],L1,L2):-X>Nm,partir(N,Xs,Xs1,Xs2),L1=Xs1,L2=[X|Xs2].
partir(N,[X|Xs],Xs1,[X|Xs2]):-X>N,partir(N,Xs,Xs1,Xs2).
% !
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% %Ejercicio 10. (Ordenaci�n r�pida�quicksort�)
%  El algoritmo de ordenaci�n r�pida aplica la estrategia de �divide y
% vencer�s� a la tarea de ordenar una lista. La idea es particionar una
% lista con respecto a uno de sus elementos (en principio elegido al
% azar), llamado el pivote, de forma que los elementos menores o iguales
% que el pivote queden agrupados a su izquierda, en una de las listas, y
% los elementos mayores que el pivote queden agrupados a su derecha, en
% la otra lista. Observe que, tras la partici�n, lo �nico seguro es que
% el pivote est� en el lugar que le corresponder� en la ordenaci�n
% final. Entonces, el algoritmo se centra en la ordenaci�n de las
% porciones de la lista (que no est�n necesariamente ordenadas), lo que
% nos remite al problema original. Utilizando el predicado partir(L, L1,
% L2) del Ejercicio 10, d� una implementaci�n recursiva del algoritmo de
% ordenaci�n r�pida, mediante la definici�n de un predicado:
% quicksort(Lista, ListaOrdenada).
% !
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% quicksort(L,O): Verdadero si O es el resultado de ordenar la lista L
quicksort([],[]).
quicksort([X|Xs],O):-partir(X,Xs,Xs1,Xs2),quicksort(Xs1,O1),
                                          quicksort(Xs2,O2),
                                          append(O1,[X|O2],O).

%!  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ejercicio 11. (Mezcla ordenada �merge_sort�)

% Implemente en Prolog el algoritmo de mezcla ordenada para la ordenaci�n
% de una lista de elementos, mediante la definici�n de un predicado:
% merge_sort(Lista, ListaOrdenada). Informalmente, este algoritmo puede
% formularse como sigue: Dada una lista, div�dase en dos mitades, ordene
% cada una de las mitades y, despu�s, �mezcle� apropiadamente las dos
% listas ordenadas obtenidas en el paso anterior.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%


%!  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ejercicio 12.
% El polinomio Cnxn + : : : + C2x2 + C1x + C0, donde Cn; ... ;C1;C0 son
% coeficientes enteros, puede representarse en Prolog mediante el
% siguiente t�rmino:
%%cn * x ** n + ... + c2 * x ** 2 + c1 * x + c0.
% El operador �**� es un operador binario infijo. Cuando se eval�a la
% expresi�n �X ** n�, computa la potencia en�sima de X. Observe que el
% operador �**� liga m�s que el operador binario infijo �*�, que a su vez
% liga m�s que el operador binario infijo �+� (por lo tanto no se
% requiere el uso de par�ntesis). Observe tambi�n que, en la
% representaci�n anterior, la variable x se trata como una constante.
% Defina un predicado eval(P, V, R) que devuelva el resultado R de
% evaluar un polinomio P para un cierto valor V de la variable x. A modo
% de ejemplo, el objetivo ?- eval(5 * x ** 2 + 1, 4, R). debe tener �xito
% con respuesta R = 81.
%
%sustitutir(P,V,E):Sustituye en P por el valor V y da una expresion E
%
eval(P,V,R):-sustituir(P,V,E),R is E.
%Casos monomio:entero, x, entero*x,x**entero,entero*x**entero
sustituirMonomio(E,V,E):-integer(E).
sustituirMonomio(x,V,V).
sustituirMonomio(C,V,C):-integer(C).
sustituirMonomio(C*x,V,C*V):-integer(C).

%Casos polinomio monomio, monomio+ polinomio,monomio- polinomio
