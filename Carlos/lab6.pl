%%%%LABORATORIO ENTRADA SALIDA
%
p(X):- q,r(X).
p(X):- s(X),t.
q:-a,b.
q:-c,d.
b :- fail.
r(uno).
s(dos).
t.
a.
c.
d.

%!  if then else
%!  ifThenElse1(Condicion,Accion1,Accion2)
ifThenElse1(C,A1,_):-C,!,A1.
ifThenElse1(_,_A2):-A2.
%!  Repeat cubo
%
%
cubo:-write(' Siguiente numero '), read(X),(X=stop,!,true;(elevar(X),cubo)).
elevar(N):-Cubo_N is N**3,write(' El cubo de '), write(N), write(' es '), write(Cubo_N ).

% ! Para leer usar see() y read(X) para leer cada elemento y el final
% del fichero es end_of_file, delimitar todo con . para que digamos que
% termine de leer, seen para cerrar. para escribir en el fichero: write
% atom_chars: le damos un atomo y una lista de codigos
% X="Hola amigo",atom_chars(A,X),write(A).
% display
