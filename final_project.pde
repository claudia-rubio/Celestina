import processing.sound.*;

/*
Claudia Rubio

The name of the game is "Celestina"
it is a platformer game based on the game Celeste
although this one won't be as great

To get a feel of what's been done so far:
on the menu click start, then tutorial,
you'll be taken to the tutorial level that hasn't been fully implemented.
You can use the left, right key and the space bar to move the character around.
*/


Celeste cel;
Background background;
boolean start;
boolean second_screen;
boolean pos_set;
int level;
PImage ice;
PImage spike;
PImage ice_ball;
PImage fire_ball;
PImage trampoline;
SoundFile glass_break;
SoundFile music;

void setup() {
  
  size(1800, 1400);
  cel = new Celeste(600, 600);
  background = new Background();
  frameRate(20);
  start = true;
  second_screen = false;
  
  //These images are initiated here once because they'll be used over and over again
  ice = loadImage("ice_cube.png");
  spike = loadImage("spike.png");
  ice_ball = loadImage("ice_ball.png");
  fire_ball = loadImage("fire_ball.png");
  trampoline = loadImage("trampoline.png");
  
  glass_break = new SoundFile(this, "Minecraft Glass Break.mp3");
  music = new SoundFile(this, "Celeste_Sound_track.mp3");
  spike.resize(0, 200);
  level = -1;
  pos_set = false;


  strokeWeight(10);
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
    
    fill(0);
    text("TUTORIAL", width/3, 400);
    text("Level 1", 2*width/3, 400, 300);
    text("Level 2", width/3, 800);
    text("Level 3", 2*width/3, 800);
  }
  
  //level 0 (tutorial level)
  if(level == 0) {
    tutorial_land tutorial = new tutorial_land();
    if(!pos_set) {
      cel.set_position(150, 1400-96*3);
      pos_set = true;
    }
    cel.display();
  }
  
  //TODO call level 1 thoguh 3
  
}

void mouseClicked() {

  //Starting screen buttons:
  if(mouseX <= width/2+300 && mouseX >= width/2-300 && mouseY <= 1000 + 60 && mouseY >= 1000 - 60 && start) {
    glass_break.play();
    start = false;
    second_screen = true;
  }
  if(mouseX <= width/2+300 && mouseX >= width/2-300 && mouseY <= 1200 + 60 && mouseY >= 1200 - 60 && start) {
    glass_break.play();
    exit();
  }
    
   //second screen buttons:
   //Button 1
  if (second_screen) {
    if(mouseX <= width/3 + 150 && mouseX >= width/3 - 150 && mouseY <= 400 + 150 && mouseY >= 400 -150) {
      glass_break.play();
      level = 0;
      second_screen = false;
    }
  }
  
  
  //Other buttons haven't been implemented yet. TODO
  
  //on each level. Check "Go back Buttons" TODO
  //Go back butoons will take back to the second screen where the player can decide what to do
  //and see their collectables/completed levels
  //TODO: add exit button to second screen 
}

void keyPressed() {
  
    if(keyCode == LEFT) 
      cel.moveLeft();
    if(keyCode == RIGHT)
      cel.moveRight();
    if(keyCode == ' ') 
      cel.jump();
}
void keyReleased() {
  if(keyCode == LEFT || keyCode == RIGHT)
    cel.stop();
}
