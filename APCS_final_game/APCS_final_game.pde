int xWidth = 1000;
int yHeight = 1000;
int gridSize = 50;
int[][] map = new int[xWidth/gridSize][yHeight/gridSize];
static int SPACE = 0;
static int COLLIDE = 1;

void setup() {
  size(1000, 1000);
  PImage mapImg = loadImage("mapTest.png");
  createMap(mapImg);
  //printAr(map);
  
    
  // dialogue examples
  DialogueNode test1 = new DialogueNode("test1", "What's your favorite animal?");
  DialogueNode test2 = new DialogueNode("test2", "Dog.");
  DialogueNode test3 = new DialogueNode("test3", "Cat.");
  DialogueNode dog1 = new DialogueNode("dog1", "Woof!");
  DialogueNode cat1 = new DialogueNode("test3", "Meow!");
  test1.addChild(test2);
  test1.addChild(test3);
  test2.addChild(dog1);
  test3.addChild(cat1);
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
  noStroke();
  drawMap();
  fill(105);
  move();
  circle(playerX, playerY, 50);
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
