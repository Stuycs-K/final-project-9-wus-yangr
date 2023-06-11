public class Player {
  public int playerX = (int) 1;
  public int playerY = (int) 38;
  public int goalX;
  public int goalY;
  public int playerRadius = (int) (gridSize/2+1);

  //corresponding object ids will correspond to their respective id's in this inventory 
  public boolean[] inventory = new boolean[10];
  
  void draw() {
    fill(color(0,255,255));
    circle(playerX*gridSize+gridSize/2, playerY*gridSize+gridSize/2, playerRadius);
  }
}
