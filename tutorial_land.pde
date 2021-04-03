class tutorial_land {
  
  tutorial_land() {
    for(int i = 0; i < width; i+=96) {

      ice_cubes ic1 = new ice_cubes(i, 1400 - 2*96);
      ice_cubes ic2 = new ice_cubes(i, 1400 - 96);
      ice_cubes ic3 = new ice_cubes(i, 1400 - 3*96);
    }
    Spike sp1 = new Spike(300, 1400 - 5*96);
    
    Spike sp2 = new Spike(700, 1400 - 9* 100);
    Spike sp3 = new Spike(700, 1400 - 5* 90);
    Spike sp4 = new Spike(700, 1400 - 6* 90);
    
    trampoline tr = new trampoline(1200, 900);
    tr.display();
    
    int xb1 = 1000;
    int yb1 = 1000;
    ball b1 = new ball(xb1, yb1);
    b1.display();
    
    //TODO: Add a go back button 
  }
}
      
