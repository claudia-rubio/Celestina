
import processing.sound.*;

/*
Claudia Rubio
Celestina
All levels are beatable and all strawberies are attainable without dying
*/


Celeste cel;
Background background;
boolean start;
boolean second_screen;
boolean pos_set;
int level;
PImage spike;
PImage ice_ball;
PImage fire_ball;
PImage trampoline;
PImage s_on;
PImage s_off;
PImage flag;
PImage strawberry;
PImage postcard;

SoundFile glass_break;
SoundFile music;
boolean completed[];
int won;

tutorial_land tutorial;
level_1 lev1;
level_2 lev2;
level_3 lev3;

void setup() {
  
  size(1800, 1400);
  cel = new Celeste(600, 600);
  background = new Background();
  
  start = true;
  second_screen = false;
  //load all the data
  spike = loadImage("spike.png");
  spike.resize(0, 75);
  ice_ball = loadImage("ice_ball.png");
  fire_ball = loadImage("fire_ball.png");
  fire_ball.resize(0, 150);
  ice_ball.resize(0, 150);
  trampoline = loadImage("trampoline.png");
  s_on = loadImage("s_on.png");
  s_off = loadImage("s_off.png");
  flag = loadImage("flag.png");
  strawberry = loadImage("strawberry.png");
  strawberry.resize(0, 75);
  postcard = loadImage("postcard.PNG");
  postcard.resize(0, 450);

  glass_break = new SoundFile(this, "Minecraft Glass Break.mp3");
  music = new SoundFile(this, "Celeste_Sound_track.mp3");
  
  level = -1;
  pos_set = false;
  completed = new boolean[4];
  won = -1;
  
  tutorial = new tutorial_land();
  lev1 = new level_1();
  lev2 = new level_2();
  lev3 = new level_3();
  
  strokeWeight(7);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(40);
}

void draw() {
  background(255);
  background.display(level);
  if(!music.isPlaying())
    music.play();
    
  //first screen
  if(start) { 
    fill(255);
    rect(width/2, 1000, 600, 120); 
    rect(width/2, 1200, 600, 120);
    fill(0);
    text("START", width/2, 1000);
    text("EXIT", width/2, 1200);
    cel.display();
  }
  
  //second screen
  if(second_screen) {
  //buttons
    fill(255);
    rect(width/3, 400, 300, 300); 
    rect(2*width/3, 400, 300, 300);
    rect(width/3, 800, 300, 300); 
    rect(2*width/3, 800, 300, 300);
    rect(width/2, 1200, 600, 120);
    
    fill(0);
    text("TUTORIAL", width/3, 400);
    text("Level 1", 2*width/3, 400, 300);
    text("Level 2", width/3, 800);
    text("Level 3", 2*width/3, 800);
    text("EXIT", width/2, 1200);
    
    if(completed[0] == true){
      image(flag, width/3, 450);
    }
    if(completed[1] == true){
      image(flag, 2*width/3, 450);
    }
    if(completed[2] == true){
      image(flag, width/3, 850);
    }
    if(completed[3] == true){
      image(flag, 2*width/3, 850);
    }
    fill(0);
    image(strawberry, 120, 50);
    text(": " + cel.strawberries + "/4", 250, 100);
    text("Deaths:  " + cel.deaths, 600, 100);
  }
  
  //wining level screen
  if(won != -1) {
    winLevel(won);
  }
  //level 0 (tutorial level)
  else if(level == 0) {
    if(!pos_set) {
      cel.set_position(100, 1400-335);
      pos_set = true;
    }
    tutorial.move();
    tutorial.display();
    cel.display();
  }
  //Level 1
  else if(level == 1) {
    if(!pos_set) {
      cel.set_position(100, 1400-355);
      pos_set = true;
    }
    lev1.move();
    lev1.display();
    cel.display();
  }
  //Level 2
  else if(level == 2) {
    if(!pos_set) {
      cel.set_position(100, 1400-400);
      pos_set = true;
    }
    lev2.move();
    lev2.display();
    cel.display();
  }
  //Level 3
  else if(level == 3) {
    if(!pos_set) {
      cel.set_position(100, 1400-240);
      pos_set = true;
    }
    lev3.move();
    lev3.display();
    cel.display();
  }
  //Go back button in all levels
  if(level >= 0 && won == -1){
    fill(255);
    rect(200, 100, 250, 75);
    fill(0);
    text("GO BACK", 200, 115);
  }
  
}

