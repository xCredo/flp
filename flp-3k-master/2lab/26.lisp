(defun count-atoms (l)
  (cond 
    ((null l) 0)                       ; Базовый случай: пустой список → 0
    ((atom l) 1)                       ; Если элемент - атом → считаем его
    (t (+ (count-atoms (car l))        ; Рекурсивно обрабатываем голову
          (count-atoms (cdr l)))))     ; и хвост списка
)

;; Пример использования:
(format t "Результат count-atoms для ((a b) c ((d a v))): ~a~%" (count-atoms '((a b) c ((d a v)))))

