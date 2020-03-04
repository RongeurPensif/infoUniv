package exo2;

public class Temps {
    private int h;
    private int m;
    private int s;

    Temps() {
        this.h = h;
        this.m = m;
        this.s = s;
    }
    Temps(long x){
        long s = x; s = (int) s;
    }

    public int getH() {
        return h;
    }

    public int getM() {
        return m;
    }

    public int getS() {
        return s;
    }

    public void setH(int h) {
        this.h = h;
    }

    public void setM(int m) {
        if(m>59){setH(h+=m/60);setM(m%60);}
    }

    public void setS(int s) {
        if(s >59){setM(m+=s/60);setS(s%60);}
    }
    private void normaliser (long temps){setH((int)(temps/(3600))); setM((int)((temps- (temps/(3600))/60))); setS((int)((temps-(temps- (temps/(3600))/60))));}
    public long conversion (){return h*3600 + m*60 + s*60;}
    public void ajouterTemps (Temps t) {setH(this.h+=t.h);setM(this.m+=t.m);setS(this.s+=t.s);}
}
