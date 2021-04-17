//calling of obejcts in a arrangement to make up the level

class level_3 {
  trampoline tr1;
  trampoline tr2;
  ball b1; 
  ball b2;
  platform p1;
  platform p2;
  platform p3;
  platform p4;
  Spike sp1;
  Spike sp2;
  Spike sp3;
  Spike sp4;
  Spike sp5;
  Spike sp6;
  Spike sp7;
  Strawberry straw;
  Flag f;
  boolean dir1;
  boolean dir2;
  
  level_3() {
    tr1 = new trampoline(450, 980);
    b1 = new ball(500, 430);
    b2 = new ball(800, 650);
    p1 = new platform(900, 400, 130, #FF8017);
    p2 = new platform(1000, 600, 130, #5FF3FF);
    sp1 = new Spike(850, 350);
    sp2 = new Spike(950, 550);
    tr2 = new trampoline(1150, 680);
    sp3 = new Spike(1250, 200);
    sp4 = new Spike(1250, 560);
    sp5 = new Spike(1250, 100);
    sp6 = new Spike(1390, 550);
    p3 = new platform(1390, 600, 130, 255);
    sp7 = new Spike(770, 700);
    straw = new Strawberry(1003, 520);
    p4 = new platform(1460, 400, 150,#FCFF5F);
    f = new Flag(1450, 300, 3);
    
    
    dir1 = true;
    dir2 = false;
  }
  void move() {
    if(b1.x < 200)
      dir1 = false;
    if(b1.x > 800)
      dir1 = true;
      
    if(dir1)
      b1.x-= 9;
    else
      b1.x+= 9;
      
    if(b2.x < 500)
      dir2 = false;
    if(b2.x > 800)
      dir2 = true;
      
    if(dir2)
      b2.x-= 9;
    else
      b2.x+= 9;
    
  }
  
  void display() {
    tr1.display();
    b1.display(true);
    b2.display(true);
    p1.display();
    p2.display();
    sp1.display();
    sp2.display();
    tr2.display();
    p3.display();
    sp3.display();
    sp4.display();
    sp5.display();
    sp6.display();
    sp7.display();
    straw.display();
    p4.display();
    f.display();
    
    if(!tr1.On() && !p1.On() && !p2.On() && !b1.On(true) && !b2.On(true) && !tr2.On() && !p3.On() && !p4.On()) {
      cel.set_floor(cel.default_floor);
    }
  }
  
}
