(display "What is your name")
(define name (symbol->string (read)))

(display "What is your age")
(define age (number->string(read)))

(display "What is your username")
(define user (symbol->string(read)))

(display 
 (string-append 
  "Your name is " name
  " and you are " age " years old"
  " and your username is " user))
