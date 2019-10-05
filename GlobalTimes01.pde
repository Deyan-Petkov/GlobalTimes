/*
1.Click 'C' to show coutry names
2. Click with mouse onto text to see current country time
3. Press space key  to see spinning 3D text( or 2d text in 3d dimension :) )

4. Click elsewhere hide the clock 
5. Click 'x' to hide the countries
6. If press 'z' spinning 3D text disappears
*/



PImage img;      
int halfImage;
float distance;
boolean countriesOnOff;
Clocks [] clock;
Text3D text3D;

void setup ()
{
  size (1600, 1000, P3D);
  countriesOnOff = false;
  text3D = new Text3D();
  clock = new Clocks[10];
  for (int i = 0; i< 10; i++)       //iterate creation of new objects
    clock [i] = new Clocks(); 

  img = loadImage ("Space1.jpg");
}

void draw()
{
  image (img, 0, 0);
  pushMatrix();
  text3D.spining();
  popMatrix();
  if (countriesOnOff) {
    clock[1].countryClock("England");               //clock name
    clock[2].countryClock(" Norway");
    clock[3].countryClock("Bulgaria");
    clock[4].countryClock("Pakistan");
    clock[5].countryClock("  Japan");
    clock[6].countryClock("  China");
    clock[7].countryClock("New Zewand");
  }
  clock[1].cClock(0);      //current time in this country
  clock[2].cClock(1);
  clock[3].cClock(2);
  clock[4].cClock(4);
  clock[5].cClock(8);
  clock[6].cClock(7);
  clock[7].cClock(12);
}
void keyPressed() {
  if (key==' ') 
    text3D.starter = true;
  else if (key=='z')
    text3D.starter = false; 


  if (key=='x') countriesOnOff = false;
  else if (key == 'c') countriesOnOff = true;
}


void mouseClicked() {
  for (int i = 0; i < 10; i++) {

    if (dist(mouseX-50, mouseY, clock[i].currentPlaceX, clock[i].currentPlaceY) < 90// if mouse and text palse are equal(in scope of 100 pixels
      && clock[i].currentPlaceX ==clock[i].currentPlaceX &&clock[i].currentPlaceY == clock[i].currentPlaceY )//and mouse is on clock 1(lets say)
      clock[i].swtch = true; //switch current clock(1 lets say) 'on'
    else  clock[i].swtch = false;
  }
}
