% Разбиение списка на три части
split_list :-
    write('Введите список: '),
    read(List),
    write('Введите первое число: '),
    read(A),
    write('Введите второе число: '),
    read(B),
    (   A < B -> Lower = A, Upper = B ; Lower = B, Upper = A),
    split(List, Lower, Upper, Less, Between, Greater),
    format('Меньше ~w: ~w~n', [Lower, Less]),
    format('Между ~w и ~w: ~w~n', [Lower, Upper, Between]),
    format('Больше ~w: ~w~n', [Upper, Greater]).

% Разбиение списка рекурсивно
split([], _, _, [], [], []).
split([H|T], Lower, Upper, [H|Less], Between, Greater) :-
    H < Lower, !, split(T, Lower, Upper, Less, Between, Greater).
split([H|T], Lower, Upper, Less, [H|Between], Greater) :-
    H >= Lower, H =< Upper, !, split(T, Lower, Upper, Less, Between, Greater).
split([H|T], Lower, Upper, Less, Between, [H|Greater]) :-
    H > Upper, split(T, Lower, Upper, Less, Between, Greater).

