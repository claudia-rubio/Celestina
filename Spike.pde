
class Spike {
  int x;
  int y;
  Spike(int xp, int yp) {
    x = xp;
    y = yp;

  }
  int getX(){return x+75/2;}
  int getY(){return y+75/2;}
  
  void display() {
    image(spike, x, y);
    if(dist(getX(), getY(), cel.getX(), cel.getY()) < 53) {
      cel.die();
    }
  }
  
}
