package main

import (
	"fmt"
	"math"
)

const ONE_MIL int = 1000000

/**************
* T = 0 ; F = 1
**************/
func whole_num_check(x float64) int {
	var y = math.Mod(x, 1)
	if y == 0 {
		return 0
	}
	return 1
}

func main() {
	maxCnt := 500
	var triNum [ONE_MIL]int
	var triNumUltra [10]int
	triNum[0] = 1
	/***********************************************
	* Find all tri num up to 1 k meeting conditions.
	***********************************************/
	j := 0
	for i := 1; j < 10; i++ {
		triNum[i] = triNum[i-1] + i + 1
		if triNum[i] % 550 == 0 && triNum[i] % 660 == 0 && triNum[i] % 770 == 0 {
			triNumUltra[j] = triNum[i]
			j++
		}
	}
	
	for i := 2; i < 10; i++ {
		/****************************************
		* We start at 1 and 1 is always a factor.
		****************************************/
		facCnt := 1

		for j := 2; j <= triNumUltra[i]; j++ {

			/*******************************************
			* If num is div evenly by i then yes factor.
			*******************************************/
			temp := float64(triNumUltra[i]) / float64(j)
			bool := whole_num_check(temp)
			if bool == 0 {
				//fmt.Printf("j: %v\n",j)
				facCnt++
			}
		}
		/***********************************************
		* If facCnt > maxCnt then num found and we end.
		***********************************************/
		if facCnt > maxCnt {
			fmt.Printf("answer: %v; facCnt: %v; i: %v\n", triNumUltra[i], facCnt, i)
			break
		}else{
			fmt.Printf("triNum: %v; facCnt: %v; i: %v\n", triNumUltra[i], facCnt, i)
		}
	}
}
