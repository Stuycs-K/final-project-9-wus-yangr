import java.util.Scanner;

int xWidth = 1000;
int yHeight = 1000;
int gridSize = 50;
int[][] map = new int[xWidth/gridSize][yHeight/gridSize];
ArrayList<Interactable> interactables = new ArrayList<Interactable>(); 
static int SPACE = 0;
static int COLLIDE = 1;

void setup() {
  size(1500, 1000);
  PImage mapImg = loadImage("mapTest.png");
  createMap(mapImg);
  //printAr(map);
  
  // Calls tests
  // testing(); <--- this one is for dialogue
  Interactable bob = new Interactable(100,"bob",2,7);
  interactables.add(bob);
  
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
    // if the pixel is black, make it a wall
    if (pixel == -16777216) {
      map[i][j] = COLLIDE;
    // if the pixel is white, make it a space
    } else if (pixel == -1) {
      map[i][j] = SPACE;
    }
  } 
  }
}

void draw() {
  takeAction();
  background(color(0));
  //noStroke();
  drawMap();
  fill(105);
  circle(playerX, playerY, playerRadius);
  
  // player's coord marker
  /**fill(color(255,0,0));
  circle(playerX,playerY, 3);**/
  
  // draw a button for dialogue progression
  fill(color(155,155,155));
  // if mouse is over button, light up the button
  if (1050 < mouseX && mouseX < 1450 && 850 < mouseY && mouseY < 950) {
    fill(color(255));
  }
  rect(1050,850,400,100);
  
  // draws interactables
  fill(color(255,0,0));
  for (Interactable item : interactables) {
    //System.out.println(item.getXCor() + " " + item.getYCor());
    circle(item.getXCor()*gridSize+gridSize/2,item.getYCor()*gridSize+gridSize/2,playerRadius);
  }
    
  // Draws the dialogue to the box
  fill(color(255));
  textSize(25);
  text("it's me boy", 1050, 200);
  text("I'm the PS4", 1050, 250);
  text("speaking to you inside your brain", 1050, 300);
}

// called during draw() to call functions unrelated to drawing
void takeAction() {
  // pathfinding
  if (path.size() > 0) {
  playerX = path.get(path.size()-1)[0]*gridSize + gridSize/2;
  playerY = path.get(path.size()-1)[1]*gridSize + gridSize/2;
  //System.out.println(playerX + " " + playerY + " pathsize:" + path.size());
  path.remove(path.size()-1);
  }
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
