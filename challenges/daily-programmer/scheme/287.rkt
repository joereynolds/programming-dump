#lang racket

(require rackunit)

(define largest-digit
  (lambda (digits)
    (let ((digits (number->list digits)))
      (apply max digits))))

(define char->number
  (lambda (char)
    (- (char->integer char) 48)))

(define number->char
  (lambda (char)
    (let ((char (+ char 48)))
      (integer->char char))))

(define number->list
  (lambda (number)
    (map char->number (string->list (number->string number)))))

(define desc-digits
  (lambda (digits)
    (asc-or-desc-sort digits >)))

(define asc-digits
  (lambda (digits)
    (asc-or-desc-sort digits <)))

(define asc-or-desc-sort
  (lambda (digits direction)
    (let ([digits (number->list digits)])
      (pad-string (list->string(map number->char (sort digits direction)))))))
      
(define pad-string
  (lambda (string)
    (~a
       string
       #:max-width 4
       #:min-width 4
       #:right-pad-string "0")))

(define kaprekar
  (lambda (digits [count 0])
    (let* ([kaprekar-constant 6174]
          [digits (string->number (pad-string (number->string digits)))]
          [asc (string->number (pad-string (asc-digits digits)))]
          [desc (string->number (pad-string (desc-digits digits)))]
          [difference (- desc asc)]
          [clean-digits (remove-duplicates (number->list digits))])
      (cond
        [(= digits kaprekar-constant) count]
        [(>= (length clean-digits) 2)
           (begin
             (set! count (+ count 1))
             (kaprekar difference count))]
        [else count]))))


;;; Challenge
(check-equal? (largest-digit 1234) 4)
(check-equal? (largest-digit 3253) 5)
(check-equal? (largest-digit 9800) 9)
(check-equal? (largest-digit 3333) 3)
(check-equal? (largest-digit 120) 2)

;;; Bonus 1
(check-equal? (desc-digits 1234) "4321")
(check-equal? (desc-digits 3253) "5332")
(check-equal? (desc-digits 9800) "9800")
(check-equal? (desc-digits 3333) "3333")
(check-equal? (desc-digits 120) "2100")

;;; Bonus 2
(check-equal? (kaprekar 6589) 2)
(check-equal? (kaprekar 5455) 5)
(check-equal? (kaprekar 6174) 0)
(check-equal? (kaprekar 3333) 0)

;;;Bonus 2 answer
(define iterations 0)

(for ([i (in-range 10000)])
  (if (> (kaprekar i) iterations)
    (set! iterations (kaprekar i))
    '()))

(display iterations)
    
     
