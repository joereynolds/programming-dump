;dictionary stuff
;some stolen from Python
(define dict '(("name" . "Joe") ("Job" . "Developer") ("Age" . 25)))

;returns the value from a dict given its key
(define dict-value
  (lambda (key dict)
    (cdr (assq key dict))))

;return all keys from a dictionary
(define dict-keys
  (lambda (dict)
    (cond
      ((null? dict) '())
      (else (cons (caar dict) (dict-keys (cdr dict)))))))

;Same as keys but for values because why not?
(define dict-values
  (lambda (dict)
    (cond
      ((null? dict) '())
      (else (cons (cdar dict) (dict-values (cdr dict)))))))
    
    

;set operations
(define ts1 '(1 2 3))
(define ts2 '(3 4 5))
;stubs

;turns a list into a set. i.e. removes duplicate elements
;This is only really used to pass the list through to before
;it goes into intersection, union etc...
;(define set
;  (lambda (ls)
;    (car ls

;The intersection of A and B, denoted by A ∩ B, 
;is the set of all things that are members of both A and B
;{1, 2} ∩ {2, 3} = {2}.
;(define intersection
;  (lambda (ls1 ls2)
;    (cons ls1 ls2)))


;{1, 2, 3} ∪ {3, 4, 5} = {1, 2, 3, 4, 5}
(define union
  (lambda (ls1 ls2)
    (cons ls1 ls2)))

;{1, 2} × {red, white} = {(1, red), (1, white), (2, red), (2, white)}.
;(define cartesian
;  (lambda (ls1 ls2)
;    ))