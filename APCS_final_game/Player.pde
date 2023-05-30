public int playerX = (int) 1*gridSize+gridSize/2;
public int playerY = (int) 38*gridSize+gridSize/2;
public int playerRadius = (int) (gridSize/2+1);

//corresponding object ids will correspond to their respective id's in this inventory 
public boolean[] inventory = new boolean[10];

// point-and-click pathfinding: greedy, there shouldn't be any locations on the map where A* would be necessary
public void mousePressed() {
  // mouse must be within bounds
  if (mouseX < xWidth && mouseY < yHeight && map[mouseX/gridSize][mouseY/gridSize] != COLLIDE) {
    if (map[mouseX/gridSize][mouseY/gridSize] != INTERACTABLE) {
      // resets path if player cancels
      path = new ArrayList<int[]>();
      findPath(mouseX/gridSize,mouseY/gridSize);
    }
    for (Interactable item : interactables) {
      item.checkInteract(mouseX/gridSize,mouseY/gridSize);
    }
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
