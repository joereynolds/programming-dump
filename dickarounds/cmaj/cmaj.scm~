(use srfi-1)

(define notes '(
  "C" ("C#" "Db")
  "D" ("D#" "Eb")
  "E"
  "F" ("F#" "Gb")
  "G" ("G#" "Ab")
  "A" ("A#" "Bb")
  "B"))

(define enharmonics '(
  "C#" "Db"
  "D#" "Eb"
  "F#" "Gb"
  "G#" "Ab"
  "A#" "Bb"))


;Gets element of item in ls
(define list-index
  (lambda (e lst)
    (cond
     ((null? lst)
       -1)
     ((eq? (car lst) e)
        0)
     ((eq? (list-index e (cdr lst)) -1)
       -1)
    (else
     (+1 (list-index e (cdr lst)))))))


;Gets the enharmonic of a note.
;i.e. C# -> Db
(define enharmonic
  (lambda (note)
    (cond
      ((= (string-length note) 2)
       (cond
         ((member #\# (string->list note))
          (list-ref enharmonics (+ (list-index note enharmonics) 1)))
         ((member #\b (string->list note))
          (list-ref enharmonics (- (list-index note enharmonics) 1)))))
    (else
       (display "Bad input :(")))))

;crappy test
(newline)
(display "Testing now")
(display (enharmonic "C#"))
(display (enharmonic "Bb"))
