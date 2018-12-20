import java.util.Scanner;

public class test {
	public static void main(String[] args) throws Exception{
		Scanner sc = new Scanner(System.in);
		
		int a = sc.nextInt();
		int b[] = new int[a];
		for(int i=0; i<a; i+=1) {
			b[i]=sc.nextInt();
			System.out.println(b[i]);
		}
		sc.close();
		
	}
}
