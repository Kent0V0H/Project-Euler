#!/usr/bin/python3

#There are 40 steps to any given path 
#(we have to go 20 steps down and 20 steps right). 
#Since the definition of backtracking makes any given move 
#down indistinguishable from any other move down, 
#and any given move right indistinguishable 
#from any other move right, the answer is 40!/(20!20!)

import math

ans = math.factorial(40)/(math.factorial(20)*math.factorial(20))
print(ans)