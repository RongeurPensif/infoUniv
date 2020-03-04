package exo5;

public class Pile {
    private Maillon sommet;
    public Maillon origine = new Maillon ("0",sommet);
    public Pile ( ) {
        origine.setSuivant(sommet);
    }
    public void empiler (String s){
        Maillon nouveau = new Maillon (s,sommet);
        sommet=nouveau;
        return;
    }
    public void getString (){
        System.out.println("{");
        Maillon indice = new Maillon ("",origine);
        while(indice!=sommet){
            System.out.println(indice.getValeur()+,);
            indice = indice.getSuivant();
    }
    System.out.println("}");
    return;

    }
    }