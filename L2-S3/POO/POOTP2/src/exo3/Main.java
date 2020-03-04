package exo3;

public class Main {
    public static double main(String[] args){
        double somme = 0;
        for (int i=0; i < args.length;i++ ){
            somme += Integer.parseInt (args[i]);
        }
        return somme;
    }
}

