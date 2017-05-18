
%[1,2,3,4]=[1|[2|[3|[4|[]]]]]
%
aplanar([], []).
aplanar([X|R], [X|P]) :- atomic(X), aplanar(R, P).
aplanar([X|R], P) :- not(atomic(X)), aplanar(X, P_X),
	aplanar(R, P_R), append(P_X, P_R, P).
%

%Todas las listas que comienzan por 1,2: [1,2|Xs]
%EJERCICIO 6
% igualesElem(L1,L2):TRUE SI L1 Y L2 SON DOS LISTAS QUE CONTIENEN
% EXACTAMENTE LOS MISMOS ELEMENTOS INDEPENDIENTEMENTE DE SU ORDEN
igualesE(L1,L2):-length(L1,N),length(L2,N),igualesE(L1,L2).
igualesE([],[]).
igualesE([X|Xs],[Y|Ys]):- X=Y,igualesE(Xs,Ys).
%Se podria poner asi: igualesE([X|Xs],[X|Ys]):-igualesE(Xs,Ys).
%member(X,L) si X es miembro de L
%igualesE([X|Xs],Y):-member(X,Y),borra(X,Y,Ys),igualesE(Xs,Ys).
% Member es inecesario ya que borra implica que exista en la lista
% borra es necesario para poder ir por otros casos
% Trata cuando la cabeza de la listas no son iguales
%
igualesE([X|Xs],Y):-borra(X,Y,Ys),igualesE(Xs,Ys).
%Ahora tendriamos que hacer borra
% borra(X,Y,Ys): TRUE si Ys es el resultado de borrar un elemento X que
% estï¿½ en la lista Y
% Caso base
borra(X,[X],[]).
%En verdad este serï¿½a el caso base, porque engloba la anterior
borra(X,[X|Xs],Xs).
% eliminamos X de la lista Ys y eso es la lista Zs y aï¿½adimos Y a la
% lista Zs y creamos Z
borra(X,[Y|Ys],Z):-borra(X,Ys,Zs),append([Y],Zs,Z).
% Se podria poner
% :borra(X,[Y|Ys],[Y|Zs]):-borra(X,Ys,Zs).
% Member(X,Y):True si X esta en Y
% member(X,[X|Xs]).
% member(X,[Y,Xs]):-member(X,Xs).
%between(1,20,N) Nos da los numeros entre los dos primeros
%
%
%EJERCICIO 8
%numBrandreth (N, C): Le doy un numero y su cuadrado
%numBrandreth(N,C):-between(32,99,N),comprobarBrandreth(N,C).
%Aritmetica en prolog  se evaluan expresiones con is
%+ - * \ =:=comparador de expresiones < > <= >=
%
comprobarBrandeth(N,C):-C is N*N,N1 is C//100,N2 is C mod 100, N is N1+N2.
numBrandreth(N,C):-between(32, 99, N),combrobarBrandeth(N,C).
 %&Ejercicio 4.
% Definir un predicado sus(X,Y,L1,L2) que sea capaz de sustituir un
% elemento X por otro Y en la lista L1, para dar L2.
sus(_,_,[],[]).
sus(X,Y,[X|L1],[Y|L2]):-sus(X,Y,L1,L2).
sus(X,Y,[P|L1],[P|L2]):-sus(X,Y,L1,L2).

%%Ejercicio 7.
% Definir un predicado descomponer(N,A,B) que permita resolver el
% problema de descomponer un número natural N en la suma de dos pares A y
% B. Esto es,descomponer(N,A,B) debe tomar como entrada un natural N y
% devolver dos naturales A y B tales que N = A + B.
%[Ayuda: utilizar el predicado between/3]
descomponer(N,A,B):-between(1,N,A),between(1,N,B),A mod 2 =:= 0, B mod 2 =:= 0, R is A+B, N=:=R.
