%%% INTERCALAR
% intercalar(L1, L2, L): entrelaza las listas L1 y L2 para originar una lista L.
intercalar(L1, L2, L) :- intercalar(L1, L2, _, L).
intercalar([], [], [], []).
intercalar([X|L1], [Y|L2], [X,Y|I], L) :- intercalar(L1, L2, I, L).