public int playerX = xWidth/2;
public int playerY = yHeight/2;
public int clickX = playerX;
public int clickY = playerY;

//COMMENT OUT POINT AND CLICK WHEN DOING WASD OR IT WONT WORK

//temporary WASD movement
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

}

// point-and-click pathfinding: greedy, there shouldn't be any locations on the map where A* would be necessary
public void mousePressed() {
  clickX = mouseX;
  clickY = mouseY;
}

// temporary basic point-and-click movement, doesn't take objects into mind
public void move() {
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
}
