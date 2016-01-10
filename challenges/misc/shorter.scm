;create a function that returns the shortest list of 2 lists


;returns the shortest of 2 lists
(define shorter
  (lambda (ls other-ls)
    (cond
      ((< (length ls) (length other-ls)) ls)
      ((> (length ls) (length other-ls)) other-ls)
      ('()))))
      
