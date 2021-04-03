  class Background {
    
    PImage[] background;
    PImage level_0;
    
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
      
      //TODO level 1-3 background if-statements
      
    }
  
  }
