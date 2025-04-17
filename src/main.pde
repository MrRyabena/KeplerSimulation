

Planet planet;

float scale_x = 1.e-4;
float scale_y = 1.e-6;
float shift_x;
float shift_y;

void setup()
{
  size(1200, 720, P3D);

  shift_x = width / 2;
  shift_y = height / 2;


  planet = new Planet(365*24*60*60*60, 147.1e6);
  println(planet.x);
  println(planet.T);
  println(planet.a);
  println(planet.x * scale_x);
}

void debug(double t)
{
  println("---------------------------------------------");
  println("T: ", planet.T);
  println("R: ", planet.R);
  println("a: ", planet.a);
  println("b: ", planet.b);
  println("p: ", planet.p);
  println("e: ", planet.e);
  println("w_aver: ", planet.w_aver);
  println("getW: ", planet.getW(t));
  println("getR: ", planet.getR(t));
  planet.update(t);
  println((float)planet.x, (float)planet.y);
  println((float)planet.x * scale_x, (float)planet.y * scale_y, 0);
    println("---------------------------------------------\n");
}

long tmr;
long days;
void draw()
{
  background(100);

  if (millis() - tmr >= 100)
  {
    days++;
    planet.update(days * 36000);
    tmr = millis();
    debug(days * 3600);
    //println((float)planet.x * scale + shift_x);
    //println((float)planet.y * scale + shift_y);
    //println();
  }
 // translate((float)planet.x * scale_x + shift_x, (float)planet.y * scale_y + shift_y, 0);
  // translate(0, 0, 0);
  //sphere(40);
  circle((float)planet.x * scale_x + shift_x, (float)planet.y * scale_y + shift_y, 40);
}
