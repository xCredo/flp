(defun set-union (set1 set2)
  "Объединяет два множества set1 и set2, удаляя дубликаты."
  (if (null set2)
      set1                               ; Если set2 пуст, возвращаем set1
      (if (member (car set2) set1)       ; Проверяем, есть ли элемент в set1
          (set-union set1 (cdr set2))    ; Если элемент уже есть, пропускаем его
          (set-union (cons (car set2) set1) (cdr set2))))) ; Добавляем элемент и продолжаем
          
;; Тесты
(format t "Объединение '(a b c) и '(c d e): ~a~%" 
        (set-union '(a b c) '(c d e)))

(format t "Объединение '(1 2 3) и '(3 4 5): ~a~%" 
        (set-union '(1 2 3) '(3 4 5)))

(format t "Объединение '(x y z) и '(a b x): ~a~%" 
        (set-union '(x y z) '(a b x)))

