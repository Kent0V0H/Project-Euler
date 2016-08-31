#!/usr/bin/jruby
#A palindromic number reads the same both ways. The largest palindrome made 
#from the product of two 2-digit numbers is 9009 = 91 × 99.
#Find the largest palindrome made from the product of two 3-digit numbers.

ThreeDigitNumber = 999
@n = ""
@p = 0

def reverse
	@n2 = ""
	@n.split("").each do |i|
		@n2.insert(0, i)
	end
end

def palindrome_check

	reverse
	@isPalindrome = 1
	@n.each do |i|
		if @n[i] != @n2[i]
			@isPalindrome = 0 
			break
		end
	end
	if @isPalindrome == 1 
		if @n.to_i > @p
			@p = @n.to_i
		end
	end
end

for i in (1..ThreeDigitNumber).reverse_each
	for j in (1..ThreeDigitNumber).reverse_each
		t = i*j
		@n = t.to_s 
		palindrome_check
	end
end

p "largest: " + @p.to_s