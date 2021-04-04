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
  boolean jumping;
  //TODO walls
  
  Celeste(int x, int y) {
    xpos = x;
    jumping = false;
    floor = y;
    ypos = floor - 108;
    vx = 0;
    vy = 0;
    atRest = true; //change later after implementing moving
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
  void set_position(int x, int y) {
    floor = y;
    xpos = x;
    ypos = floor - 108;
  }
  void set_floor(int y) {
    floor = y;
  }
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
  
  int getX() {
    return xpos+75;
  }
  int getY() {
    return ypos+75;
  }

}
