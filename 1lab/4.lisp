(defun swap-first-third (lst)
  (if (or (null lst) 
          (null (cdr lst)) 
          (null (cdr (cdr lst))))
      lst ; Если элементов меньше трех, возвращаем исходный список
      (cons 
        (car (cdr (cdr lst))) ; Третий элемент
        (cons 
          (car (cdr lst))     ; Второй элемент
          (cons 
            (car lst)          ; Первый элемент
            (cdr (cdr (cdr lst))) ; Остальная часть списка
          )
        )
      )
  )
)

;; Примеры использования с выводом результатов

(format t "swap-first-third '(a b c d e): ~a~%" (swap-first-third '(a b c d e))) ; Ожидает (c b a d e)
(format t "swap-first-third '(1 2 3): ~a~%" (swap-first-third '(1 2 3))) ; Ожидает (3 2 1)
(format t "swap-first-third '(x y): ~a~%" (swap-first-third '(x y))) ; Ожидает (x y)
(format t "swap-first-third nil: ~a~%" (swap-first-third nil)) ; Ожидает nil

