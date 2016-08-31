/*
A perfect number is a number for which the sum of its
proper divisors is exactly equal to the number.
For example, the sum of the proper divisors of 28 would be
1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
A number n is called deficient if the sum of its proper divisors is less
than n and it is called abundant if this sum exceeds n.
As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
the smallest number that can be written as the sum of two abundant
numbers is 24. By mathematical analysis, it can be
shown that all integers greater than 28123
can be written as the sum of two abundant numbers.
However, this upper limit cannot be reduced any further
by analysis even though it is known that the greatest
number that cannot be expressed as the sum of two
abundant numbers is less than this limit.
Find the sum of all the positive integers which cannot be written as
the sum of two abundant numbers.
*/

import java.util.*;

public class pe_p23 {

    // Every integer greater than 20161 can be written as the sum of two abundant numbers.
    static int upper_l=20162;
    static int cur_sum=1;   // sum of proper divisors
    static int tot_sum=276; // sum of non-abundant sums (1-23)
    static int cur_cnt=1;   // start
    static int tot_cnt=13;  // first
    static Vector abundants = new Vector();
    static Vector abundant_sums = new Vector();
    

    /*
    func tests to see if divisible
    */
    static void is_divisible(){

	
	// if divisible evenly add to cur_sum
	if ( tot_cnt % cur_cnt == 0 ){
	    cur_sum = cur_sum + cur_cnt;
	}
    }

    
    /*
    func tests to see if greater than half
    */
    static void greater_than_half(){

	
	// if less than half # then cont
	if ( tot_cnt / 2 < cur_cnt ){
	    incr();
	}

    }


    /*
    func checks if abundant appends vector, also
    incr tot_cnt and resets cur_sum and cur_cnt
    */
    static void incr(){


	// if abundant then add to abundants
	if ( cur_sum > tot_cnt ){
	    abundants.addElement(new Integer(tot_cnt));
	}

	// incr tot_cnt and reset cur_sum and cur_cnt
	tot_cnt++;
	cur_sum=1;
	cur_cnt=1;
    }

    
    /*
    main
    */
    public static void main(String[] arg){

	abundants.addElement(new Integer(12)); // first abundant #
	boolean b=true;
	int i;
	int j;
	int tmp=0;

	
	while ( b == true ){

		cur_cnt++;
		is_divisible();
		greater_than_half();
        
		if ( tot_cnt >= upper_l ){
		    b = false;
		}
       	}
	System.out.println("\nGot all abundants...");
	
	
	for ( i=0 ; i<abundants.size() ; i++ ){
	    
	    for ( j=0 ; j<abundants.size() ; j++ ){

		
		tmp = (int)abundants.get(i) + (int)abundants.get(j);
		if ( tmp > upper_l ){
		    continue;
		}
		
		abundant_sums.addElement(new Integer(tmp));
	    }
	}
	System.out.println("\nGot all abundant_sums...");

	
	for ( i=25 ; i<upper_l ; i++ ){

	    if ( abundant_sums.contains(new Integer(i)) ){
	    }else{
		tot_sum = tot_sum + i;
	    }
	}
        System.out.println("\n= " + tot_sum + "\n");
    }
}
