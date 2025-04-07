; №2
(defun hypot(a b) (sqrt (+ (* a a) (* b b))))

(print (hypot 3 4))
(print (hypot 12 35))

; №3
(defun volume(a b c) (* a (* b c)))

(print (volume 1 2 3))
(print (volume 2 3 4))

; №5

(defun longer_then(lst1 lst2) (> (length lst1) (length lst2)))

(print (longer_then '(a b c) '(a b)))
(print (longer_then '(a b) '(a b)))
(print (longer_then '(a b) '(a b c)))

; №8

(defun f-to-c(temp) (* (/ 5 9) (- temp 32.0)))

(print (f-to-c 41))
(print (f-to-c 32))
(print (f-to-c 451))

; №1 ext

(defun cath(c a) (sqrt (- (* c c) (* a a))))

(print (cath 37 12))
(print (cath 5 4))

; №2 ext

(defun trap_square(a1 a2 h) (* h (/ (+ a1 a2) 2)))

(print (trap_square 2 3 2))
(print (trap_square 4 2 6))