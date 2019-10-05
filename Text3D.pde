class Text3D {
  float  textXposition, textYposition, currentSpin, spin, speedX, speedY;
  boolean starter;

  Text3D() {

    textXposition= random(10, width);
    textYposition = random(10, height);
    currentSpin=0;
    spin = 1;          // rotate by + this value 
    speedX= 2;        //text speed
    speedY=2;
    starter= false;   // on/off 3D text visualisation
  }
  void spining() {
    if (starter){
    background(img);
    textSize(200);
    translate(width/2, 0, -300);      //view position
    rotateY(radians(currentSpin));    // define rotation axis
    if (second()%2 ==0)                // change colour every 2 sec
      fill(random(100, 255), random(100, 255), random(100, 255));
    else fill(255, 255, 255);
    text("3D", textXposition-700, textYposition);

    currentSpin+=spin;               // increment so text spins
    pushMatrix();                    // remember curent view position 

    if (textXposition<-120)speedX *=-1;    // keeps text in screen borders
    if (textYposition<120)speedY *=-1;
    if (textXposition>width -120)speedX -=1;
    if (textYposition>height)speedY -=1;
    textXposition+=speedX;                      // keeps text moving horizontally 
    textYposition+=speedY;                      // .... vertically
    popMatrix();                                // after moving the bal bring us back
    }                                           // to the pushMatrix() curent position
  }
}
