class Celeste {
  PImage[] celeste_r = new PImage[17];
  PImage[] celeste_l = new PImage[17];
  boolean dir; //direction, true = right, false = left
  boolean atRest;
  int xpos;
  int ypos;
  int vx;
  int vy;
  int floor;
  int default_floor;
  int x0, y0;
  boolean jumping;
  int strawberries;
  int deaths;
  
  //Constructor, called from setup
  Celeste(int x, int y) {
    xpos = x;
    jumping = false;
    floor = y;
    ypos = floor - 108;
    x0 = xpos;
    y0 = ypos;
    vx = 0;
    vy = 0;
    strawberries = 0;
    atRest = true;
    for (int i = 0; i < 9; i++) {
      celeste_r[i] = loadImage( "celeste_right/Celeste_r0"+ (i+1)+".png");
      celeste_l[i] = loadImage( "celeste_left/Celeste_l0" + (i+1)+".png");
      celeste_r[i].resize(0, 150);
      celeste_l[i].resize(0, 150);
    }
    for (int j = 9; j < 17; j++) {
      celeste_r[j] = loadImage( "celeste_right/Celeste_r"+ (j+1)+".png");
      celeste_l[j] = loadImage( "celeste_left/Celeste_l" + (j+1)+".png");
      celeste_r[j].resize(0, 150);
      celeste_l[j].resize(0, 150);
    } 
    dir = true;
  }
  
  //Physics of the movement and display image at right location
  void display() {
    xpos += vx;
    ypos += vy;
    
    if(ypos < floor - 108) // if not on the ground, add gravity
      vy+=2;

    if(ypos >= floor - 108) { //if lower than the floor, snap to the floor
      ypos = floor - 108;
      vy = 0;
      jumping = false;
    }
    
    if(dir) {
      image(celeste_r[frameCount%17], xpos, ypos);
    }
    else {
      image(celeste_l[frameCount%17], xpos, ypos);
    }
  }
  //change the position of celestina to a place
  //when celestina dies, she respawns at this position
  void set_position(int x, int y) {
    floor = y;
    xpos = x;
    ypos = floor - 108;
    default_floor = y;
    x0 = x;
    y0 = y;
  }
  //change the hight of the floor 
  void set_floor(int y) {
    floor = y;
  }
  //--- trival functions ------
  void moveLeft() {
    dir = false;
    vx = -8;
  }
  void moveRight() {
    dir = true;
    vx = 8;
  }
  void jump() {
    if(!jumping) {
      vy = -30;
      jumping = true;
    }
  }
  void stop() {
    vx = 0;
  }
  void trampoline_jump() {
    if(!jumping) {
      vy = -40;
      jumping = true;
    }
  }
  void bounce() {
    if(!jumping) {
      vy = -28;
      jumping = true;
    }
  }
  void die() {
    glass_break.play();
    xpos = x0;
    ypos = y0;
    floor = default_floor;
    deaths++;
  }
  void addStrawberry() {
    strawberries++;
  }
  
  int getX() {
    return xpos+75;
  }
  int getY() {
    return ypos+75;
  }

}
