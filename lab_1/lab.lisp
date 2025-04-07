(defun f(ar1 ar2 ar3 ar4) 
    (cons (cons ar1 (cons ar2 nil)) (cons (cons ar3 (cons ar4 nil)) nil))
)

(print (f 'a 'b 'c 'd))

(print (f '(a b) '(c d) '(e f) '(g h)))

(print ((lambda (ar1 ar2 ar3 ar4) 
    (cons (cons ar1 (cons ar2 nil)) (cons (cons ar3 (cons ar4 nil)) nil))
) 'a 'b 'c 'd))

(print ((lambda (ar1 ar2 ar3 ar4) 
    (cons (cons ar1 (cons ar2 nil)) (cons (cons ar3 (cons ar4 nil)) nil))
) '(a b) '(c d) '(e f) '(g h)))

(defun f2(ar1 ar2) 
    (cons (cons ar1 nil) (cons (cons ar2 nil) nil))
)

(print (f2 'a 'b))
(print (f2 '(a b) '(c d)))


(print ((lambda (ar1 ar2) 
    (cons (cons ar1 nil) (cons (cons ar2 nil) nil))
) 'a 'b))

(print ((lambda (ar1 ar2) 
    (cons (cons ar1 nil) (cons (cons ar2 nil) nil))
) '(a b) '(b c)))

(defun f3(ar1) 
    (cons (cons (cons ar1 nil) nil) nil)
)

(print (f3 'a))
(print (f3 '(a b)))

(print ((lambda (ar1) 
    (cons (cons (cons ar1 nil) nil) nil)
) 'a))

(print ((lambda (ar1) (
    cons (cons (cons ar1 nil) nil) nil)
) '(a b)))