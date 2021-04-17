class level_1 {
  trampoline tr1;
  trampoline tr2;
  
  ball b1;
  ball b2;
  ball b3;
  ball b4;
  ball b5;
  
  Spike sp1;
  Spike sp2;
  Spike sp3;
  Spike sp4;
  platform p1;
  platform p2;
  Flag flag;
  Strawberry straw;
  Switch sw;
  float angle;
  boolean up;
  
  level_1() {
    //calling of obejcts in a arrangement to make up the level
    angle = 0;
    up = true;
    tr1 = new trampoline(200, 800);
    sp1 = new Spike(300, 600);
    tr2 = new trampoline(400, 500);
    
    b1 = new ball(650 + 180 * cos(angle), 400 + 150 * sin(angle));
    b2 = new ball(650 + 180 * cos(angle + 90), 400 + 150 * sin(angle + 90));
    b3 = new ball(650 + 180 * cos(angle + 2*90), 400 + 150 * sin(angle + 2*90));
    
    p1 = new platform(835, 700, 200, #59FF4B);
    straw = new Strawberry(835, 50);
    sw = new Switch(1020, 470);
    
    b4 = new ball(1080, 550);
    p2 = new platform(1330, 300, 250, #05F0B7);
    
    flag = new Flag(1380, 187, 1);
  }
  void move() {
    angle += 0.03;
    b1.move(650 + 180 * cos(angle), 400 + 150 * sin(angle));
    b2.move(650 + 180 * cos(angle + 90), 400 + 150 * sin(angle + 90));
    b3.move(650 + 180 * cos(angle + 2*90), 400 + 150 * sin(angle + 2*90));
    
    if(b4.y < 300)
      up = false;
    if(b4.y > 600)
      up = true;
      
    if(up)
      b4.y-=5;
    else
      b4.y+=5;
    
  }
  void display() {
    sw.display();
    b1.display(sw.s);
    b2.display(sw.s);
    b3.display(sw.s);
    b4.display(sw.s);
    
    p1.display();
    p2.display();
    tr1.display();
    tr2.display();
    sp1.display();
    flag.display();
    straw.display();
    
    if(!tr1.On() && !tr2.On() && !b1.On(sw.s) && !b2.On(sw.s) && !b3.On(sw.s) && !b4.On(sw.s) && !p1.On() && !p2.On()) {
      cel.set_floor(cel.default_floor);
    }
  }
  
  
}
