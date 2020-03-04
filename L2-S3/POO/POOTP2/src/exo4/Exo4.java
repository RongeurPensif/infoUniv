package exo4;
import java.util.Scanner;
public class Exo4 {
    public static void main(String[] args){
        Scanner leScanner = new Scanner (System.in);
        while(true){
            System.out.println("Entrer un entier");
            String input = leScanner.nextLine();
            int entier = Integer.parseInt(input);
            if (entier == 0){
                break;
            }
            System.out.println("somme : "+ entier * (entier + 1 ) / 2 );
            }
        }
    System.out.println("Bye bye !");
}
