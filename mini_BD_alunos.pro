% ex: aluno(“Carlos Silva”, “Rua das Orquideas, 32”, “016966666666”, “05/05/1955”,t1,p1,t2,p2,sub,rec,freq).
aluno('Carlos Silva', 'Rua das Orquideas, 32', '016966666666', '05/05/1955', 8,10,8,10,0,0,70).
aluno('Arthur', 'Rua das Orquideas, 32', '016966666666', '05/05/1955', 5,5,5,5,8,0,90).
aluno('Bruno', 'Rua das Orquideas, 32', '016966666666', '05/05/1955', 3,3,4,4,2,5,70).
aluno('Pedro', 'Rua das Orquideas, 32', '016966666666', '05/05/1955', 9,10,9,10,0,0,50).

% I. Desenvolva programas que informem:
% A. a média de prova de um aluno, tendo a p1 peso 2 e a p2 peso 3 e considerandoa possibilidade da sub.

% 3 casos: sub menor que P1 e P2, sub maior que P1, sub maior que P2, sub maior que P1 e P2
calcula_media(P1, P2, Sub, Media) :-
    P1 >= Sub, P2 >= Sub,
    Media is (2*P1 + 3*P2)/5,
    !.

calcula_media(P1, P2, Sub, Media) :-
    (P1 >= Sub, Sub > P2;
    Sub > P1, Sub > P2, P1 >= P2),
    Media is (2*P1 + 3*Sub)/5, 
    !.

calcula_media(P1, P2, Sub, Media) :-
    (Sub > P1, P2 >= Sub;
    Sub > P1, Sub > P2, P2 > P1),
    Media is (2*Sub + 3*P2)/5,
    !.

media(Aluno, M) :-
    aluno(Aluno, _, _, _, _, P1, _, P2, Sub,_, _),
    calcula_media(P1, P2, Sub, M).

% B. a média de trabalho de um aluno, tendo o t1 peso 1 e o t2 peso 3.
calcula_media_trab(T1, T2, Media) :-
    Media is (1*T1 + 3*T2)/4,
    !.

media_trab(Aluno, M) :-
    aluno(Aluno, _, _, _, T1, _, T2, _, _,_, _),
    calcula_media_trab(T1, T2, M).

% C. a média final de um aluno, considerando a situação antes da rec.
media_final(Aluno, MF) :-
    media(Aluno, MP),
    media_trab(Aluno, MT),
    MF is (0.5*MP + 0.5*MT).

% D. se o aluno foi aprovado ou reprovado, considerando a situação antes da rec.
situacao(Media, 'Reprovado') :-
    Media < 3,
    !.

situacao(Media, 'Rec') :-
    Media >= 3, Media < 5,
    !.

situacao(Media, 'Aprovado') :-
    Media >= 5,
    !.

situacao_antes(Aluno, Sit) :-
    media_final(Aluno, M),
    situacao(M, Sit).

% II. Mostre as interrogações (e os resultados) para determinar:
% A. Quem tirou 10 na p1 e na p2?

% ?- aluno(Aluno, _, _, _, _, 10, _, 10, _, _, _).

% B. Quem tirou 10 no t1 e no t2?
% ?- aluno(Aluno, _, _, _, 10, _, 10, _, _, _, _).

% C. Quem ficou com nota abaixo da média (abaixo de 5), nas duas provas? (p1<5 ep2<5).
% ?- aluno(Aluno, _, _, _, _, P1, _, P2, _, _, _), P1 < 5, P2 < 5.

% D. Quem ficou com presença abaixo de 70%?
% ?- aluno(Aluno, _, _, _, _, _, _, _, _, _, Freq), Freq < 70.

% E. Quais foram os alunos reprovados?
% ?- situacao_antes(Aluno, 'Reprovado').

% F. Quais foram os alunos aprovados?
% ?- situacao_antes(Aluno, 'Aprovado').

% III. Indique as alterações necessárias na estrutura aluno para que seja possível fazer as seguintes interrogações:
% A. Quais são as informações dos alunos cujo primeiro nome é X?
% aluno('Primeiro nome', 'Nome', 'Endereco, '016966666666', '05/05/1955',t1,p1,t2,p2,sub,rec,freq).

%B. Quais são as informações dos alunos cujo sobrenome é X?
%C. Quem são os alunos nascidos no ano X?
%D. Quem são os alunos cujo CEP é X?
%E. Qual o número da casa do aluno X?

% Apenas separar cada variável em um atributo de aluno.
