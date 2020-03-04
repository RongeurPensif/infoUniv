package exo5;

public class Main {
    public static void main(String[] args) {
        Pile laPile = new Pile();
        String [] alphabet={"a","b","c","d","e"};
        for (int i=0;i<alphabet.length;i++){
            laPile.empiler(alphabet[i]);
        }
    }
}