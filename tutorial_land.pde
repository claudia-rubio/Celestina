class tutorial_land {
  trampoline tr;
  ball b1;
  Spike sp1;
  Spike sp2;
  Spike sp3;
  Spike sp4;
  ball[] be;
  float xb1, yb1;
  float angle;
  boolean s;
  platform w1;
  boolean floor_s;

  
  tutorial_land() { //<>//
    
    sp1 = new Spike(250, 1400 - 400);
    sp2 = new Spike(450, 1400 - 750);
    sp3 = new Spike(450, 1400 - 400);
    sp4 = new Spike(450, 1400 - 470);
    
    w1 = new platform(550, 700, 300, #CE0404);

    tr = new trampoline(1300, 850);
    angle = 0;
    
    xb1 = 750+150*cos(angle);
    yb1 = 800+150*sin(angle);
    b1 = new ball(xb1, yb1);
    s = true;
    floor_s = false;
  }
  void move() { //move objects here
    angle+=0.05;
    xb1 = 750+150*cos(angle);
    yb1 = 800+150*sin(angle);
    b1.move(xb1, yb1);
  }
  
  void display() {
    
    b1.display();
    w1.display();
    tr.display();
    
    sp1.display();
    sp2.display();
    sp3.display();
    sp4.display();
    
    if(!tr.On() && !b1.On() && !w1.On()) {
      cel.set_floor(cel.default_floor);
    }
    
    //die due to spikes
    if(dist(sp1.getX(), sp1.getY(), cel.getX(), cel.getY()) < 53
    ||dist(sp2.getX(), sp2.getY(), cel.getX(), cel.getY()) < 53
    ||dist(sp3.getX(), sp3.getY(), cel.getX(), cel.getY()) < 53
    ||dist(sp4.getX(), sp4.getY(), cel.getX(), cel.getY()) < 53) {
      glass_break.play();
      cel.set_position(100, 1400-335);
      b1.flip_switch(false);
      s = true;
    }
   
    if(s) {
      if(dist(b1.getX(), b1.getY(), cel.getX(), cel.getY()) < 65) {
        glass_break.play();
        cel.set_position(100, 1400-335);
        b1.flip_switch(false);
      }
      
      fill(#FEFF36);
      ellipse(1100, 800, 60, 60);
      fill(0);
      text("s", 1100, 800);
      
      if(dist(cel.getX(), cel.getY(), 1100, 800) < 60){
        b1.flip_switch(true);
        glass_break.play();
        s = false;
      }
    }
    


    //TODO add flag and winning condition
  }
  
}
      
