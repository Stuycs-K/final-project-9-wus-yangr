public int playerX = 500;
public int playerY = 600;
public int clickX = playerX;
public int clickY = playerY;
public int playerRadius = 25;

//corresponding object ids will correspond to their respective id's in this inventory 
public boolean[] inventory = new boolean[10];

//COMMENT OUT POINT AND CLICK WHEN DOING WASD OR IT WONT WORK

//temporary WASD movement
/**
public void keyPressed() {
    if(key == 'w'){
      if(playerY > 0){
        playerY -= 20; 
      }
    }
    if(key == 'a'){
      if(playerX > 0){
        playerX -= 20; 
      }
    }
    if(key == 's'){
      if(playerY < map.length - 1){
        playerY += 20; 
      }
    }
    if(key == 'd'){
      if(playerX < map[1].length - 1){
        playerX += 20; 
      }
    }

} **/

// point-and-click pathfinding: greedy, there shouldn't be any locations on the map where A* would be necessary
public void mousePressed() {
  // mouse must be within bounds
  if (mouseX < xWidth && mouseY < yHeight) {
  clickX = mouseX;
  clickY = mouseY;
  }
}

// checks what quadrant player is in
public boolean touchingObject() {
  if (map[playerX/gridSize][playerY/gridSize] == 0) {
    return false;
  }
  return true;
}

// temporary basic point-and-click movement, doesn't take objects into mind
public void move() {
  // if player is not touching a black spot
  if (!touchingObject()) {
  if (playerX != clickX) {
    int oldCoorX = playerX;
    playerX++;
    if (abs(oldCoorX-clickX) < abs(playerX-clickX)) {
      playerX-=2;
    }
  }
  if (playerY != clickY) {
    int oldCoorY = playerY;
    playerY++;
    if (abs(oldCoorY-clickY) < abs(playerY-clickY)) {
      playerY-=2;
    }
  }
  } else {
  }
}
