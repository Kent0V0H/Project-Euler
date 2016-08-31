//A Pythagorean triplet is a set of three natural numbers, 
//a < b < c, for which, a^2 + b^2 = c^2
//For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
//There exists exactly one Pythagorean triplet for which a + b + c = 1000.
//Find the product abc.

//a < b < 500 (guess: c < 500)
//a + b + sqrt.(a^2 + b^2) = 1000

#include <stdio.h>
#include <math.h>

int main () {

	static int answer, a, b = 0;

	for (b=1;b<500;b++){
	
		for (a=1;a<b;a++){
		
			if (a + b + sqrt(a*a + b*b) == 1000){
			
				answer = (a*b*(sqrt(a*a + b*b)));
				printf("a=%d\t b=%d\t c=%d\n", a, b, (1000-(a+b)));
				
			}
		}
		
	}
	
	printf("answer=%d", answer);
	getchar();
	return 0;

}