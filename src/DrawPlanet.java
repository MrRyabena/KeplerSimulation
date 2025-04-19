import processing.core.PApplet;


public class DrawPlanet
{
    private Planet m_planet;
    private PApplet m_parent;
    private DrawConfig m_dconf;
    private int m_color;
    private String m_name;


    public DrawPlanet(PApplet parent, Planet planet, String name, int color, DrawConfig draw_scale)
    {
        m_planet = planet;
        m_parent = parent;
        m_dconf = draw_scale;
        m_color = color;
        m_name = name;
    }


    void update(double time)
    {
        m_planet.update(time);

        m_parent.println(m_planet.R, m_planet.T);
        m_parent.println((float)m_planet.x * m_dconf.scale_x + m_dconf.shift_x, (float)m_planet.y * m_dconf.scale_y + m_dconf.shift_y);

        m_parent.fill((m_color >> 16) & 0xff, (m_color >> 8) & 0xff, m_color & 0xff);
        m_parent.circle((float)m_planet.x * m_dconf.scale_x + m_dconf.shift_x, (float)m_planet.y * m_dconf.scale_y + m_dconf.shift_y, 40);
        
    }

    

};
