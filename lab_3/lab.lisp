; №1
(defun next_even(x) 
    (cond 
        (
            (evenp x) 
            x
        ) 
        (
            t 
            (+ x 1)
        )
    )
)

(print (next_even 3))
(print (next_even 2))
(print (next_even -1))
(print (next_even -2))

; №2
(defun next_abs(x) 
    (cond ((< x 0) (- x 1)) 
        ((> x 0) (+ x 1)) 
        (t 1)
    )
)

(print (next_abs 21))
(print (next_abs -2))
(print (next_abs 0))

; №3
(defun create_sorted_list(a b) 
    (cond ((< a b) (cons a (cons b nil)))
        (t (cons b (cons a nil)))
    )
)

(print (create_sorted_list 2 3))
(print (create_sorted_list 2 1))
(print (create_sorted_list 2 2))

; №4
(defun between(a b c) 
    (
        cond
        (
            (< a b) 
            (
                cond 
                (
                    (> a c) 
                    t
                ) 
                (
                    t 
                    nil
                )
            )
        )
        (
            (> a b) 
            (
                cond 
                (
                    (< a c) 
                    t
                )
                (
                    t
                    nil
                )
            )
        )
        (
            t
            nil
        )
    )
)

(print (between 1 2 3))
(print (between 1 3 2))
(print (between 2 1 3))
(print (between 2 3 1))
(print (between 3 1 2))
(print (between 3 2 1))

; №6
(defun gep(a b) (and (numberp a) (numberp b) (>= a b)))

(print (gep 1 2))
(print (gep 2 2))
(print (gep 2 1))

; №8

(defun healthy_man_between(a b c)(or (and (< a b ) (> a c)) (and (> a b) (< a c))))

(print (healthy_man_between 1 2 3))
(print (healthy_man_between 1 3 2))
(print (healthy_man_between 2 1 3))
(print (healthy_man_between 2 3 1))
(print (healthy_man_between 3 1 2))
(print (healthy_man_between 3 2 1))

(defun shitty_between(a b c)
    (
        if(< a b)
        	(> a c)
        (
            if(> a b)
            	(< a c)
        )
    )
)

(print (shitty_between 1 2 3))
(print (shitty_between 1 3 2))
(print (shitty_between 2 1 3))
(print (shitty_between 2 3 1))
(print (shitty_between 3 1 2))
(print (shitty_between 3 2 1))

; №9

( defun can_you_understand_this_how-alike (x y)
    ( or 
        ( and 
        (or (= x y ) ( equal x y) 
            ) 
            'the_same 
        )
        ( and 
        ( and ( oddp x ) ( oddp y ) ) 
            'both_odd 
        )
        ( and 
            ( and ( evenp x ) ( evenp y) )
            'both_even 
        )
        'difference
    ) 
)

(print (can_you_understand_this_how-alike 2 3))
(print (can_you_understand_this_how-alike 2 2))
(print (can_you_understand_this_how-alike 2 2.0))
(print (can_you_understand_this_how-alike 3 5))
(print (can_you_understand_this_how-alike 2 4))

(defun disgusting_how_alike(x y)
    (
        if (= x y)
            'the_same
        (
            if(equal x y)
                'the_same
            (
                if(oddp x)
                (
                    if(oddp y)
                    	'both_odd
                    	'difference
                )
                (
                    if(evenp x)
                    (
                        if(evenp y)
                        	'both_even
                        	'difference
                        
                    )
                    	'difference
                )
            )
       	)
    )
)

(print (disgusting_how_alike 2 3))
(print (disgusting_how_alike 2 2))
(print (disgusting_how_alike 2 2.0))
(print (disgusting_how_alike 3 5))
(print (disgusting_how_alike 2 4))