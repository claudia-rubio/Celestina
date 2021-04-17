//calling of obejcts in a arrangement to make up the level

class tutorial_land {
  trampoline tr;
  ball b1;
  
  Spike sp1;
  Spike sp2;
  Spike sp3;
  Spike sp4;
  float xb1, yb1;
  float angle;
  platform p1;
  platform p2;
  Switch sw;
  Flag fl;
  Strawberry straw;
 
  tutorial_land() { //<>//
    sp1 = new Spike(250, 1400 - 400);
    sp2 = new Spike(450, 550);
    sp3 = new Spike(450, 1400 - 400);
    sp4 = new Spike(450, 1400 - 500);
    
    p1 = new platform(500, 600, 200, #CE0404);
    p2 = new platform(860, 396+15, 200, #FFFC9B);
    tr = new trampoline(1300, 850);
    straw = new Strawberry(1300, 400);
    angle = 0;
    
    sw = new Switch(1100, 800);
    
    xb1 = 750+150*cos(angle);
    yb1 = 800+150*sin(angle);
    b1 = new ball(xb1, yb1);
    fl = new Flag(800, 300, 0);
  }
  void move() { //move objects here
    angle+=0.05;
    xb1 = 750+150*cos(angle);
    yb1 = 800+150*sin(angle);
    b1.move(xb1, yb1);
  }
  
  void display() {
      image(postcard, 1450, 0);
      sw.display();
      p1.display();
      p2.display();
      b1.display(sw.s);
      tr.display();
      sp1.display();
      sp2.display();
      sp3.display();
      sp4.display();
      fl.display();
      straw.display();
      if(!tr.On() && !b1.On(sw.s) && !p1.On() && !p2.On()) {
        cel.set_floor(cel.default_floor);
      } 
    }

  
  
}
      
