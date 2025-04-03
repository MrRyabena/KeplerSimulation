

Planet planet;

float scale = 1.0e-13;
float shift_x;
float shift_y;

void setup()
{
  size(1200, 720);
  
  shift_x = width / 2;
  shift_y = height / 2;

  
  planet = new Planet(365*24*60*60*60, 147.1e6);
  println(planet.x);
  println(planet.T);
  println(planet.a);
  println(planet.x * scale);
  

}

long tmr;
long days;
void draw()
{
  background(100);
  


if (millis() - tmr >= 10000)
{

   days++;
   planet.update(days / 3600);
   tmr = millis();
   println((float)planet.x * scale + shift_x);
   println((float)planet.y * scale + shift_y);
   println();
} 

   circle((float)planet.x * scale + shift_x, (float)planet.y * scale + shift_y, 40);
  
  
}
