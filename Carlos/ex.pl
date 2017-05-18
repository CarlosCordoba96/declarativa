columna([],[],[]).
columna([[X|Xs]|R],[X|Restofila],[Xs|Restocolumnas]):-columna(R,Restofila,Restocolumnas).
transponer([[]|[_]],[]).
transponer(M,[C|Cs]):-columna(M,C,Filas),transponer(Filas,Cs).

invertir(L,I):-inv(L,I,[]).
inv([],I,I).
inv([X|A],I,Z):-inv(A,I,[X|Z]).

