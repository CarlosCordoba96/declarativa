%%% MULTMATRIX
% multMatrix(M1, M2, M): M es el resultado de multiplicar las
% matrices M1 y M2.
multMatrix([], _M, []).
multMatrix([F|Filas], M2, [O|Resto]) :- columna(M2, C1, C2),
	mult(F, C1, Z), mult(F, C2, W), append(Z, W, O),
	multMatrix(Filas, M2, Resto).
% columna(M, C1, C2): C1 y C2 son las colummas de la matriz M,
% donde C1 es la primera columna y C2 el resto
columna([], [], []).
columna([[X|Xs]|Filas], [X|RestoColumnas], [Xs|RestoFilas]) :-
	columna(Filas, RestoColumnas, RestoFilas).
% mult(F, C, L): L es el resultado de multiplicar F con C
mult([], [], []).
mult(F, C, L) :- mult(F, C, 0, L).
mult([], [], A, [A]).
mult([X|F], [Y|C], A, L) :- Z is X * Y + A, mult(F, C, Z, L).
