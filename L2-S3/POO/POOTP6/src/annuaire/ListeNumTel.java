package annuaire;
import java.util.*;
public class ListeNumTel {

    public List<NumTel> lesNumTel = new LinkedList<NumTel>();

    public ListeNumTel( NumTel... NumerosTelephones ) throws IllegalArgumentException {
        if ( NumerosTelephones.length == 0 ) {
            throw new IllegalArgumentException("Must have at least one number");
        }
        else {
            for ( NumTel t : NumerosTelephones ) {
                lesNumTel.add( t );
            }
        }
    }

    public boolean ajouter( int index, NumTel num ) {
        if ( lesNumTel.get( index ) == num ) {
            return false;
        }
        else {
             lesNumTel.set( index, num );
            return true;
        }
    }

    public boolean ajouterFin ( NumTel num ){
        if ( lesNumTel.get( lesNumTel.size() -1 ) == num ) {
            return false;
        }
        else {
            lesNumTel.set( lesNumTel.size(), num );
            return true;
        }
    }

    public boolean contientNumero (int num) {
        return lesNumTel.contains( num  );
    }
    public java.util.Iterator<NumTel> iterator(){
        return lesNumTel.iterator();
    }

    public int nbNumero (){
        return lesNumTel.size();
    }

    public NumTel numero (int index){
        return lesNumTel.get( index );

    }

    public NumTel premierNumero() {
        return lesNumTel.get( 0 );
    }

    public boolean retirer ( int num ) {
        if (num < lesNumTel.size() && num >= 0 && lesNumTel.size()>=2){
            lesNumTel.remove( num );
            return true;
        }
        else {
            return false;
        }
    }

    public java.lang.String toString(){
        String r="[";
        Iterator i = lesNumTel.listIterator();
        while (i.hasNext()){
            r+=""+i.next();
            if (i.hasNext()){
                r+=", ";
            }
        }
        r+="]";
        return r;
    }
}
