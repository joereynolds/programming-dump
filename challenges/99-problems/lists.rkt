#lang racket

(require rackunit)
(require racket/trace)
(require srfi/1)

; 1. Find the last element of a list
(last '(1 2 3 4 5))

; 2. Find the last but one element of a list
(first (take-right '(1 2 3 4 5) 2))
; or
(second (reverse '(1 2 3 4 5)))

; 3. Find the kth element of a list
(list-ref '(1 2 3 4 5) 3)

; 4. Find the number of elements of a list
(length '(1 2 3 4 5))

; 5. Reverse a list
(reverse '(1 2 3 4 5))

; 6. Find out whether a list is a palindrome
(define (palindrome lst)
  (equal?
    lst
    (reverse lst)))

(palindrome '(1 2 3 2 1))

; 7. Flatten a nested list structure
(flatten '(1 2 (3 4) (((4 6 9) 3))))

; 8. Eliminate consecutive duplicates of list elements
(define (remove-consecutive-duplicates lst)
  (cond
    [(empty? lst) empty]
    [(empty? (rest lst)) lst]
    [else
      (let ([i (first lst)])
        (if (equal? i (first (rest lst)))
            (remove-consecutive-duplicates (rest lst))
            (cons i (remove-consecutive-duplicates (rest lst)))))]))

(check-equal?
  (remove-consecutive-duplicates '("a" "a" "a" "a" "b" "c" "c" "a" "a" "d" "e" "e" "e" "e" "e"))
  '("a" "b" "c" "a" "d" "e"))

(check-equal?
  (remove-consecutive-duplicates '("a" "a" "a" "b" "a"))
  '("a" "b" "a"))

; 16. Drop every Nth element from a list

(define (item-index item lst)
  (list-index (curry equal? item) lst))


(define (drop-every n lst)
  (filter-not 
    (lambda (item) (equal?  
                     (modulo (+ (item-index item lst) 1) n)
                     0))
    lst))

(check-equal?
  (item-index 3 '(0 5 8 7 3))
  4)

(check-equal?
  (drop-every 3 '(1 2 3 4 5 6 7 8 9))
  '(1 2 4 5 7 8))

(check-equal?
  (drop-every 7 '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17))
  '(1 2 3 4 5 6 8 9 10 11 12 13 15 16 17))
  

