package exo1;

public class Main {
    public static void main(String[] args) {
        Client unClient = new Client(1, " Dupont");
        System.out.println(unClient.getIdClient());
        System.out.println(unClient.getNom());
        System.out.println(unClient.getPrenom());
        System.out.println(unClient.getSociete());
        System.out.println(unClient.isActif());
    }
}
