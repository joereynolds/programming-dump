;https://www.reddit.com/r/dailyprogrammer/comments/39ws1x/20150615_challenge_218_easy_todo_list_part_1/
(define todo '("eat breakfast" "take a shower"))

;doesn't really need to be a procedure
;since it's just a wrapper for cons...
(define add-item
  (lambda (item ls)
    (cons item ls)))

(define show-list
  (lambda (ls)
    (cond
      ((null? ls) (newline))
      (else (display 
              (string-append(car ls) "\n"))
            (show-list (cdr ls))))))

(define delete-item
  (lambda (item ls)
    (cond
      ((null? ls) '())
      ((eqv? item (car ls)) (delete-item item (cdr ls)))
      (else (cons (car ls) (delete-item item (cdr ls)))))))

