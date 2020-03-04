package exo1;

public class MainExo1 {
    public static void main(String[] args) {
        int somme = 0;
        int nbErreurs = 0;
        for (String arg : args){
            try {
                somme += Integer.parseInt(arg);
            }
            catch( NumberFormatException e){
                nbErreurs += 1;
            }
        }
        System.out.println("Somme des arguments : " + somme);
        System.out.println("Nombre de valeur ignorées : " + nbErreurs);
    }
}