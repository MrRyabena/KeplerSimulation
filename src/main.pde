import controlP5.*;

DrawConfig draw_conf;

DrawPlanet[] planets;
int planets_size = 7;

float prevMouseX, prevMouseY;

ControlP5 cp5;
Knob speedKnob;
float speedMultiplier = 1.0;

void setup()
{
    size(1200, 720, P3D);
  
    cp5 = new ControlP5(this);
    speedKnob = cp5.addKnob("speed")
      .setRange(0.1, 100.0)
      .setValue(1.1)
      .setPosition(20, 20)
      .setRadius(50)
      .setLabel("Speed")
      ;

  
    draw_conf = new DrawConfig((float)width / 3, (float)height / 4, 1.5e-10, 1.5e-10, 1.e-9);
  
    planets = new DrawPlanet[]
    {
        new DrawPlanet(this, new Planet(364.24, 147.1),   "Earth",   0x00FFFF, draw_conf),
        new DrawPlanet(this, new Planet(88, 46),          "Mercury", 0x696969, draw_conf),
        new DrawPlanet(this, new Planet(224.7, 107.5),    "Venus",   0xFFDEAD, draw_conf),
        new DrawPlanet(this, new Planet(687, 206.7),      "Mars",    0xB22222, draw_conf),
        new DrawPlanet(this, new Planet(4343.5, 740.5),   "Jupiter", 0xFF6347, draw_conf),
        new DrawPlanet(this, new Planet(20767.5, 1352.6), "Saturn",  0xFFFF00, draw_conf),
        new DrawPlanet(this, new Planet(30660, 2741.3),   "Uranus",  0x00CED1, draw_conf),
    };
    
    noStroke();
}


long tmr;
long days;
void draw()
{


  if (millis() - tmr >= 1)
  {
    days += speedMultiplier;
    background(180);
    for (int i = 0; i < planets_size; i++)
    {
       planets[i].update(days * 24 * 60 * 60); 
    }
   
  }
 
}


boolean inKnob()
{
  return mouseX >= 20 && mouseX <= 80 && mouseY >= 20 && mouseY <= 80;
}

void mousePressed() 
{
    prevMouseX = mouseX;
    prevMouseY = mouseY;

}

void mouseDragged() 
{
  if (mouseButton == LEFT && !inKnob()) 
  {
    draw_conf.shift_x += (mouseX - prevMouseX);
    draw_conf.shift_y += (mouseY - prevMouseY);
    prevMouseX = mouseX;
    prevMouseY = mouseY;
  }
}

void mouseWheel(MouseEvent event) 
{
  float e = -event.getCount();
  float scale_factor = 1.0 + e * 0.1;
  
  if (!inKnob())
  {
  draw_conf.scale_x *= scale_factor;
  draw_conf.scale_y *= scale_factor;
  }
}

void speed(float value) 
{
  speedMultiplier = value;
}
