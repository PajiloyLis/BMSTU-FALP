; №3
(defun my_last (lst) 
	(cond ((null (cdr lst)) (car lst))
	      (t (my_last (cdr lst)))
      	)
)

(defun my_last_shitty(lst)
    (cond 
        ((null lst) nil)
        (t (nth (- (length lst) 1) lst))
    )
)

(print (my_last '(a b c d)))
(print (my_last nil))

(print (my_last_shitty '(a b c d)))
(print (my_last_shitty nil))

; №4
(defun without_last (lst)
	(cond ((null (cdr lst)) nil)
	      (t (cons (car lst) (without_last (cdr lst))))
    )
)

(defun without_last_shitty(lst)
    (cond
        ((null lst) nil)
        (t (reverse (nthcdr 1 (reverse lst))))
    )
)

(print (without_last '(a b c d)))
(print (without_last '((a) (b) (c))))

(print (without_last_shitty '(a b c d)))
(print (without_last_shitty '((a) (b) (c))))

; №5
(defun swap-first-last(lst)
	(append (last lst) (cdr (without_last lst)) (cons (car lst) nil))
)

(print (swap-first-last '(a b c d)))
(print (swap-first-last '((a) (b) (c (d)) (e (f (g))))))

; №6

; №7
(defun is_palindrome(lst)
    (equal lst (reverse lst))
)

(print (is_palindrome '(1 2 1)))
(print (is_palindrome '(a b o b a)))
(print (is_palindrome '((b a) o (b a))))
(print (is_palindrome '((a b) o (b a))))
(print (is_palindrome '( 1 2 2 1)))
(print (is_palindrome '(1 2 3 4 5)))

; №8
(defun elem-by-key(table key)
	(cond ((null table) nil)
		  ((equal key (car (car table))) (cdr (car table)))
          (t (elem-by-key (cdr table) key))
  	)
)


(defun key-by-elem(table elem)
	(cond ((null table) nil)
		  ((equal elem (cdr (car table))) (car (car table)))
		  (t (key-by-elem (cdr table) elem))
  	)
)

(print (elem-by-key '((Russia . Moscow) (England . London) (Germany . Berlin) (China . Bejing)) 'China))
(print (elem-by-key '((Russia . Moscow) (England . London) (Germany . Berlin) (China . Bejing)) 'Russia))
(print (elem-by-key '((Russia . Moscow) (England . London) (Germany . Berlin) (China . Bejing)) 'Italy))

(print (key-by-elem '((Russia . Moscow) (England . London) (Germany . Berlin) (China . Bejing)) 'Bejing))
(print (key-by-elem '((Russia . Moscow) (England . London) (Germany . Berlin) (China . Bejing)) 'Moscow))
(print (key-by-elem '((Russia . Moscow) (England . London) (Germany . Berlin) (China . Bejing)) 'Rome))
; №9

(defun multiply(k lst)
	(cons (* (car lst) k) (cdr lst))
)

(defun multiply-2(k lst)
	(cond 	((null lst) nil)
			((numberp (car lst)) (cons (* (car lst) k) (cdr lst)))
			(t (cons (car lst) (multiply-2 k (cdr lst))))
		)
)

(print (multiply  2.5 '(1 2 3)))
(print (multiply -3 '(2 3 5 6 8 2 1) ))

(print (multiply-2 -3 '((1 (3.5)) (a (b (c (d)))) 2.5 )))

(setf *random-state* (make-random-state t))

(defun do-throw()
    (+ 1 (random 5))
)

(defun play-step()
    (cons (do-throw) (do-throw))
)

(defun play(&optional (first-sum 0) (second-sum 0) (player-num 1))
    (let (
        (throw-result (play-step))
        )
        (format t "~A ~A ~A~%" (cond ((= player-num 1) 'first) 
                                    ((= player-num 2) 'second)) 
                                (car throw-result) 
                                (cdr throw-result)
        )
        (cond 
            (
                (or
                    (= (+ (car throw-result) (cdr throw-result)) 7)
                    (= (+ (car throw-result) (cdr throw-result)) 11)
                )
                (format t "~A won absolute~%" (cond ((= player-num 1) 'first) 
                                                  ((= player-num 2) 'second))
                )
            )
            (
                (or
                    (and (= (car throw-result) 1) (= (cdr throw-result) 1))
                    (and (= (car throw-result) 6) (= (cdr throw-result) 6))
                )
                (cond 
                    (
                        (= player-num 1) 
                        (play (+ first-sum (car throw-result) (cdr throw-result)) second-sum 1)
                    )
                    (
                        t 
                        (play first-sum (+ second-sum (car throw-result) (cdr throw-result)) 2)
                    )
                )
            )
            (
                t
                (cond 
                    (
                        (= player-num 1) 
                        (play (+ first-sum (car throw-result) (cdr throw-result)) second-sum 2)
                    )
                    (
                        t 
                        (cond 
                            (
                                (> first-sum (+ second-sum (car throw-result) (cdr throw-result)))
                                (format t "First won by sum ~A versus ~A~%" first-sum (+ second-sum (car throw-result) (cdr throw-result)))
                            )
                            (
                                (> (+ second-sum (car throw-result) (cdr throw-result)) first-sum)
                                (format t "Second won by sum ~A versus ~A~%" (+ second-sum (car throw-result) (cdr throw-result)) first-sum)
                            )
                            (
                                t
                                (format t "Drawn~%")
                            )
                        )
                    )
                )
            )
        )
    )
)

(play)
