int xWidth = 500;
int yHeight = 500;
int[][] map = new int[xWidth][yHeight];


void setup() {
  size(500, 500);

  
}

void draw() {
  background(105);
  color(55);
  move();
  circle(playerX, playerY, 50);
}
