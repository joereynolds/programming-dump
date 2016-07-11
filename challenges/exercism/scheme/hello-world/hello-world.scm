(define hello
  (lambda (#!optional name)
    (if (string? name)
      (string-append "Hello, " name "!")
      (string-append "Hello, World!"))))
