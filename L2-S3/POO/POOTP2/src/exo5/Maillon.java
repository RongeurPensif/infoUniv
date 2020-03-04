package exo5;

class Maillon {
    private String valeur;
    private Maillon suivant;
    public Maillon(String s, Maillon m) {
        valeur = s;
        suivant = m;
    }
    public String getValeur() {
        return this.valeur;
    }
    public Maillon getSuivant (){
        return this.suivant;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }

    public void setSuivant(Maillon suivant) {
        this.suivant = suivant;
    }
}