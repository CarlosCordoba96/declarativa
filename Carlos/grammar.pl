as -->[].
as -->[a],as.
article_phrase --> ("a" ; "an"),
	" ",
	noun.

noun --> "book".
noun --> "car".

s -->np,vp.
np -->det,n.
vp -->tv,np.
vp -->v.
det-->["el"].
det-->["a"].
det-->["every"].
n -->["hombre"].
n -->["park"].
n-->["woman"].
tv -->["come"].
tv -->["likes"].
v -->["walks"].
tokenize(String, Tokens) :- phrase(tokenize(Tokens), String).

tokenize([]) --> [].
tokenize(Tokens) --> skip_spaces, tokenize(Tokens).
tokenize([Number|Tokens]) --> number(Number), tokenize(Tokens).

skip_spaces --> code_types(white, [_|_]).
number(N) --> code_types(digit, [C|Cs]), {number_codes(N,[C|Cs])}.

code_types(Type, [C|Cs]) --> [C], {code_type(C,Type)}, !, code_types(Type, Cs).
code_types(_, []) --> [].
splitup(Sep,[token(B)|BL]) --> splitup(Sep,B,BL).
splitup(Sep,[A|AL],B)      --> [A], {\+ [A] = Sep }, splitup(Sep,AL,B).
splitup(Sep,[],[B|BL])     --> Sep, splitup(Sep,B,BL).
splitup(_Sep,[],[])        --> [].
start :-
    phrase(splitup(",",Tokens),["Hello,How,Are,You,Today"]),
    phrase(splitup(".",Tokens),Backtogether),
    string_to_list(ABack,Backtogether),
    writeln(ABack).

tokenizer(A,B):-split_string(A," ","",B).

prueba(A):-tokenizer(A,B),s(B,[]).
