:- dynamic flight/3.

% Загрузка базы данных при старте
start :- 
    catch(reconsult('database.pl'), _, true),
    menu.

menu :-
    write('\n--- МЕНЮ ---\n'),
    write('1. Просмотр содержимого базы\n'),
    write('2. Добавить записи\n'),
    write('3. Удалить записи\n'),
    write('4. Запрос: рейсы до заданного города с минимальной стоимостью\n'),
    write('5. Выход с сохранением\n'),
    write('Выберите пункт: '),
    read(Choice),
    handle_choice(Choice).

handle_choice(1) :-
    show_database,
    menu.

handle_choice(2) :-
    add_entries,
    menu.

handle_choice(3) :-
    remove_entries,
    menu.

handle_choice(4) :-
    query_min_price,
    menu.

handle_choice(5) :-
    save_and_exit.

handle_choice(_) :-
    write('Неверный ввод. Повторите.\n'),
    menu.

show_database :-
    write('\nСодержимое базы данных:\n'),
    ( flight(N, C, P),
      format('Рейс: ~w\tГород: ~w\tЦена: ~w\n', [N, C, P]),
      fail
    ; true ).

add_entries :-
    write('Добавление записей. Введите stop. для прекращения.\n'),
    add_one_entry.

add_one_entry :-
    write('Введите номер рейса (или stop. для завершения): '), read(Num),
    ( Num == stop ->
        true
    ;
        write('Введите город: '), read(City),
        write('Введите стоимость: '), read(Price),
        assertz(flight(Num, City, Price)),
        write('Запись добавлена.\n'),
        add_one_entry
    ).

remove_entries :-
    write('Удаление записей. Введите stop. для прекращения.\n'),
    remove_one_entry.

remove_one_entry :-
    write('Введите номер рейса для удаления (или stop. для завершения): '), read(Num),
    ( Num == stop ->
        true
    ;
        ( retract(flight(Num, _, _)) ->
            write('Запись удалена.\n')
        ; 
            write('Запись с таким номером не найдена.\n')
        ),
        remove_one_entry
    ).

query_min_price :-
    write('Введите название города: '), read(City),
    findall(Price, flight(_, City, Price), Prices),
    ( Prices = [] ->
        write('Нет рейсов в этот город.\n')
    ;
        min_list(Prices, MinPrice),
        write('Рейсы с минимальной стоимостью до '), write(City), write(':\n'),
        ( flight(N, City, MinPrice),
          format('Рейс: ~w\tЦена: ~w\n', [N, MinPrice]),
          fail
        ; true
        )
    ).

save_and_exit :-
    write('Сохранение базы данных...\n'),
    tell('database.pl'),
    listing(flight/3),
    told,
    write('Данные сохранены. Программа завершена.\n').
