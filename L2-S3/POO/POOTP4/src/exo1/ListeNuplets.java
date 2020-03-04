package exo1;

import java.util.*;
public class ListeNuplets {
    private Nuplet[] lesNuplets;

    private static class Nuplet implements Comparable {
        private int[] content;
        Scanner read = new Scanner(System.in);

        public Nuplet(int k) {
            content = new int[k];
            for (int i = 0; i < k; i++) {
                int x = -1;
                while ( x < 0 ){
                    System.out.println("Saisir un entier positif");
                    x = Integer.parseInt(read.nextLine());
                }
                content[i] = x;
            }
        }
        public String toString (){
            String r = "(";
            for (int i = 0; i < content.length; i++){
                r+= "" + content[i];
                if (i != content.length -1){
                    r+=", ";
                }
            }
            return r+")";
        }

        public int nbElement () {
            return content.length;
        }

        public int getElement(int index){
            if ( index <  0 || index > content.length-1){
                return -1;
            }
            else {
                return content[index];
            }
        }

        @Override
        public int compareTo(Object o) {
            return this.toString().compareTo(o.toString());
        }
    }
    public ListeNuplets(int...lesTailles){
        lesNuplets = new Nuplet[lesTailles.length];
        for (int i = 0; i < lesTailles.length; i++){
            lesNuplets[i] = new Nuplet (lesTailles[i]);
        }
    }
    public String toString(){
        String r = "[";
                for (int i = 0; i < lesNuplets.length; i++){
                    r+= lesNuplets[i].toString();
                    if (i != lesNuplets.length){
                        r+= ", ";
                    }
                }
                return r + "]";
    }
    public Nuplet GetNuplet (int index) {
        if (index < 0 || index > lesNuplets.length-1) {
            return null;
        }
        else {
            return lesNuplets[index];
        }
    }
    public void trier(){
        Arrays.sort(this.lesNuplets);
    }
}
