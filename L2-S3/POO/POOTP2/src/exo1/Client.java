package exo1;

class Client {
        private int idClient;
        private String nom;
        private String prenom;
        private String societe;
        private boolean actif;

        public int getIdClient() {
            return idClient;
        }

        public String getNom() {
            return nom;
        }

        public String getPrenom() {
            return prenom;
        }

        public String getSociete() {
            return societe;
        }

        public boolean isActif() {
            return actif;
        }

        public void setIdClient(int idClient) {
            this.idClient = idClient;
        }

        public void setNom(String nom) {
            this.nom = nom;
        }

        public void setPrenom(String prenom) {
            this.prenom = prenom;
        }

        public void setSociete(String societe) {
            this.societe = societe;
        }

        public void setActif(boolean actif) {
            this.actif = actif;
        }

        public Client(int idClient, String nom) {
            this.idClient = idClient;
            this.nom = nom;

        }
}