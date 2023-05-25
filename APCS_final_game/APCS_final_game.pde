import java.util.Scanner;

int xWidth = 1000;
int yHeight = 1000;
int gridSize = 50;
int[][] map = new int[xWidth/gridSize][yHeight/gridSize];
static int SPACE = 0;
static int COLLIDE = 1;

void setup() {
  size(1500, 1000);
  PImage mapImg = loadImage("mapTest.png");
  createMap(mapImg);
  //printAr(map);
  
  // Calls the dialogue tests from Dialogue
  testing();
  
  //sets all default values inventory to be false;
  for(int i = 0; i < inventory.length; i++){
   inventory[i] = false;  
  }
}  

// Prints a 2d array
void printAr(int[][] arr) {
  for (int i = 0; i < arr.length; i++) {
   for (int j = 0; j < arr[0].length; j++) {
   System.out.print(arr[i][j]);
  } 
  System.out.println();
  }
}

// Creates a map of 1s and 0s from a black and white image
void createMap(PImage mapImg) {
  for (int i = 0; i < map.length; i++) {
   for (int j = 0; j < map[0].length; j++) {
    int pixel = mapImg.get(i,j);
    //System.out.println(pixel);
    if (pixel == -16777216) {
      map[i][j] = COLLIDE;
    } else if (pixel == -1) {
      map[i][j] = SPACE;
    }
  } 
  }
}

void draw() {
  background(color(0));
  //noStroke();
  drawMap();
  move();
  fill(105);
  circle(playerX, playerY, playerRadius);
  
  // player's coord marker
  fill(color(255,0,0));
  circle(playerX,playerY, 3);
  
  // draw a button for dialogue progression
  fill(color(155,155,155));
  // if mouse is over button, light up the button
  if (1050 < mouseX && mouseX < 1450 && 850 < mouseY && mouseY < 950) {
    fill(color(255));
  }
  rect(1050,850,400,100);
  
    
  // Draws the dialogue to the box
  fill(color(255));
  textSize(25);
  text("it's me boy", 1050, 200);
  text("I'm the PS4", 1050, 250);
  text("speaking to you inside your brain", 1050, 300);
}

// Draws the map
void drawMap() {
  for (int i = 0; i < map.length; i++) {
   for (int j = 0; j < map[0].length; j++) {
   if (map[i][j] == COLLIDE) {
     fill(color(0));
   } else {
     fill(color(255,255,255));
   }
   square(i*gridSize,j*gridSize,gridSize);
  } 
  }
}
