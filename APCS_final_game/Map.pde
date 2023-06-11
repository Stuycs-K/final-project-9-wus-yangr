//comment this out when testing bcuz this isn't going to compile w/o finishing the other stuff
/*public class map {
 int[][] map = new int[][];
 int playerX = 51;
 int playerY = 51;
 //starting coords are 51, 51 > places it in map[1][1] essentialy
 
 public void drawTile(int x, int y) {
 if (map[y][x].getID == 0) {
 fill(#FFFFFF);
 square(x * 50, y * 50, 50);
 }
 if (map[y][x].getID == 1) {
 fill(#000000);
 square(x * 50, y * 50, 50);
 }
 }
 
 public void drawSurrounding() {
 //9x9 visible area
 for (int i = -4; i < 5; i++) {
 for (int p = -4; p < 5; p++) {
 Int x = playerX - p
 Int y = playerY - i;
 //checks to see if displaced coordinates are within bounds
 if ((x >= 0 && x < map[1].length) && (y >= 0 && y < map.length)) {
 drawTile(x, y);
 }
 }
 }
 fill(#FAFF00); //yellow
 square(playerX, playerY, 50); //draws 50x50 square of yellow for player
 }
 
 public void surroundingInteractable() {
 //precondition that player is not at very edge of map - ex 0,0
 Int[][] coordShift = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}, {-1, -1}, {-1, 1}, {1, -1}, {1, 1}};
 for (int i = 0; i < coordShift.length; i++) {
 //searches surrounding 8 tiles for interactables and if found run below code
 //coordinate of interactable
 map[y][x].dialogue();
 }
 }
 }
 **/

static final int SPACE = 0;
static final int COLLIDE = 1;
static final int START = -2;
static final int END = -3;
static final int CHECKED = -4;
static final int PATH = -5;

public class Map {
  int[][] map = new int[xWidth/gridSize][yHeight/gridSize];

  Map() {
    // Creates a map of 1s and 0s from a black and white image
    PImage mapImg = loadImage("mapTest40x40.png");
    mapGraphics = loadImage("mapGraphicFinal.png");
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

  void drawMap(PImage mapImage) {
    image(mapImage, 0, 0);
  }

  boolean isInteractable() {
    return map[mouseX/gridSize][mouseY/gridSize] == INTERACTABLE;
  }

  boolean isMouseLegal() {
    return mouseX < xWidth && mouseY < yHeight && map[mouseX/gridSize][mouseY/gridSize] != COLLIDE;
  }

  void addInteractable(int x, int y) {
    map[x][y] = INTERACTABLE;
  }

  int[][] clone() {
    int[][] mapClone = new int[map.length][map[0].length];
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map[0].length; j++) {
        mapClone[i][j] = map[i][j];
      }
    }
    return mapClone;
  }
}
