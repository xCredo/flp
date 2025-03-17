% Печать всех нечётных чисел в порядке убывания
print_odd_desc :-
    write('Введите начало диапазона: '),
    read(Start),
    write('Введите конец диапазона: '),
    read(End),
    print_odd_numbers(Start, End).

% Предикат для печати нечётных чисел в порядке убывания
print_odd_numbers(Start, End) :-
    (   Start >= End
    ->  (Start mod 2 =:= 1 -> write(Start), nl ; true), % Печатаем, если нечётное
        Next is Start - 1, % Уменьшаем число
        print_odd_numbers(Next, End)
    ;   true).
