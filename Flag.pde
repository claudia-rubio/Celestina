class Flag {
  int level;
  int x, y;

  Flag(int xp, int yp, int l) {
    x = xp;
    y = yp;
    level = l;
  }
  //display flag, call winning screen if colison
  void display() {
    image(flag, x, y);
    if(cel.getX() > x && cel.getX() < x + 96 && cel.getY() - (y+48) < 48) {
      completed[level] = true;
      won = level;
    }
 
    
  }
}
