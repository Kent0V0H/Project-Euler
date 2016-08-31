\ If we list all the natural numbers below 10 that are multiples of 3 or 5, 
\ we get 3, 5, 6 and 9. The sum of these multiples is 23.
\ Find the sum of all the multiples of 3 or 5 below 1000.

variable ans

: mod3-5 
	dup 3 mod 0 = swap
	dup 5 mod 0 = rot
	or
	IF ans @ + ans ! ELSE drop THEN ;

: loop1k 1000 1 DO I mod3-5 LOOP ;

loop1k
.( ans= ) ans ? cr