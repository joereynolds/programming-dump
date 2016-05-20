;factorial
(define fact
  (lambda (n)
    (if (= n 1)
        1
        (* n (fact (- n 1))))))


;returns a list of all elements in a ls
;multiplied by 3
(define list-mul
  (lambda (ls)
    (if (null? ls)
        '()
        (cons (* 3 (car ls))
              (list-mul (cdr ls))))))

;same but by 2 in a different style
(define (list*2 ls)
  (if (null? ls)
      '()
      (cons (* 2 (car ls))
	    (list*2 (cdr ls)))))

<<<<<<< Updated upstream

(define add-one
  (lambda (x)
    (+ x 1)))

(add-one 56)
=======
(define plus-one
  (lambda (x)
   + x 1))
>>>>>>> Stashed changes
