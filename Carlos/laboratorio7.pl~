%Ejercicio 27.
%
% Definir un predicado, ficha(H), que actuando sobre un hecho almacenado
% en una base %de datos lo visualice en forma de ficha. Por ejemplo, si
% se lanzase el objetivo:
% ?- ficha(libro(tol85,autor('Tolkien', 'J.R.R.' ),titulo('El Señor de
% los Anillos'),editorial(minotauro),prestado(jul101, fecha(28, noviembre, 2004)))).
% Se viese identado
%
ficha(L):-tratamiento_ficha(L,0).
tratamiento_ficha(Termino,N):-atomic(Termino),escribirblancos(N),write(Termino),nl.
tratamiento_ficha(Termino,N):-compound(Termino),Termino=..[Functor|Args],escribirblancos(N),write(Functor),nl,NewN is N+1,tratarargumentos(Args,NewN).

%Compound si es un termino generico
mi_apply(Functor,Args):-A=..[Functor|Args],A.
mi_apply(Fun,X,Y):-T=..[Fun|[X,Y]],T.

map(_,[],[]).
map(Fun,[X|L1],[Y|L2]):-mi_apply(Fun,X,Y),map(Fun,L1,L2).

cuadrado(X,Y):-Y is X*X.
