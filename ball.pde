
class ball {
  boolean switch_;
  float x, y;
  ball(float xp, float yp) {
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
  void flip_switch(boolean s) {
    switch_ = s;
  }
  void move(float xp, float yp) {
    x = xp;
    y = yp;
  }
  float getX(){return x+75;}//return center
  float getY(){return y+75;}//return center
}
