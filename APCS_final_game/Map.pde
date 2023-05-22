public class map{
  int[][] map = new int[][];
  int playerX = 50; 
  int playerY = 50; 
  
  public void drawTile(int x, int y){
   if(map[y][x].getID == 0){
     fill(#FFFFFF); 
     square(x * 50, y * 50, 50); 
   }
   if(map[y][x].getID == 1){
     fill(#000000);
     square(x * 50, y * 50, 50); 
   }
  }
  
  public void drawSurrounding(){
    for(int i = -8; i < 8; i++){
    for(int p = -8; p < 8; p++){
      Int x = playerX - p 
      Int y = playerY - i; 
      //checks to see if displaced coordinates are within bounds 
      if((x >= 0 && x < map[1].length) && (y >= 0 && y < map.length)){
        drawTile(x, y); 
      }
    }
  }
  fill(#FAFF00); //yellow
  square(playerX, playerY, 50); //draws 50x50 square of yellow for player

  }
}
