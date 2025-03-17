(defun maplist-flat (fn lst)
  "Аналог MAPLIST для одноуровневого списка: применяет функцию FN к каждому элементу."
  (if (null lst)
      nil                                  ; Базовый случай: пустой список возвращает NIL
      (cons (funcall fn (car lst))         ; Применяем FN к голове списка и добавляем результат в новый список
            (maplist-flat fn (cdr lst))))) ; Рекурсивно обрабатываем хвост списка

;; Пример функции для применения:
(defun square (x)
  "Возвращает квадрат числа x."
  (* x x))

;; Пример использования:
(format t "Результат maplist-flat с квадратом для '(1 2 3 4): ~a~%" 
        (maplist-flat #'square '(1 2 3 4)))

(format t "Результат maplist-flat с удвоением для '(1 2 3): ~a~%" 
        (maplist-flat (lambda (x) (* 2 x)) '(1 2 3)))

