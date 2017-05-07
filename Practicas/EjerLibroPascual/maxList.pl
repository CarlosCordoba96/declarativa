%%% MAXLIST
%maxList(L, M): obitiene el maximo de la lista L
maxList(L, M) :- maxList(L, 0, M).
maxList([], N, N).
maxList([X|L], A, M) :- X > A, Z is X, maxList(L, Z, M).
maxList([X|L], A, M) :- X < A, maxList(L, A, M).
