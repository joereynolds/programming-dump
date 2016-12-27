#lang racket

(require rackunit)

(struct particle (mass x y))

(define particle-1 (particle 1 -5.2 3.8))
(define particle-2 (particle 1 8.7 -4.1))
(define particle-3 (particle 4 0.04 -0.02))
(define particle-4 (particle 4 -0.02 -0.03))

(define (force particle-a particle-b)
  (let ([distance-squared (expt (distance particle-a particle-b) 2)])
    (/
      (* (particle-mass particle-a)
         (particle-mass particle-b))
      distance-squared)))

(define (distance particle-a particle-b)
  (let ([delta-x (- (particle-x particle-a) (particle-x particle-b))]
        [delta-y (- (particle-y particle-a) (particle-y particle-b))])
  (sqrt (+ (expt delta-x 2) (expt delta-y 2)))))

(check-= (force particle-1 particle-2) 0.0039 0.01)
(check-= (force particle-3 particle-4) 4324.3279 0.01)