class Clocks {

  float colonPlace, minutePlace, hourPlace, textHeight, textWidth, textWidthMove, textHeightMove, currentPlaceX, currentPlaceY;
  String colon;
  boolean  swtch;
  int s;

  Clocks() {

    textWidth =  random(0, width-200);      // Text horizontal position 
    textHeight = random (0, height);    // Text vertical position
    textWidthMove = random(-2, 2);      //Add horizontal motion to text
    textHeightMove = random (-2, 2);    // Add vertical motion to text
    colon = ":";                       // needed for the clock display
    swtch = false;                    // Switch clocks to on and off
    s = second();
    hourPlace =  width/2-500;
    minutePlace= width/2-100;
    colonPlace=width/2-200;
  }



  void countryClock (String name ) { // display and moove text
    textSize(50);
    //fill(0,255,0);
    stroke(0, 0, 0);
    strokeWeight(10);
    text (name, textWidth, textHeight);

    if (textWidth<=0)textWidthMove = - textWidthMove ;            // move to right if hit the wall
    if (textHeight <= 30) textHeightMove = abs(textHeightMove);   // move down if hit the top
    if (textWidth >= width -200)textWidthMove =- textWidthMove;   //  moove to left if hit right side
    if (textHeight >= height-5) textHeightMove = -abs(textHeightMove); // move upwards if hit the bottom

    textWidth += textWidthMove;        // add horizontal motion value 
    textHeight += textHeightMove;       // add vertical motion value
    currentPlaceX= textWidth;          // takes curent vertical place of thext
    currentPlaceY =textHeight;          // takes current horizontal place of text
  }
  void cClock(int hours) {             // display current countries time
    if (swtch) {
      textSize(200);
      fill(255, 255, 255);
      //strokeWeight(10);
      if (((hour()+hours)%24)<10) hourPlace = width/2 - 350;
      text ( (hour() +hours)%24, hourPlace, height/2);      //
      if (minute()<9) {
        colonPlace = width/2 - 150;
        minutePlace =width/2 -25;
      }
      text(colon, colonPlace, height/2);                    //
      text (minute(), minutePlace, height/2);               // Visualize clock digits
      text(colon, width/2+200, height/2);                  //
      text (second(), width/2+300, height/2);             //
    }
  }
}
