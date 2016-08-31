import java.util.Calendar;

public class pe_p19 {
  public static void main(String args[]) {
    int i, j, n = 0;
    Calendar c = Calendar.getInstance();
    for (i = 1901; i <= 2000; i++) {
      for (j = 0; j < 12; j++) {
        c.set(i,j,1);
        if (c.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
          n++;
        }
      }
    }
    System.out.println("" + n);
  }
}
