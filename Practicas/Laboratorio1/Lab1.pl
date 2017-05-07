%%% HECHOS
padre(abraham,isaac).
padre(teraj, abraham).
padre(teraj, najor).
padre(teraj, haran).
padre(teraj, sarai).
padre(haran,lot).
padre(haran,melca).
padre(haran,jesca).
padre(abraham, ismael).
padre(abraham, isaac).
padre(batuel, rebeca).
padre(isaac, esau).
padre(isaac, jacob).
madre(agar, ismael).
madre(sarai, isaac).
madre(rebeca, esau).
madre(rebeca, jacob).
hombre(najor).
hombre(haran).
hombre(teraj).
hombre(abraham).
hombre(isaac).
hombre(lot).
hombre(ismael).
hombre(isaac).
hombre(batuel).
hombre(esau).
hombre(jacob).
mujer(melca).
mujer(jesca).
mujer(sarai).
mujer(agar).
mujer(rebeca).
casado(abraham, sarai).
casado(abraham, agar).
casado(isaac, rebeca).
casado(najor, melca).
%%% REGLAS
ascendiente_directo(X, Y) :- (padre(X, Y); madre(X, Y)).
ascendiente(X, Z) :- ascendiente_directo(X, Z).
ascendiente(X, Z) :- ascendiente_directo(X, Y), ascendiente(Y, Z).
descendiente(X, Y) :- hijo(X, Y); hija(X, Y).
hijo(X,Y) :- hombre(X), ascendiente_directo(Y, X).
hija(X,Y) :- mujer(X), ascendiente_directo(Y, X).
abuelo(X, Z) :- hombre(X), (padre(X, Y), ascendiente_directo(Y, Z)).
abuela(X, Z) :- mujer(X), (madre(X, Y), ascendiente_directo(Y, Z)).
hermano(X, Z) :- hombre(X), (ascendiente_directo(Y, X), ascendiente_directo(Y, Z)).
hermana(X, Z) :- mujer(X), (ascendiente_directo(Y, X), ascendiente_directo(Y, Z)).
tio(X, Z) :- hombre(X), (hermano(X, Y), ascendiente_directo(Y, Z)).
tia(X, Z) :- mujer(X), (hermana(X, Y), ascendiente_directo(Y, Z)).
sobrino(X, Z) :- hombre(X), (hijo(X, Y), (hermano(Y, Z); hermana(Y, Z))).
sobrina(X, Z) :- mujer(X), (hija(X, Y), (hermano(Y, Z); hermana(Y, Z))).
primo(X, W) :- hombre(X), (ascendiente_directo(Y, X), ((hermano(Y, Z); hermana(Y, Z)), ascendiente_directo(Z, W))).
prima(X, W) :- mujer(X), (ascendiente_directo(Y, X), ((hermano(Y, Z); hermana(Y, Z)), ascendiente_directo(Z, W))).
