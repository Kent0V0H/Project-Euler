include Math

def PrimeCheck(c, p, n)
    bool = true
    prime = 0
    t = 0
    i = 0
    nRooted = Math.sqrt(n)
    while p[i] <= nRooted && i <= c - 1
        t = n / p[i]
        if t % 1 == 0
            bool = false
        end
        i = i + 1
    end
    if bool == true
        prime = n
    end
        
    return prime
end

# Main

# By listing the first six prime numbers: 2, 3, 5, 7, 11, 
# and 13, we can see that the 6th prime is 13. 
# What is the 10 001st prime number?
count = 1
primeArray = Array.new(10001)

primeArray[0] = 2
i = 3
while count != 10001
    prime = PrimeCheck(count, primeArray, i)
    if prime != 0
        primeArray[count] = i
        count = count + 1
    end
    i = i + 1
end
puts "The 10001th prime is: " + (i - 1).to_s
