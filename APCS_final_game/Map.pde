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
*/
