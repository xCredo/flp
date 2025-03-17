% Запуск поиска часто встречающихся элементов
most_frequent_elements :-
    write('Введите список: '),
    read(List),
    count_elements(List, Counted),
    find_max_freq(Counted, MaxFreq),
    extract_max_elements(Counted, MaxFreq, Result),
    format('Наиболее часто встречающиеся элементы: ~w~n', [Result]).

% Подсчет количества вхождений элементов
count_elements([], []).
count_elements([H|T], [[H,Count]|Rest]) :-
    count_elements(T, Rest1),
    (   select([H,OldCount], Rest1, Rest) -> Count is OldCount + 1 ; Count = 1, Rest = Rest1).

% Нахождение максимальной частоты
find_max_freq([[_,F]|T], MaxFreq) :-
    find_max_freq(T, F, MaxFreq).

find_max_freq([], Max, Max).
find_max_freq([[_,F]|T], TempMax, MaxFreq) :-
    (   F > TempMax -> find_max_freq(T, F, MaxFreq) ; find_max_freq(T, TempMax, MaxFreq)).

% Извлечение элементов с максимальной частотой
extract_max_elements([], _, []).
extract_max_elements([[X,F]|T], MaxFreq, [X|Rest]) :-
    F =:= MaxFreq, !, extract_max_elements(T, MaxFreq, Rest).
extract_max_elements([_|T], MaxFreq, Rest) :-
    extract_max_elements(T, MaxFreq, Rest).

