;Inspired by the mostly adept guide to functional programming
(use srfi-13)

(define compose
  (lambda (f g)
    (lambda (x)
      (f (g x)))))

(define upper
  (lambda (x)
    (string-upcase x)))

(define exclaim
  (lambda (x)
    (string-append x "!")))

(define shout (compose upper exclaim))
(define angry (compose exclaim exclaim))

(display (shout "hello, world"))
(newline)
(display (angry "no"))
(newline)

(assert (string= "no!!" (angry "no")))
(assert (string= "HELLO, WORLD!" (shout "hello, world")))
