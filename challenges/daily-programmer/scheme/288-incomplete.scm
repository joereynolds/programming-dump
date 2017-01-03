(use test)    ;unit tests
(use srfi-1)  ;lists
(use srfi-13) ;strings
(use srfi-14) ;character sets

(define stop-words '(
    "a" "about" "an" "are" 
    "as" "at" "be" "by"
    "com" "for" "from" "how"
    "in" "is" "it" "of" 
    "on" "or" "that" "the"
    "the" "this" "to" "was"
    "what" "when" "where" "who"
    "will" "with")) 

;;; remove-stop-words :: String -> String
(define remove-stop-words
  (lambda (sentence)
    (let ((sentence (string-tokenize sentence)))
      (string-join (remove is-stop-word? sentence) " "))))

;;; is-stop-word :: String -> Boolean
(define is-stop-word?
  (lambda (word)
    (not (boolean? (member word stop-words)))))

;;; get-letters :: String -> [Char]
;(get-letters "hello howard are you okay") -> '(#\h #\h #\a #\y #\o)
(define get-letters
  (lambda (sentence)
    (let ((sentence (string-tokenize sentence)) (letter-count '()))
      (map get-first-letter sentence))))

(define get-first-letter
  (lambda (word)
    (string-ref word 0)))

(define l
  (lambda (sentence)
    (let ((words-to-show '())
          (index 0)
          (sentence (string-tokenize (remove-stop-words sentence))))

      (if 
        (eq? 
          (string-ref (list-ref sentence index) 0) 
          (string-ref (list-ref sentence (+ index 1)) 0))
        (append words-to-show 
          (list (list-ref sentence index))
          (list (list-ref sentence (+ index 1)))))

      (set! index (+ index 2))
      (display words-to-show)

      
      (display sentence))))


(l "i jindex am just in a test test")
(l "owain often thought about arithmetic")

(test "We get the first letter from a word"
  #\a
  (get-first-letter "apple"))

(test "We get the first letters from a sentence"
  '(#\h #\i #\n #\t #\m #\y #\h #\h)
  (get-letters "hello it's nice to meet you ha ha"))

(test-group "We correctly identify stop-words"
  (test #t (is-stop-word? "about"))
  (test #f (is-stop-word? "mouse")))

(test-group "We remove stop words from sentences"
  (test 
    "can there so many people world?" 
    (remove-stop-words "how can there be so many people in the world?"))
  (test 
    "man stupid" 
    (remove-stop-words "is that man stupid")))

;Improvements
; - Map string-contains over the sentence and stop-words instead of using is-stop-word?
; - Find out the correct notation for dictionaries in hindley milner notation
