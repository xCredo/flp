(defun create-list-cons ()
  (cons (cons 1 
              (cons (cons 2 
                          (cons (cons 3 nil) 
                                nil)) 
                    nil)) 
        nil)
)

;; Пример использования с выводом результата
(format t "Список с использованием CONS: ~a~%" (create-list-cons))

(defun create-list-list ()
  (list (list 1 (list 2 (list 3))))
)

;; Пример использования с выводом результата
(format t "Список с использованием LIST: ~a~%" (create-list-list))

