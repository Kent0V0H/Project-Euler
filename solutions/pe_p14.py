#!/usr/bin/python3

#The following iterative sequence is defined for the set of positive integers:

#n → n/2 (n is even)
#n → 3n + 1 (n is odd)

#Using the rule above and starting with 13, we generate the following sequence:
#13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

#It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
#Although it has not been proved yet (Collatz Problem), it is thought that all starting 
#numbers finish at 1.

#Which starting number, under one million, produces the longest chain?

#NOTE: Once the chain starts the terms are allowed to go above one million.

big_chn = big_num = 0
for i in range(1000, 1000000):
	chn, num = 0, i 
	while i != 1:
		if i % 2 == 0:
			i = i / 2
		else:
			i = 3 * i + 1
		chn+=1
	if chn > big_chn:
		big_chn, big_num = chn, num
print("ans={}; chn={}".format(big_num,big_chn))