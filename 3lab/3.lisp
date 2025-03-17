(defun member-p (x l)
  "Проверяет, принадлежит ли элемент x списку l."
  (cond 
    ((null l) nil)               ; Если список пустой, возвращаем NIL
    ((equal x (car l)) t)        ; Если x равен первому элементу, возвращаем T
    (t (member-p x (cdr l)))))   ; Иначе проверяем хвост списка

(defun sets-intersect-p (set1 set2)
  "Проверяет, пересекаются ли два множества set1 и set2."
  (cond 
    ((null set1) nil)                            ; Если первое множество пустое, пересечений нет
    ((member-p (car set1) set2) t)               ; Если голова set1 содержится в set2, множества пересекаются
    (t (sets-intersect-p (cdr set1) set2))))     ; Проверяем хвост set1

;; Пример использования:
(format t "Пересекаются ли множества '(a b c) и '(c d e): ~a~%" 
        (sets-intersect-p '(a b c) '(c d e)))
(format t "Пересекаются ли множества '(a b c) и '(x y z): ~a~%" 
        (sets-intersect-p '(a b c) '(x y z)))

