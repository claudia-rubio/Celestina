class platform {
  int x;
  int y; 
  int w;
  color c;
  platform(int xp, int yp, int wi, color cl) {
    x = xp;
    y = yp;
    w = wi;
    c = cl;
  }
    
  void setPos(int xp, int yp) {
    x = xp;
    y = yp;
  }
  int getX_l() {
    return x-w/2;
  }
  int getX_r() {
    return x+w/2;
  }
  int getY() {
    return y-15;
  }
  void display() {
    fill(c);
    rect(x, y, w, 30);

  }
  boolean On() {
    if(cel.getX() > getX_l() && cel.getX() < getX_r() && cel.getY() <= getY()) {
      cel.set_floor(getY());
      return true;
    }
    return false;
  }
}
