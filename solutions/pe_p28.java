import java.math.BigInteger;

public class pe_p28 { 
    public static void main(String[] arg){

	BigInteger limit = (new BigInteger("1001")).pow(2);
	limit = limit.add(BigInteger.ONE);
	BigInteger squ = BigInteger.valueOf(3);
	BigInteger num = BigInteger.valueOf(1);
	BigInteger tot = BigInteger.valueOf(0);
	
	while ( num.compareTo(limit) < 0 ){
	    tot = tot.add(num);
	    num = num.add(squ.subtract(BigInteger.ONE));

	    if ( num.compareTo(squ.pow(2)) >= 0 ){
		squ = squ.add(BigInteger.valueOf(2));
	    }
	}
	System.out.println("=" + tot);
    }
}
