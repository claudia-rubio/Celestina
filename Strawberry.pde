class Strawberry {
  int x;
  int y;
  boolean get = false;
  Strawberry(int i, int j) {
    x = i;
    y = j;
  }
  
  //display, if colison, increase count of strawberry by one and disappear
  void display() {
    if(!get) {
      image(strawberry, x, y);
      if(dist(cel.getX(), cel.getY(), x + 38, y + 38) < 38) {
        cel.addStrawberry();
        get = true;
      }
    }
  }
  
}
