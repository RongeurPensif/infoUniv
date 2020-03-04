package annuaire;
import java.util.*;
public class Annuaire {
    Map<Personne, ListeNumTel> annuaire;
    public Annuaire () {
         annuaire = new HashMap<Personne, ListeNumTel>();
    };
    public boolean ajouterEntree(Personne p, ListeNumTel nums){
        if (!annuaire.containsKey(p)){
            annuaire.put( p, nums);
            return true;
        }
        else {
            return false;
        }

    }

    public ListeNumTel numeros (Personne p){
        if (!annuaire.containsKey(p)){
            return null;
        }
        else {
            return annuaire.get(p);

        }
    }

    public java.util.Iterator <Personne> personne (){
        Set listed = annuaire.entrySet();
        return listed.iterator();
    }

    public void ajouterNumeroFin (Personne p, NumTel n){
        if (annuaire.containsKey(p)) {
            ListeNumTel number = annuaire.get(p);
            number.ajouterFin(n);
        }
        else {
            ListeNumTel l = new ListeNumTel();
            annuaire.put(p,l);
            l.ajouterFin(n);
        }
        return;
    }

    public void supprimer (Personne p) {
        if (annuaire.containsKey(p)) {
            annuaire.remove(p);
        }
        return;
    }

    public void supprimerNumero (int n, Personne p){
        if (annuaire.containsKey(p)){
            ListeNumTel tmp = annuaire.get(p);
            if (tmp.lesNumTel.size() == 1){
                supprimer(p);
            }

        }
        return;
    }

    public Set<Personne> lesEntreesPour (String nom ) {
        TreeSet<Personne> tp = new TreeSet<Personne>();

        while (it.hasNext()) {
            Personne p = it.next();
            if (p.getNom_()==nom){
                tp.add(p);
            }
        }
        return tp;
    }

}