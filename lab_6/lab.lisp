; №1
(defun my_reverse(lst &optional (res '()))
	(cond ((null lst) res)
		  (t (my_reverse (cdr lst) (cons (car lst) res)))
	)
)

(print (my_reverse '(3 2 1)))
(print (my_reverse '(2 1 3 4)))

; №2
(defun get-first(lst) 
	(
		cond ((null lst) nil)
	     ((not (atom (car lst))) (car lst))
	     (t (get-first (cdr lst)))
     )
)

(print (get-first '(21 (3 4) 5)))
(print (get-first '(() 2 1 (3 (4)) 5)))

; №3
(defun in-interval (lst a b &optional (res '()))
	(cond ((null lst) res)
		  ((and (> (car lst) a) (< (car lst) b)) (cons (car lst) (in-interval (cdr lst) a b res)))
		  (t (in-interval (cdr lst) a b res))
	)
)

(print (in-interval '(1 2 3 4 5 64 3 5 6 7 8 9) 3 7))
(print (in-interval '(1 2 3 4 5 6 7 5 4 8 9) 4 6))
(print (in-interval '(1 2 3 4 2 6 3) -1 -2))
(print (in-interval '(1 2 3 42 5 3 5 6 7) 10 11))

; №4
(defun multiply(lst val)
	(cond ((null lst) nil)
		  (t (cons (* (car lst) val) (multiply (cdr lst) val)))
	)
)

(print (multiply '(1 2 3 4 5 6) 2.5))
(print (multiply '(2 3 5 6 8 2 1) -3))

(defun multiply-2(lst val)
	(cond ((null lst) nil)
		  ((numberp (car lst)) (cons (* (car lst) val) (multiply-2 (cdr lst) val)))
		  ((listp (car lst)) (cons (multiply-2 (car lst) val) (multiply-2 (cdr lst) val)))
		  (t (cons (car lst) (multiply-2 (cdr lst) val)))
	)
)

(print (multiply-2 '((1 (3.5)) (a (b (c (d)))) 2.5 (3 (48))) -3))

; №5
(defun insert-in-sorted(lst val)
	(cond ((null lst) (cons val nil))
			
		  ((< (car lst) val)
		  	(cond ((or (null (cdr lst)) (> (cadr lst) val)) (cons (car lst) (cons val (cdr lst))))
		  		  (t (cons (car lst) (insert-in-sorted (cdr lst) val)))
		  	)
		  )
		  (t (cons val lst))
	)	  
)

(defun select-between (lst a b &optional (res '()))
	(cond ((null lst) nil)
		  ((and (> (car lst) a) (< (car lst) b)) (insert-in-sorted (select-between (cdr lst) a b) (car lst)))
		  (t (select-between (cdr lst) a b res))
	)
)

(print (select-between '(2 4 3 1 7 5 8 6 9) 3 8))
(print (select-between '(2 4 7 6 5.5) 4.5 10))
(print (select-between '(4 6 5 8) 1 7))
(print (select-between '(2 4 3 1 7 5 8 6 9) -1 1))
(print (select-between '(2 4 3 1 7 5 8 6 9) 10 11))

; №6
(defun rec-add (lst &optional (res 0))
	(cond ((null lst) res)
		  ((numberp (car lst)) (rec-add (cdr lst) (+ res (car lst))))
	      (t (rec-add (cdr lst) res))
 	)
)

(print (rec-add '(2 3 4.5 2 6 4 7 8)))
(print (rec-add '(a 2 3 b c 4)))

; №7

(defun recnth(n lst)
	(cond ((null lst) nil)
		((= n 0) (car lst))
		(t (recnth (- n 1) (cdr lst)))
	)
)

(print (recnth 1 '((a) b c)))
(print (recnth 1 '(a (b c) d)))
(print (recnth 5 '(a b c)))

; №8

(defun allodd (lst)
	(cond ((null lst) t)
		  ((numberp (car lst)) (and (oddp (car lst)) (allodd (cdr lst))))
		  (t (and (allodd (car lst)) (allodd (cdr lst))))
  	)
)

(print (allodd '(1 (11 3)  3 (5  13 (7)))))
(print (allodd '(1 3 5)))
(print (allodd '(1 3 4)))
(print (allodd '(2 4 6)))

; №9
(defun first-odd(lst)
	(cond ((null lst) nil)
		  ((numberp (car lst)) (cond
		  		((oddp (car lst)) (car lst))
		  		(t (first-odd (cdr lst)))))
		  (t (or (first-odd (car lst)) (first-odd (cdr lst))))
	)
)

(print (first-odd '(2 (3) 4)))
(print (first-odd '(2 (4 (6 (1))))))
(print (first-odd '(2 4 6)))

; №10
(defun square-lst(lst)
	(cond ((null lst) nil)
		  (t (cons (* (car lst) (car lst)) (square-lst (cdr lst))))
	)
)

(print (square-lst '(1 2 3 4 5)))