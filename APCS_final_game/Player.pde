public int playerX = 500;
public int playerY = 500;

int[][] map = new int[1000][1000];

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

// point-and-click pathfinding: greedy
public void mousePressed() {
  while (playerX != mouseX && playerY != mouseY) {
    
  }
}
