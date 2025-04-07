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