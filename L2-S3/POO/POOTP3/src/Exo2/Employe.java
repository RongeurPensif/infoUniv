package Exo2;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Employe {
    private String nom;
    private static int matricule;
    private double salaireMensuel;
    private LocalDate dateEmbauche;

    public Employe( String nom, double salaire_mensuel, LocalDate date_embauche ) {
        this.nom = nom;
        this.salaireMensuel =salaire_mensuel;
        this.dateEmbauche =date_embauche;
        matricule+=1;
    }

    public String getNom() {
        return nom;
    }

    public static int getMatricule() {
        return matricule;
    }

    public double getSalaireMensuel() {
        return salaireMensuel;
    }

    public LocalDate getDateEmbauche() {
        return dateEmbauche;
    }

    public String toString(){
        return "Nom : " + this.nom +";\n Matricule : " + this.matricule + ";\n Salaire mensuel : " + this.salaireMensuel + ";\n Date d'Embauche : " + this.dateEmbauche + ";";
    }

    public double calculerSalaireBrutMensuel(){
        long anciennete = ChronoUnit.YEARS.between(dateEmbauche, LocalDate.now());
        if ( anciennete > 9 ) {
            return salaireMensuel * 1.10;
        }
        else if ( anciennete > 6 ) {
            return salaireMensuel * 1.07;
        }
        else if ( anciennete > 3 ) {
            return salaireMensuel * 1.04;
        }
        else {
            return salaireMensuel;
        }
    }

}
