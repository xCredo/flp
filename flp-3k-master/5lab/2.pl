% Предикат для вычисления чисел Фибоначчи
fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1, N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

% Циклический ввод с помощью repeat
fibonacci_loop :-
    repeat,
    write('Введите номер числа Фибоначчи (отрицательное число для выхода): '),
    read(N),
    (   N < 0
    ->  write('Завершение работы.'), nl, !
    ;   fibonacci(N, F),
        format('Число Фибоначчи с номером ~w: ~w~n', [N, F]),
        fail).

