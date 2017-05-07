%%% BET
% bet(N, M, K): genera todos los enteros K desde N hasta M
bet(N, M, K) :- N =< M, K = N.
bet(N, M, K) :- N < M, N1 is N+1, bet(N1, M, K).