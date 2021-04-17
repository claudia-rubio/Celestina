class Switch {
  int x;
  int y;
  boolean s;
  boolean once;
  
  Switch(int i, int j) {
    x = i;
    y = j;
    s = false;
    once = true;
  }
  //display, switch switch if colision
  void display() {
    if(s) 
      image(s_on, x, y);
    else 
      image(s_off, x, y);
      
    if(dist(cel.getX(), cel.getY(), x+32, y+32) < 60){
      if(once) {
        s = !s;
        once = false;
        glass_break.play();
      }
    }
    if(!cel.jumping) //prevents changing multiple times while Celestina hovers over the switch
      once = true;
  }
}
