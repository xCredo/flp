(defun get-star (x)
  (car (cdr (car (cdr (car (cdr x))))))
)

;; Пример использования с выводом результата
(format t "Результат get-star: ~a~%" (get-star '((1 2) (3 (4 *) 5))))
