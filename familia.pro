homem('arthur').
homem('marcio').
homem('severino').
homem('saulo').
homem('reinaldo').
homem('gabriel').
homem('gustavo').
mulher('celina').
mulher('melissa').
mulher('larissa').
mulher('sandra').
mulher('simone').
mulher('mariana').
mulher('natalia').

pai('marcio', 'arthur').
pai('marcio', 'melissa').
pai('marcio', 'larissa').
pai('severino', 'celina').
pai('severino', 'saulo').
pai('severino', 'reinaldo').
pai('saulo', 'mariana').
pai('saulo', 'natalia').
pai('reinaldo', 'gabriel').
pai('reinaldo', 'gustavo').
mae('celina', 'arthur').
mae('celina', 'melissa').
mae('celina', 'larissa').
mae('sandra', 'celina').
mae('sandra', 'saulo').
mae('sandra', 'reinaldo').

mae('simone', 'mariana').
mae('simone', 'natalia').


gerou(X, Y) :-
    pai(X, Y);
    mae(X, Y).

filha(X, Y) :-
    gerou(Y, X),
    mulher(X).

filho(X, Y) :-
    gerou(Y, X),
    homem(X).

irma_o(X, Y) :-
    ((pai(Z, X), pai(Z, Y));
    (mae(Z, X), mae(Z, X))),
    X \= Y.

tio(X, Y) :-
    irma_o(X, Z),
    gerou(Z, Y),
    homem(X).

tia(X, Y) :-
    irma_o(X, Z),
    gerou(Z, Y),
    mulher(X).

avoh(X, Y) :-
    gerou(X, Z),
    gerou(Z, Y),
    mulher(X).

avou(X, Y) :-
    gerou(X, Z),
    gerou(Z, Y),
    homem(X).
