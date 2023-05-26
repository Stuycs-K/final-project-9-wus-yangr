int START = -2;
int END = -3;
int CHECKED = -4;
int PATH = -5;
boolean found = false;
int[][] directions = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};
ArrayList<int[]> path = new ArrayList<int[]>();
int[][] mapClone = new int[map.length][map[0].length];

// BFS for now, to ensure that it works

// given an x and y, find the path from the player's grid to the x and y

ArrayList<int[]> findPath(int x, int y) {
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[0].length; j++) {
      mapClone[i][j] = map[i][j];
    }
  }
  System.out.println(x + " " + y);
  path.add(new int[] {playerX/gridSize, playerY/gridSize});
  mapClone[path.get(0)[0]][path.get(0)[1]] = START;
  mapClone[x][y] = END;
  //printAr(mapClone);
  solve(path.get(0)[0], path.get(0)[1], 0, mapClone);
  //printAr(mapClone);
  path.remove(0);
  return path;
}

int solve(int row, int col, int count, int[][] maze) {
    if(maze[row][col] == END){
      path.add(new int[] {row,col});
      return count;
    }
    else if(maze[row][col] ==  1 || maze[row][col] == PATH || maze[row][col] == CHECKED){
      return -1;
    }
    else{
      maze[row][col] = PATH;
      for(int i = 0; i < 4; i++){
        int stored = solve(row + directions[i][0], col + directions[i][1], count + 1, maze);
        if(stored != -1){
          path.add(new int[] {row,col});
          return stored;
        }
      }
      maze[row][col] = CHECKED;
      return -1;
    }
}
