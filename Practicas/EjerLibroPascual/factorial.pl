%%% FACTORIAL
% factorial(N, F): calcula el factorial F de un n�mero N mayor
% o igual que 0
factorial(0, 1).
factorial(1, 1).
factorial(N, F) :- N > 1, Z is N - 1, factorial(Z, S), F is S * N.
