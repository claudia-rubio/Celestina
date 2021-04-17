
class level_2 {
  Spike sp1;
  Spike sp2;
  Spike sp3;
  Spike sp4;
  Spike sp5;
  Spike sp6;
  Spike sp7;
  Spike sp8;
  platform p1;
  platform p2;
  platform p3;
  Switch sw;
  ball b;
  Flag f;
  Strawberry straw;
  boolean right;
  
  level_2() {
    //calling of obejcts in a arrangement to make up the level
    sp1 = new Spike(300, 800);
    sp2 = new Spike(300, 900);
    sp3 = new Spike(500, 800);
    sp4 = new Spike(500, 900);
    p1 = new platform(608, 800, 100, #59FF4B);
    sp5 = new Spike(800, 900);
    sp6 = new Spike(1000, 900);
    sw = new Switch(950, 840);
    sp7 = new Spike(680, 700);
    straw = new Strawberry(680, 770);
    sp8 = new Spike(680, 600);
    p2 = new platform(1350, 500, 100, #8B29FC);
    b = new ball(900, 540);
    right = false;
    f = new Flag(1300, 400, 2);
    
  }
  void move() {
    if(b.x < 700)
      right = false;
    if(b.x > 1100)
      right = true;
      
    if(right)
      b.x-= 5;
    else
      b.x+= 5;
   
      
  }
  
  void display() {
    sp1.display();
    sp2.display();
    sp3.display();
    sp4.display();
    p1.display();
    sp5.display();
    sp6.display();
    sw.display();
    sp7.display();
    sp8.display();
    p2.display();
    b.display(sw.s);
    f.display();
    straw.display();
    
    if(!p1.On() && !p2.On() && !b.On(sw.s)) {
      cel.set_floor(cel.default_floor);
    }
  }
}
