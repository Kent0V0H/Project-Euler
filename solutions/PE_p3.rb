#!/usr/bin/jruby

n = 600851475143
@arr = []

def is_whole_number(variable)
	return variable % 1 == 0
end

def prime_check(variable)

	for i in 2..variable-1
		@t = variable.to_f/i.to_f
		#p variable.to_s + "/" + i.to_s + "=" + @t.to_s
		@rslt = is_whole_number(@t)
		if @rslt == true
			#p variable.to_s + " is NOT prime." 
			@arr.push(i)
			prime_check(@t)
		end
	end
	if @rslt == false
		#p variable.to_s + " is prime."
		@arr.push(variable.to_i)
		p @arr
	end
	Kernel.exit()	
end

prime_check(n)