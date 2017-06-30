#lang racket


(require rackunit)

(define (string-first word)
  (substring word 0 1))

(define (string-empty? word)
  (not (non-empty-string? word)))

(define (string-rest word)
  (substring word 1))

(define (string-combine first-word second-word)
  (string-join (list (string-first first-word) (string-rest second-word)) ""))

(define (get-changes from-word to-word)
  ;(display (string-combine to-word from-word))
  (if (string-empty? from-word)
      (display "YESS")
      (get-changes (string-rest from-word) (string-rest to-word))))



(get-changes "dog" "cat")

(define a "dog")
(define b "cat")

(check-equal? (string-first "hello") "h" "It gets the first letter of a string")
(check-equal? (string-rest "hello") "ello" "It gets the remaining letters in a string")
(check-equal? (string-combine "dog" "cat") "dat" "It combines the first letter of the first word with the remaining letters of the second word")
(check-equal? (string-empty? "hello") #f "It should identify non-empty strings")
(check-equal? (string-empty? "") #t "It should identify empty strings")