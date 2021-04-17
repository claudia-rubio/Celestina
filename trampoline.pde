class trampoline {
  int x;
  int y;
  
  trampoline(int xp, int yp) {
    x = xp;
    y = yp;
  }
  void display() {
    image(trampoline, x, y);  
  }
  int getX() {return x;}
  int getY() {return y;}
  
  void fall_down() {
    y+= 2;
  }
  //trampoline jump is Celestin falls on trampolie
  boolean On() {
    //bounce
    if(cel.getX() > getX() && cel.getX() < getX()+96 && cel.getY() <= getY()) {
      cel.set_floor(getY());
      cel.trampoline_jump();
      return true;
    }
    else 
    return false;
  }
  
}
