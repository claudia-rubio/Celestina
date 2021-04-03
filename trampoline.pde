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
  void fall_down() {
    y+= 2;
  }
  
}
