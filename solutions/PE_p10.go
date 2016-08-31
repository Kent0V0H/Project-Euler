package main

import "fmt"
import "math"

func main() {

	primeSum := 0

	for i := 1; i < 2000000; i++ {
		if isPrime(i) {
			primeSum += i
		}
	}

	fmt.Println(primeSum)
}

func isPrime(n int) bool {

	if n == 1 {
		return false
	} else if n < 4 {
		return true
	} else if math.Mod(float64(n), 2) == 0 {
		return false
	} else if n < 9 {
		return true
	} else if math.Mod(float64(n), 3) == 0 {
		return false
	} else {
		f := 5.0
		r := int(math.Floor(math.Sqrt(float64(n))))
		for int(f) <= r {
			if math.Mod(float64(n), f) == 0 {
				return false
			} else if math.Mod(float64(n), f+2) == 0 {
				return false
			}
			f += 6
		}
	}
	return true
}
