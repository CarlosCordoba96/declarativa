%%%HECHOS
familia(persona(antonio, foix, fecha(7, febrero, 1950), trabajo(renfe, 1200)),
persona(maria, lopez, fecha(17, enero, 1952), trabajo(sus_labores, 0)),
[persona(patricia, foix, fecha(10, junio, 1970), trabajo(estudiante, 0)),
persona(juan, foix, fecha(30, mayo, 1972), trabajo(estudiante,0))] ).
familia( persona(manuel, monterde, fecha(15, marzo, 1934), trabajo(profesor, 2000)),
persona(pilar, gonzalez, fecha(9, julio, 1940), trabajo(maestra, 1900)),
[persona(manolo, monterde, fecha(10, febrero, 1964), trabajo(arquitecto, 5000)),
persona(javier, monterde, fecha(24, noviembre, 1968), trabajo(estudiante, 0)) ] ).
familia( persona(jose, benitez, fecha(3, septiembre, 1958), trabajo(profesor, 2000)),
persona(aurora, carvajal, fecha(29, agosto, 1972), trabajo(maestra, 1900)),
[persona(jorge, benitez, fecha(6, noviembre, 1997), trabajo(desocupado, 0))] ).
familia( persona(jacinto, gil, fecha(7, junio, 1958), trabajo(minero, 1850)),
persona(guillermina, diaz, fecha(12, enero, 1957), trabajo(sus_labores, 0)),
[persona(carla, gil, fecha(1, agosto, 1958), trabajo(oficinista, 1500)),
persona(amalia, gil, fecha(6, abril, 1962), trabajo(deliniante, 1900)),
persona(irene, gil, fecha(3, mayo, 1970), trabajo(estudiante, 0)) ] ).
familia( persona(ismael, ortega, fecha(7, junio, 1966), trabajo(carpintero, 2350)),
persona(salvadora, diaz, fecha(12, enero, 1968), trabajo(sus_labores, 0)),
[]).
familia( persona(pedro, ramirez, fecha(7, junio, 1966), trabajo(en_paro,0)),
persona(teresa, fuentes, fecha(12, enero, 1968), trabajo(administrativa, 1250)),
[]).
%%%REGLAS
padre(P) :- familia(P, _, _).
madre(P) :- familia(_, P, _).
hijo(P) :- familia(_, _, L), member(P, L).
existe(P) :- padre(P); madre(P); hijo(P).
f_nacimiento(P, F) :-  existe(P), P = persona(_, _, F, _).
salario(P, S) :- existe(P), P = persona(_, _, _, trabajo(_, S)).
eje3a(Nombre, Apellidos) :- existe(P), P = persona(Nombre, Apellidos, _, _).
eje3b(Nombre_Hijo, Apellidos_Hijo) :- hijo(P), P = persona(Nombre_Hijo, Apellidos_Hijo, fecha(_, _, X), _), X > 1980.
eje3c(Nombre_Mujer, Apellidos_Mujer) :- familia(_, P, _), salario(P, S), P = persona(Nombre_Mujer, Apellidos_Mujer, _, _),
	S > 0.
eje3d(Nombre, Apellidos) :- f_nacimiento(P, F), P = persona(Nombre, Apellidos, _, trabajo(en_paro, _)),
	F = fecha(_, _, X), X < 1960.
eje3e(Nombre, Apellidos) :- f_nacimiento(P, F), salario(P, S), P = persona(Nombre, Apellidos, _, _), F = fecha(_, _, X),
	X > 1950, 800 =< S, S =< 1300.

















