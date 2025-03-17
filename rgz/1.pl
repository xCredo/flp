% Предикат для разности двух списков, сохраняя порядок элементов
difference([], _, []).
difference([H|T], List2, Result) :-
    member(H, List2), !,        % Если H входит во второй список, пропускаем
    difference(T, List2, Result).
difference([H|T], List2, [H|Result]) :-
    difference(T, List2, Result). % Если H не входит во второй список, добавляем его

% Предикат для запуска задачи
run_difference :-
    write('Введите первый список: '), read(List1),
    write('Введите второй список: '), read(List2),
    difference(List1, List2, Result),
    format('Разность списков: ~w~n', [Result]).
