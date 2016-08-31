#lang racket

#|
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
|#

(define c 0)
(define s 0)
(define (series)
  (set! c (+ c 1))
  (set! s (+ s (expt c c)))
  (if (equal? c 1000) s (series))
)

(series)