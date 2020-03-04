package annuaire;

public class Main {
    public static void main ( String [] args ) {

        ListeNumTel leLivre = new ListeNumTel (
                new NumTel(12345679),
                new NumTel(1234567898)
        );
        System.out.println(leLivre);

    }
}
