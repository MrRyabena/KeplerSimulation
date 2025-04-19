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


    public Planet(double T_days, double R_Mkm) 
    {
        this.T = T_days * 24 * 60 * 60;
        this.R = R_Mkm * 1.e9;

        a = Math.cbrt(Constants.G * Constants.M * Math.pow(T, 2) / (4 * Math.pow(Math.PI, 2)));
        //b = a + 1000;
        b = Math.sqrt(2 * a * R - R*R);
      //  e = Math.sqrt(a * a + b * b);
        e = Math.sqrt(1 - Math.pow(b, 2)/Math.pow(a, 2));
        p = Math.pow(b, 2) / a;  
        //p = a * (1 - Math.pow(e, 2));
        w_aver = 2 * Math.PI / T;

        x = a;
        y = 0;
    }

    
    double getW(double t) { return Math.sqrt((Constants.G * Constants.M * p) / Math.pow(getR(t), 2)); }
    
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


        //double E = (2 * Math.PI) / T * t + e;
        //double M = E - e;
        
        return a * (1 - e * Math.cos(calculateE(E0, M)));
        //return a * (1 - e * Math.cos(E));
    }

    double getX(double t, double W) { return a * Math.cos(W * t); }
    double getY(double t, double W) { return a + b * Math.sin(W * t); }

    void update(double t)
    {
       double W = 2 * Math.PI / T; 
       //double W = getW(t);
        x = getX(t, W);
        y = getY(t, W);
    }
};
