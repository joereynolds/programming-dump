#lang typed/racket

(: double (-> Number Number))
(define (double x)
  (+ x x))

(display (double 10))
