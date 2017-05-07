: -op(300,x f x ,': = ') .
aplicaSub ( [] ,T,T) .
aplicaSub( [E |L ],T ,T 1):- aplicaE nlace(E ,T ,T2),
apiicaSub(L,T2, TI).
aplicaEnlace(X :=T1,T,TI): -var(T),T==X,!.
aplicaEnlace(X :=T1,T,T):-var(T),T\==X ,!.
aplicaEnlace(X :=T1,T,T):-atom (T),! .
aplicaEnlace(X :=T1,T,T2): -compound(T),
T=. . [F|A rgs],
aplicaEnlaceArgs(X:=T1,Args,Args2),
T2= . . [F | Args2] .
%% aplicaEnlaceArgs(X:=T1,L1,L2), aplica el enlace X:=T1 a la
%% lista de argumentos Ll, para obtener la lista de a r g u m m t o s L 2 .
aplicaEnlaceArgs(X:=T1, [],[]).
aplicaEnlaceArgs(X:=T1,[T|Args],[T2|Args2])
aplicaEnlace(X:=T1,T,T2),
aplicaEnlaceArgs(X:=T1,Args,Args2).
