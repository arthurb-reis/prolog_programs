classe(Numero, positivo) :- Numero > 0, !.
classe(0, zero) :- true, !.
classe(Numero, negativo) :- Numero < 0.
