%%% TRANSPONER
% transponer(M, T): T es la transpusta de M
transponer(M, [C|Cs]) :- columna(M, C, R),
	transponer(R, Cs).
transponer([[]|_], []).
columna([], [], []).
columna([[X|Xs]|Filas], [X|RestoColumnas], [Xs|RestoFilas]) :-
	columna(Filas, RestoColumnas, RestoFilas).
