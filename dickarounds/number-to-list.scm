(define char->number
  (lambda (char)
    (- (char->integer char) 48)))

;turns 123456 into '(1 2 3 4 5 6)
(define number->list
  (lambda (n) 
    (map char->number(string->list (number->string n)))))

    
