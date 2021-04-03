
class ice_cubes {
  ice_cubes(){}
  ice_cubes(int xp, int yp) {
    x = xp;
    y = yp;
    display();
  }
  
  int x;
  int y;
  void setPos(int xp, int yp) {
    x = xp;
    y = yp;
  }
  void display() {
    image(ice, x, y);
  }
    
  
  
}
