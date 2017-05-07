oracion --> s_nominal(G, N), s_verbal(G, N).
oracion --> s_verbal(_, _).

s_nominal(Genero, Numero) --> determinante(Genero, Numero), s_nominal2(Genero, Numero).
s_nominal(Genero, Numero) --> s_nominal2(Genero, Numero).
s_nominal2(G, N) --> sustantivo(G, N).
s_nominal2(G, N) --> s_adjetivo(G, N),  s_nominal(G, N).
s_nominal2(G, N) --> sustantivo(G, N), s_adjetivo(G, N).

s_adjetivo(G, N) --> adjetivo(G, N).
s_adjetivo(G, N) --> s_adverbial, s_adjetivo(G, N).
s_adverbial --> adverbio.
s_verbal(G, N) --> verbo(copulativo, _, G, N, _), s_adjetivo(G, N).
