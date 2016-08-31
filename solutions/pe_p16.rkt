#lang racket
(require srfi/1 srfi/26)

#| prompt:
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2^1000?
|#

(define sum 0)
(define x (expt 2 1000))

;; # to list
(define (digits->list num (base 10))
  (unfold-right zero? (cut remainder <> base) (cut quotient <> base) num))
(set! x (digits->list x))

;; add all #
(for ([i x])
  (set! sum (+ sum i)))
sum
