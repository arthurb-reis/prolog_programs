% Arthur Breno dos Reis Paula - 12547382
% Daniel Contente Romanzini - 12547614

% 1) Função que retorna o primeiro elemento de uma lista!

primeiro([X|_Cauda],X).

% 2) Função que retorna o último elemento de uma lista!

ultimo([X|[]],X).
ultimo([_X|Cauda],U):-
   ultimo(Cauda,U),
   !.

% 3) Função que retira todas as ocorrências de um elemento de uma lista!

retirar(X,[],[]).

retirar(X,[X|Cauda],NovaLista):-
  retirar(X,Cauda,NovaLista),
  !.

retirar(X,[X1|Cauda],[X1|NovaLista]):-
  retirar(X,Cauda,NovaLista),
  !.

% 4) Função que retorna o maior elemento de uma lista!

maior([X|[]],X).
maior([X,Y|Cauda],M):-
  X =< Y,
  maior([Y|Cauda],M),
  !.
maior([X,Y|Cauda],M):-
  X > Y,
  maior([X|Cauda],M),
  !.

% 5) Função que executa o método Quicksort em uma lista!
%quick(Lista, NovaLista).

% Caso a lista a ser dividida for vazia (segundo argumento), as outras duas tambem serão
quickrec(_, [], [], []).

% Vai adicionar o valor analisado na cauda de maior ou igual
quickrec(Pivo, [X|CaudaIni], [X|CaudaMaiorIgual], CaudaMenor) :-
    Pivo > X,
    %Vai seguir retirando o X da cauda inicial ate ela nao ter nada
    quickrec(Pivo, CaudaIni, CaudaMaiorIgual, CaudaMenor).

% Vai adicionar o valor analisado na cauda de menor
quickrec(Pivo, [X|CaudaIni], CaudaMaiorIgual, [X|CaudaMenor]) :-
    Pivo =< X,
    %Vai seguir retirando o X da cauda inicial ate ela nao ter nada
    quickrec(Pivo, CaudaIni, CaudaMaiorIgual, CaudaMenor).

% Quicksort em si: se tentar ordenar lista vazia, continua vazia
quicksort([], []).

% Separa o pivo como sendo o primeiro valor (mais facil em prolog retirar o primeiro)
quicksort([Pivo|Lista], NovaLista) :-
    % Separa em uma lista L1 menor e L2 maior ou igual
    quickrec(Pivo, Lista, L1, L2),
    
    % Faz a ordenação recursiva nas duas listas
    quicksort(L1, NL1),
    quicksort(L2, NL2),
    
    % Junta tudo com o Pivo na NovaLista
    append(NL1, [Pivo|NL2], NovaLista).

% OBS1: Utilizamos a função append do prolog mas poderíamos ter implementado
% OBS2: Nao precisamos adicionar o caso em que a lista a ser ordenada é apenas
%		um elemento, mesmo na função "quicksort" o Pivo vira esse elemento único
%		da lista e a variável Lista fica vazia. Lista será dividida em duas
%		vazias que serão ordenadas cada uma e como a ordenação de lista vazia
%		cai no caso de parada e retorna uma lista vazia, as novas listas são vazias
%		e apenas juntamos uma lista vazia antes e depois do Pivo, sobrando apenas
%		o Pivo na NovaLista.
%			Provavelmente poderiamos ter utilizado a linha "quicksort([Pivo|[]], Pivo)",
%		para os casos de lista com apenas um elemento, mas nao precisa.