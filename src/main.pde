

Planet planet;
Planet planet2;

float scale_x = 1.e-9;
float scale_y = 1.e-9;
float shift_x;
float shift_y;

import java.lang.Math;

void setup()
{
  size(1200, 720, P3D);
  

  shift_x = width / 2;
  shift_y = height / 2;


  planet = new Planet(365*24*60*60, 147.1e9);
  planet2 = new Planet(88*24*60*60, 57.91e9);
  println(planet.x);
  println(planet.T);
  println(planet.a);
  println(planet.x * scale_x);
}

void debug(double t)
{
  println("---------------------------------------------");
  println("T: ", planet.T, planet2.T, planet.T / planet2.T);
  println("R: ", planet.R);
  println("a: ", planet.a);
  println("b: ", planet.b);
  println("p: ", planet.p);
  println("e: ", planet.e);
  println("w_aver: ", planet.w_aver, planet2.w_aver);
//  println("getW: ", planet.getW(t));
  println("getR: ", planet.getR(t));
  planet.update(t);
  println((float)planet.x, (float)planet.y);
  println((float)planet.x * scale_x, (float)planet.y * scale_y, 0);
  println("time: ", t);
  println("---------------------------------------------\n");
}

long tmr;
long days;
void draw()
{
  background(100);

  if (millis() - tmr >= 1)
  {
    days++;
    planet.update(days * 86400);
    planet2.update(days * 86400);
    tmr = millis();
    debug(days * 86400);
    
    //println((float)planet.x * scale + shift_x);
    //println((float)planet.y * scale + shift_y);
    //println();
  }
 // translate((float)planet.x * scale_x + shift_x, (float)planet.y * scale_y + shift_y, 0);
  // translate(0, 0, 0);
  //sphere(40);
  circle((float)planet.x * scale_x + shift_x, (float)planet.y * scale_y + shift_y, 40);
  circle((float)planet2.x * scale_x + shift_x, (float)planet2.y * scale_y + shift_y, 40);
}
