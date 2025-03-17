(defun rotate-right (l n)
  (if (or (null l) (zerop n)) ; Базовый случай: пустой список или n=0
      l
      (rotate-right (cons (last-element l) (butlast l)) (- n 1))))

(defun last-element (l)
  "Возвращает последний элемент списка l."
  (car (last l)))

;; Пример использования:
(format t "Результат rotate-right для L=(a s d f g), n=3: ~a~%" (rotate-right '(a s d f g) 3))

