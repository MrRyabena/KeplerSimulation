import java.lang.Math;

public class Planet
{
    
    public double x;
    public double y;
    
    public double T;      // Period
    public double R;      // The distance from the focus to the trajectory

    public double a;
    public double b;
    public double p;
    public double e;
    public double w_aver;


    public Planet(double T, double R) 
    {
        this.T = T;
        this.R = R;

        a = Math.cbrt(Math.pow(T*T, 2));
        b = Math.sqrt(R * (2 * a - R));
        p = a * (1 - Math.pow(e, 2));
        e = Math.pow(1 - Math.pow(b, 2) / Math.pow(a, 2), 2);
        w_aver = 2 * Math.PI / T;

        x = a;
        y = 0;
    }

    
    double getW(double t) { return Math.sqrt((Constants.G * Constants.M * p) / Math.pow(getR(t), 2); }
    
    double updateE(double E, double M) { return E - (E - e * Math.sin(E) - M) / (1 - e * Math.cos(E)); }
    double calculateE(double E, double M) 
    {
        double accuracy = 1.e-6;
        double En = E;
        double En1 = updateE(En, M);

        while (Math.abs(En1 - En) > accuracy) { En = En1; En1 = updateE(En, M); }

        return En1;
    }

    double getR(double t) 
    {
        double M = (w_aver) * t;
        double E0 = M + e * Math.sin(M);
        
        return a * (1 - e * Math.cos(calculateE(E0, M)));
    }

    double getX(double t, double W) { return a + a * Math.cos(W); }
    double getY(double t, double W) { return b * Math.sin(W); }

    void update(double t)
    {
        double W = getW(t);
        x = getX(t, W);
        y = getY(t, W);
    }
};
