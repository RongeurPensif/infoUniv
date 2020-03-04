package Exo2;

import java.time.LocalDate;

public class Main {
    public static void main ( String [] args ) {
        Employe e1 = new Employe("JD", 1092,  LocalDate.of(1989,6,14));
        //System.out.println("" + e1 + e1.calculerSalaireBrutMensuel());

        Responsable r1 = new Responsable("Rep", 5000,  LocalDate.of(2001,3,1), "PDG", 5, e1);
        System.out.println(r1);
        //Responsable e1
    }
}
