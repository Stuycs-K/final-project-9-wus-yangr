int START = -2;
int END = -3;
int CHECKED = -4;
int PATH = -5;
boolean found = false;
int[][] directions = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};
ArrayList<int[]> path = new ArrayList<int[]>();
int[][] mapClone;

// given an x and y, find the path from the player's grid to the x and y
ArrayList<int[]> findPath(int x, int y) {
  mapClone = mapGame.clone();
  //System.out.println(x + " " + y);
  path.add(new int[] {protag.playerX, protag.playerY});
  mapClone[path.get(0)[0]][path.get(0)[1]] = START;
  mapClone[x][y] = END;
  //printAr(mapClone);
  solve(path.get(0)[0], path.get(0)[1], 0, mapClone);
  //printAr(mapClone);
  path.remove(0);
  return path;
}

  public int distToGoal(int row, int col) {
    return Math.abs(row - protag.goalX) + Math.abs(col - protag.goalY);
  }

// HEAP
int solve(int row, int col, int count, int[][] maze) {
  if (maze[row][col] == END) {
    path.add(new int[] {row, col});
    return count;
  } else if (maze[row][col] ==  1 || maze[row][col] == PATH || maze[row][col] == CHECKED) {
    return -1;
  } else {
    maze[row][col] = PATH;
    int[][] distances = new int[4][2];
    int[][] dirDist = new int[4][2];
    for (int i = 0; i < 4; i++) {
      distances[i][0] = distToGoal(row + directions[i][0],col + directions[i][1]);
      distances[i][1] = i;
    } 
    for (int i = 0; i < 4; i++) {
      for (int j = i; j < 4; j++) {
        if (distances[i][0] > distances[j][0]) {
          int[] temp = distances[i];
          distances[i] = distances[j];
          distances[j] = temp;
        }
      }
    }
    for (int i = 0; i < 4; i++) {
      dirDist[i]=new int[] {directions[distances[i][1]][0],directions[distances[i][1]][1]};
    }
    for (int i = 0; i < 4; i++) {
      int stored = solve(row + dirDist[i][0], col + dirDist[i][1], count + 1, maze);
      if (stored != -1) {
        path.add(new int[] {row, col});
        return stored;
      }
    }
    maze[row][col] = CHECKED;
    return -1;
  }
}
