% Чтение данных из файла и запись в другой файл с изменённым форматом
process_employees :-
    open('input.txt', read, InStream),
    open('output.txt', write, OutStream),
    process_lines(InStream, OutStream),
    close(InStream),
    close(OutStream),
    write('Обработка завершена. Результат записан в output.txt.').

% Обработка строк из файла
process_lines(InStream, OutStream) :-
    read_line_to_string(InStream, Line),
    (   Line \= end_of_file
    ->  split_string(Line, " ", "", [LastName, FirstName, MiddleName]),
        sub_string(FirstName, 0, 1, _, FirstInitial),
        sub_string(MiddleName, 0, 1, _, MiddleInitial),
        format(OutStream, "~w ~w. ~w.~n", [LastName, FirstInitial, MiddleInitial]),
        process_lines(InStream, OutStream)
    ;   true).
