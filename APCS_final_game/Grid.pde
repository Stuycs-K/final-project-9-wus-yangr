class Grid {
  private Node[][] grid;

  private int rows = xWidth/gridSize;
  private int cols = yHeight/gridSize;

  public Grid(int[][] map) {
    this.grid = new Node[rows][cols];
    for (int i = 0; i<rows; i++) {
      for (int j = 0; j<cols; j++) {
        grid[i][j] = new Node(i, j, map[i][j]==COLLIDE);
      }
    }
  }
  
  public Node[][] getGrid() {
    return grid;
  }
  
  public Node getNode(int row, int col) {
    return this.grid[row][col];
  }
  
  public ArrayList<Node> getNeighbors(Node node) {
 //<>//
    int i = node.getX();
    int j = node.getY();
    ArrayList<Node> neighbors = new ArrayList<Node>();
    
    if (i < rows-1) {
      neighbors.add(grid[i+1][j]);
    }
    if (i > 0) {
      neighbors.add(grid[i-1][j]);
    }
    if (j < cols-1) {
      neighbors.add(grid[i][j+1]);
    }
    if (j > 0) {
      neighbors.add(grid[i][j-1]);
    }

    return neighbors;
  }
}