//this function draws the screen that appears when the player beaths a level
void winLevel(int level) {
  fill(0);
  rect(width/2, height/2, width, height);
  fill(255);
  textSize(80);
  image(flag, width/2 - 50, height/2-300);
  text("CONGRATULATIONS!\n Level " + level + " completed", width/2, height/2-100);
  rect(width/2, 1050, 500, 100);
  if(level != 3)
    rect(width/2, 1200, 500, 100);
  fill(0);
  textSize(40);
  text("GO BACK", width/2, 1065);
  if(level != 3)
    text("NEXT LEVEL", width/2, 1215);
      
}

//Handle events and user interface
void mouseClicked() {

  //Starting screen buttons:
  if(mouseX <= width/2+300 && mouseX >= width/2-300 && mouseY <= 1000 + 60 && mouseY >= 1000 - 60 && start) {
    glass_break.play();
    start = false;
    second_screen = true;
  }
  
  //Exit buttons on both screens
  if(mouseX <= width/2+300 && mouseX >= width/2-300 && mouseY <= 1200 + 60 && mouseY >= 1200 - 60 && (start || second_screen)) {
    glass_break.play();
    exit();
  }
    
 //second screen buttons:
  if (second_screen) {
    //tutorial button
    if(mouseX <= width/3 + 150 && mouseX >= width/3 - 150 && mouseY <= 400 + 150 && mouseY >= 400 -150) {
      glass_break.play();
      level = 0;
      second_screen = false;
    }
    //level 1 button
    if(mouseX <= 2*width/3 + 150 && mouseX >= 2*width/3 - 150 && mouseY <= 400 + 150 && mouseY >= 400 -150) {
      glass_break.play();
      level = 1;
      second_screen = false;
    }
    
    //level 2 button
    if(mouseX <= width/3 + 150 && mouseX >= width/3 - 150 && mouseY <= 800 + 150 && mouseY >= 800 -150) {
      glass_break.play();
      level = 2;
      second_screen = false;
    }
    
    //level 3 butoon
    if(mouseX <= 2*width/3 + 150 && mouseX >= 2*width/3 - 150 && mouseY <= 800 + 150 && mouseY >= 800 -150) {
      glass_break.play();
      level = 3;
      second_screen = false;
    }
  }
  //when someone clicks go back
  if(level >= 0 && won == -1) {
    if(mouseX <= 200 + 125 && mouseX >= 200 - 125 && mouseY <= 100 + 37.5 && mouseY >= 100 -37.5) {
      level = -1;
      second_screen = true;
      glass_break.play();
      pos_set = false;
    }
  }
  //when on winning screen
  if(won > -1) {
    //go back button
    if(mouseX <= width/2 + 250 && mouseX >= width/2 -250 && mouseY <= 1050 + 50 && mouseY >= 1050-50) {
      level = -1;
      second_screen = true;
      glass_break.play();
      pos_set = false;
      won = -1;
    }
    //next level button
    else if(won != 3 && mouseX <= width/2 + 250 && mouseX >= width/2-250 && mouseY <=1200+50 && mouseY >=1200-50) {
      level = won+1;
      glass_break.play();
      pos_set = false;
      won = -1;
    }
  }
}

//Handle key presses that move Celestina
void keyPressed() {
    if(keyCode == LEFT) 
      cel.moveLeft();
    if(keyCode == RIGHT)
      cel.moveRight();
    if(keyCode == ' ') 
      cel.jump();
}
//Stop moving left or right when the arrow keys are not pressed
void keyReleased() {
  if(keyCode == LEFT || keyCode == RIGHT)
    cel.stop();
}
