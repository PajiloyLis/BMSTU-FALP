; №1
(defun less10(lst)
    (mapcar (lambda (x) (cond ((numberp x)(- x 10)) (t x))) lst)
)

(print (less10 '((10 20) (20 (0 (-10))) a b 30 40)))

; №2

(defun square(lst)
    (mapcar (lambda (x) (* x x)) lst)
)

(print (square '( 1 2 3.5 4.1 5 6 7)))

; №3
(defun multiply(lst k) 
    (mapcar (lambda (x) (cond
        (        
            (listp x)
            (multiply x k)
        )
        (
            (numberp x)
            (* x k)
        )
        (
            t
            x
        )
    )) lst)
)

(print (multiply '(1 2 3 4 ) 5))
(print (multiply '(1 (2 3) (3 (4 (5)))) 3))
(print (multiply '(1 a (b (3)) 4 (5 6 (7 ()))) 2.5))

; №4
(defun is-palindrome(lst)
    (reduce (lambda (x y) (and x y)) (mapcar (lambda (x y) (equal x y)) lst (reverse lst)))
)

(print (is-palindrome '(1 2 1)))
(print (is-palindrome '(a b o b a)))
(print (is-palindrome '((b a) o (b a))))
(print (is-palindrome '((a b) o (b a))))
(print (is-palindrome '( 1 2 2 1)))
(print (is-palindrome '(1 2 3 4 5)))

; №5
(defun set-equal(lst1 lst2)
    (and (reduce (lambda (x y) (and x y)) (mapcar (lambda (x) (not (null (member x lst2)))) lst1))
         (reduce (lambda (x y) (and x y)) (mapcar (lambda (x) (not (null (member x lst1)))) lst2))
    )
)

(print (set-equal '(1 1 2 2 3 3 4 5) '(1 2 3 4 5 5 5 5)))
(print (set-equal '(1 2 3 4) '(5 6 7 8)))
(print (set-equal '(1 2 3 4) '(1 2 3 4 5 6 7)))
(print (set-equal '(1 2 3 4 5 6) '(1 2 3)))

; №6
(defun select-between(lst a b &optional res)
    (mapcan (lambda (x) (cond ((and (> x a) (< x b)) (cons x nil)) (t nil))) lst )
)

(print (select-between '(2 4 3 1 7 5 8 6 9) 3 8))
(print (select-between '(2 4 7 6 5.5) 4.5 10))
(print (select-between '(4 6 5 8) 1 7))
(print (select-between '(2 4 3 1 7 5 8 6 9) -1 1))
(print (select-between '(2 4 3 1 7 5 8 6 9) 10 11))

; №7
(defun cartesian(lst1 lst2)
    (mapcan (lambda (x) (mapcar (lambda (y) (cons x y)) lst2)) lst1)
)

(print (cartesian '(1 2 3) '(4 5 6)))
(print (cartesian '(1 2 3) '(4 5 6 7 8 9)))

; №9
(defun numel(lst)
    (reduce (lambda (sum x) (+ sum (length x))) lst :initial-value 0)
)

(print (numel '((1) (2 3) (4 5 6))))
(print (numel '(() () ())))
(print (numel '((1 2 3 4))))