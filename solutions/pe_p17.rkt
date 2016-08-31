#lang racket

#|
If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and"
when writing out numbers is in compliance with British usage.
|#

;; define module scope
(define num 1)
(define cur 0)
(define sum 0)

#|
function checks how many hundreds are in num
|#
(define (hundreds n)
	;; check to see if 900..100 even
	(if (equal? 0 (modulo n 100))
            (cond
                  [(equal? 9 (/ n 100))(and(set! sum (+ sum 11))0)] ;; nine-hundred
                  [(equal? 8 (/ n 100))(and(set! sum (+ sum 12))0)] ;; eight-hundred
                  [(equal? 7 (/ n 100))(and(set! sum (+ sum 12))0)] ;; seven-hundred
                  [(equal? 6 (/ n 100))(and(set! sum (+ sum 10))0)] ;; six-hundred
                  [(equal? 5 (/ n 100))(and(set! sum (+ sum 11))0)] ;; five-hundred
                  [(equal? 4 (/ n 100))(and(set! sum (+ sum 11))0)] ;; four-hundred
                  [(equal? 3 (/ n 100))(and(set! sum (+ sum 12))0)] ;; three-hundred
                  [(equal? 2 (/ n 100))(and(set! sum (+ sum 10))0)] ;; two-hundred
                  [else (and(set! sum (+ sum 10))0)]) ;; one-hundred

		 (and (cond
                  ;; floor rounds down
                  [(equal? 9 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 14))cur)] ;; nine-hundred and
                  [(equal? 8 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 15))cur)] ;; eight-hundred and
                  [(equal? 7 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 15))cur)] ;; seven-hundred and
                  [(equal? 6 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 13))cur)] ;; six-hundred and
                  [(equal? 5 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 14))cur)] ;; five-hundred and
                  [(equal? 4 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 14))cur)] ;; four-hundred and
                  [(equal? 3 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 15))cur)] ;; three-hundred and
                  [(equal? 2 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 13))cur)] ;; two-hundred and
                  [(equal? 1 (floor (/ n 100)))
                       (and (set! cur (modulo n 100))(set! sum (+ sum 13))cur)] ;; one-hundred and
                  [else n] ;; not divisible
		 )
        )
    )
)
#| --------------------------------------------------------------------------
function checks how many tens are in num
|#
(define (tens n)
  (cond
    [(equal? 9 (floor (/ n 10)))
         (and (set! cur (modulo n 10))(set! sum (+ sum 6))cur)] ;; ninety
    [(equal? 8 (floor (/ n 10)))
         (and (set! cur (modulo n 10))(set! sum (+ sum 6))cur)] ;; eighty
    [(equal? 7 (floor (/ n 10)))
         (and (set! cur (modulo n 10))(set! sum (+ sum 7))cur)] ;; seventy
    [(equal? 6 (floor (/ n 10)))
         (and (set! cur (modulo n 10))(set! sum (+ sum 5))cur)] ;; sixty
    [(equal? 5 (floor (/ n 10)))
         (and (set! cur (modulo n 10))(set! sum (+ sum 5))cur)] ;; fifty
    [(equal? 4 (floor (/ n 10)))
         (and (set! cur (modulo n 10))(set! sum (+ sum 5))cur)] ;; forty
    [(equal? 3 (floor (/ n 10)))
         (and (set! cur (modulo n 10))(set! sum (+ sum 6))cur)] ;; thirty
    [(equal? 2 (floor (/ n 10)))
         (and (set! cur (modulo n 10))(set! sum (+ sum 6))cur)] ;; twenty
    [else n] ;; not divisible
    )
)
#| --------------------------------------------------------------------------
function checks how many teens are in num
|#
(define (teens n)
  (cond
    [(equal? 1 (floor (/ n 19)))(and(set! sum (+ sum 8))0)] ;; nineteen
    [(equal? 1 (floor (/ n 18)))(and(set! sum (+ sum 8))0)] ;; eighteen
    [(equal? 1 (floor (/ n 17)))(and(set! sum (+ sum 9))0)] ;; seventeen
    [(equal? 1 (floor (/ n 16)))(and(set! sum (+ sum 7))0)] ;; sixteen
    [(equal? 1 (floor (/ n 15)))(and(set! sum (+ sum 7))0)] ;; fifteen
    [(equal? 1 (floor (/ n 14)))(and(set! sum (+ sum 8))0)] ;; fourteen
    [(equal? 1 (floor (/ n 13)))(and(set! sum (+ sum 8))0)] ;; thirteen
    [(equal? 1 (floor (/ n 12)))(and(set! sum (+ sum 6))0)] ;; twelve
    [(equal? 1 (floor (/ n 11)))(and(set! sum (+ sum 6))0)] ;; eleven
    [(equal? 1 (floor (/ n 10)))(and(set! sum (+ sum 3))0)] ;; ten
    [else n] ;; not divisible
    )
)
#| --------------------------------------------------------------------------
function checks how many ones are in num
|#
(define (ones n)
  (cond
    [(equal? 1 (floor (/ n 9)))(set! sum (+ sum 4))] ;; nine
    [(equal? 1 (floor (/ n 8)))(set! sum (+ sum 5))] ;; eight
    [(equal? 1 (floor (/ n 7)))(set! sum (+ sum 5))] ;; seven
    [(equal? 1 (floor (/ n 6)))(set! sum (+ sum 3))] ;; six
    [(equal? 1 (floor (/ n 5)))(set! sum (+ sum 4))] ;; five
    [(equal? 1 (floor (/ n 4)))(set! sum (+ sum 4))] ;; four
    [(equal? 1 (floor (/ n 3)))(set! sum (+ sum 5))] ;; three
    [(equal? 1 (floor (/ n 2)))(set! sum (+ sum 3))] ;; two
    [else (set! sum (+ sum 3))] ;; one
    )
)
#| --------------------------------------------------------------------------
MAIN
|#
(define (main)
   (set! cur (hundreds num)) ;; 900-100
   (set! cur (tens cur)) ;; 90-20
   (set! cur (teens cur)) ;; 19-10
   (if (> cur 0) (ones cur) #f) ;; 9-0
	(set! num (+ num 1))
	(if (equal? num 1000)(and(set! sum (+ sum 11)) sum)(main)) ;; one-thousand
)
;; start
(main)	
