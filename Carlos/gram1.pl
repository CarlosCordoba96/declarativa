%%an bn
s(N) --> a(N), b(N).
a(N) --> [a], a(N1), {N is N1+1}.
a(0) --> [].
b(N) --> [b], b(N1), {N is N1+1}.
b(0) --> [].
