(use srfi-13) ;strings
(use extras)
(use test)

(define response-for
  (lambda (sentence)
    (cond
      ((string-upper-case? sentence) "Whoa, chill out!")
      ((equal? (string-last sentence) #\?) "Sure.")
      (else "Whatever."))))

; string-upper-case :: String -> Bool
(define string-upper-case?
  (lambda (s)
    (string-every char-upper-case? (string-delete #\! s))))

; string-last :: String -> Char
(define string-last
  (lambda (s)
    (string-ref s (sub1 (string-length s)))))


(test #t (string-upper-case? "HELLO"))
(test #f (string-upper-case? "HELLo"))
(test #t (string-upper-case? "WATCH OUT!"))
(test #\s (string-last "yes"))
(test #\? (string-last "Is this a question?"))
