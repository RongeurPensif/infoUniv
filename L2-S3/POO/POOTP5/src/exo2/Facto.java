package exo2;

public class Facto {

    private static long factRec (int n) {
        if ( n <= 1 )  {
            return 1;
        }
        else {
            long somme = 0;
            for ( int i = n; i > 1; i-- ) {
                somme = somme*i;
            }
            return somme;
        }
    }

    public static long factorielle ( int n ) throws FactoException {
        /**@return the factorial of n as a long
         * @throws FactoException integer passed in parameter is negative
         *  */
        if ( n < 0 ){
            throw new FactoException ("integer passed in parameter is negative");
        }
        else {
            return factRec( n );
        }
    }
}
