
class ball {
  boolean switch_;
  int x;
  int y;
  ball(int xp, int yp) {
    switch_ = false;
    x = xp;
    y = yp;
  }
  void display() {
    if(switch_) {
      image(ice_ball, x, y);
    }
    else {
      image(fire_ball, x, y);
    }
  }
  void flip_switch() {
    switch_ = !switch_;
  }
  void move(int xp, int yp) {
    x = xp;
    y = yp;
  }
}
