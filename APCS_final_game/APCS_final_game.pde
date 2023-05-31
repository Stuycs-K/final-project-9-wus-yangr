import java.util.Scanner;

// width/gridSize *has* to equal map.length
// CURRENT MAP SIZE: 40x40
int xWidth = 800;
int yHeight = 800;
int gridSize = 20;
int[][] map = new int[xWidth/gridSize][yHeight/gridSize];
ArrayList<Interactable> interactables = new ArrayList<Interactable>();
static int SPACE = 0;
static int COLLIDE = 1;
DialogueNode recent; 
Interactable recentInteractable; 

void setup() {
  size(800, 800);
  PImage mapImg = loadImage("mapTest40x40.png");
  createMap(mapImg);
  //printAr(map);

  // testing(); <--- this one is for dialogue

  // Sets up NPCs
  Interactable doc = new Interactable(100, "Doc", 4, 33, color(255, 0, 0));
  interactables.add(doc);
  Interactable mech = new Interactable(101, "The Mechanic", 1, 12, color(0, 0, 255));
  interactables.add(mech);
  Interactable big = new Interactable(102, "Big Johnny", 18, 18, color(0, 255, 0));
  interactables.add(big);

  // Sets up Items
  Interactable ab = new Interactable(200, "Afterburner MN 100", 36, 28, color(155, 0, 0));
  interactables.add(ab);
  Interactable se = new Interactable(200, "Small Shield Extender", 5, 10, color(0, 0, 155));
  interactables.add(se);
  Interactable mp = new Interactable(200, "Metal Plates", 21, 17, color(0, 155, 0));
  interactables.add(mp);

  //sets all default values inventory to be false;
  for (int i = 0; i < inventory.length; i++) {
    inventory[i] = false;
  }

  //dialogue() test
  /*
  initializingTestBank();
  Interactable dialogueTester = new Interactable(100);
  //recentInteractables should be set in surroundingInteractables method 
  recentInteractable = dialogueTester; 
  dialogueTester.dialogue();
  */
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

/*goes w/ dialogue() method, basically dialogue runs, then the system waits for
input from player and once input is received, run another round of dialogue*/
void keyPressed() {
  if (waitingForInput) {
    if (key == '0') {
      option = 0;
      waitingForInput = false;
      recentInteractable.dialogue();
    }
    if (key == '1') {
      option = 1;
      waitingForInput = false;
      recentInteractable.dialogue();
    }
  }
}

// Creates a map of 1s and 0s from a black and white image
void createMap(PImage mapImg) {
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[0].length; j++) {
      int pixel = mapImg.get(i, j);
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

  // draws interactables
  for (Interactable item : interactables) {
    //System.out.println(item.getXCor() + " " + item.getYCor());
    fill(item.getColor());
    if (item.getID() < 200) {
      circle(item.getXCor()*gridSize+gridSize/2, item.getYCor()*gridSize+gridSize/2, playerRadius);
    } else if (item.getID() < 300) {
      square(item.getXCor()*gridSize+gridSize/4, item.getYCor()*gridSize+gridSize/4, gridSize/2);
    }
  }

  /** REMOVED FEATURE - for now
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
   **/
}

// called during draw() to call functions unrelated to drawing
void takeAction() {
  // pathfinding
  if (path.size() > 0) {
    playerX = path.get(path.size()-1)[0]*gridSize + gridSize/2;
    playerY = path.get(path.size()-1)[1]*gridSize + gridSize/2;
    //System.out.println(playerX + " " + playerY + " pathsize:" + path.size());
    path.remove(path.size()-1);
  } else {
    // Prints player coord to easily figure out where to place Interactables
    // System.out.println(playerX/gridSize + " " + playerY/gridSize);
  }
}

// Draws the map
void drawMap() {
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[0].length; j++) {
      if (map[i][j] == COLLIDE) {
        fill(color(0));
      } else {
        fill(color(255, 255, 255));
      }
      square(i*gridSize, j*gridSize, gridSize);
    }
  }
}
