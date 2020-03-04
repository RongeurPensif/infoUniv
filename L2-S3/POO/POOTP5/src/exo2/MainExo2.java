package exo2;
import java.util.*;
public class MainExo2 {
    public static void main(String[] args) throws FactoException {
        Scanner read = new Scanner(System.in);
        System.out.print("Entrer entier : ");
        String line = read.nextLine();
        int x = Integer.parseInt(line);
        System.out.println( Facto.factorielle ( x ) );
    }
}