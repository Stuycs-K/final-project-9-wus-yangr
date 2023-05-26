public int playerX = 500;
public int playerY = 600;
public int playerRadius = 25;

//corresponding object ids will correspond to their respective id's in this inventory 
public boolean[] inventory = new boolean[10];

// point-and-click pathfinding: greedy, there shouldn't be any locations on the map where A* would be necessary
public void mousePressed() {
  // mouse must be within bounds
  if (mouseX < xWidth && mouseY < yHeight && map[mouseX/gridSize][mouseY/gridSize] != COLLIDE) {
    findPath(mouseX/gridSize,mouseY/gridSize);
    //playerX = path.get(path.size()-1)[0]*gridSize + gridSize/2;
    //playerY = path.get(path.size()-1)[1]*gridSize + gridSize/2;
    //System.out.println(playerX + " " + playerY);
  }
}

// checks what quadrant player is in
public boolean touchingObject() {
  if (map[playerX/gridSize][playerY/gridSize] == 0) {
    return false;
  }
  return true;
}
