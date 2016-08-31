#!/usr/bin/jruby
#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without 
#any remainder.
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def divisible(c)

	@flag = 0
	for i in (1..20)
		if c%i != 0
			@flag = 1
		end
	end
	if @flag == 0
		p c.to_s
		Kernel.exit()
	end
end

count = 1
loop do
	divisible(count)
	count += 1
	break if count > 1000000000
end