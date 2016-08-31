#lang racket
(require srfi/1 srfi/26)

#|
n! means n × (n - 1) × ... × 3 × 2 × 1
For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
Find the sum of the digits in the number 100!
|#

(define num 100)
(define f 0)
(define l '() )
(define sum 0)

;; num!
(define (factorial n)
  (if (= f 0) (set! f n) (set! f (* f n)))
  (set! n (- n 1))
  (if (> n 0) (factorial n) f)
)
(factorial num)

;; # to list
(define (digits->list n (base 10))
  (unfold-right zero? (cut remainder <> base) (cut quotient <> base) n))
(set! l (digits->list f))

;; add all #
(for ([i l])
  (set! sum (+ sum i)))
sum