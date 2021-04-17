
class ball {
  float x, y;
  
  ball(float xp, float yp) {
    x = xp;
    y = yp;
  }
  //display fire ball if off switch, ice ball if on
  void display(boolean s) {
    if(s) {
      image(ice_ball, x, y);
    }
    else {
      image(fire_ball, x, y);
      if(dist(getX(), getY(), cel.getX(), cel.getY()) < 65) {
        cel.die();
      }
    }
  }  
  void move(float xp, float yp) {
    x = xp;
    y = yp;
  }

  float getX(){return x+75;}//return center
  float getY(){return y+75;}//return center
  
  //determine whether the ball is the floor celeste can stand on
  boolean On(boolean s) {
    if(s && cel.getX() > getX()-75 && cel.getX() < getX()+75 && cel.getY() <= getY()-65){
        cel.set_floor((int)getY() -58);
        //this is to check that bounce doesn't happen if Celeste is on a supperior platform that
        //also happens to be above an ice-ball
        if(dist(0,cel.getY(), 0,getY() -65) <= 50) 
          cel.bounce();
        return true;
    }
    return false;
  }
      
}
