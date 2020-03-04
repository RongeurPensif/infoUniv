package Exo2;

import java.time.LocalDate;

public class Responsable extends Employe {
    private String titre;
    private int pourcentagePrime;
    private Employe[] lesSubordonnes;


    public Responsable( String nom, double salaire_mensuel, LocalDate date_embauche, String titre, int pourcentagePrime, Employe... lesSubordonnes ) {
        super(nom, salaire_mensuel, date_embauche);
        this.titre=titre;
        this.pourcentagePrime=pourcentagePrime;
        this.lesSubordonnes=lesSubordonnes;
    }

    public double calculerSalaireBrutMensuel(){
        return super.calculerSalaireBrutMensuel() + ( getSalaireMensuel() * pourcentagePrime / 100 ) ;
    }

    public String toString(){
        String s = "Responssable [\nStatue en tant qu'employé : \n"+ super.toString() + "\n Titre : " + this.titre + ";\n ";
        for (int i = 0; i<lesSubordonnes.length; i++) {
            s += lesSubordonnes [ i ].getNom();
        }
        return s+"\n]";
    }
}
