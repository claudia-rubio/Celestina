  //-------------finished -----------------------
  class Background {
    
    PImage[] background;
    PImage level_0;
    PImage level_1;
    PImage level_2;
    PImage level_3;
    
    Background() {
      background = new PImage[16];
      for(int i = 0; i < 10; i++) {
        background[i] = loadImage("background/background0" + i+".png");
        background[i].resize(1800, 1400);
      }
      for(int j = 10; j < 16; j++) {
        background[j] = loadImage("background/background" + j+".png");
        background[j].resize(1800, 1400);
      }
      level_0 = loadImage("background/level_0.png");
      level_0.resize(1800, 1400);
      level_1 = loadImage("background/level_1.png");
      level_1.resize(1800, 1400);
      level_2 = loadImage("background/level_2.png");
      level_2.resize(1800, 1400);
      level_3 = loadImage("background/level_3.png");
      level_3.resize(1800, 1400);
    }
    

    void display(int level) {
      //fancy background for starting screen
      if(level == -1)
        image(background[frameCount%16], 0, 0);
      //tutorial level background
      if(level == 0) {
        tint(255, 80);
        image(level_0, 0, 0);
        noTint();
      }
      if(level == 1) { 
        tint(255, 200);
        image(level_1, 0, 0);
        noTint();
      }
      if(level == 2) { 
        tint(255, 150);
        image(level_2, 0, 0);
        noTint();
      }
      if(level == 3) { 
        tint(255, 150);
        image(level_3, 0, 0);
        noTint();
      }
    }
  
  }
