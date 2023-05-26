int START = -2;
int END = -3;
boolean found;
int[][] directions = {{0,1},{0,-1},{1,0},{-1,0}};
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
  ArrayList<int[]> listOfCoords = new ArrayList<int[]>();
  listOfCoords.add(new int[] {playerX/gridSize,playerY/gridSize});
  //System.out.println(x + " " + y);
  path.add(listOfCoords.get(0));
  solve(x,y);
  return listOfCoords;
}

void solve(int x, int y) {
  mapClone[path.get(0)[0]][path.get(0)[1]] = START;
  mapClone[x][y] = END;
  expand(x,y);
}

boolean expand(int x, int y) {
  //printAr(mapClone);
  path.add(new int[] {x,y});
  if (mapClone[x][y] == END) {
    return true;
  }
  else if (mapClone[x][y] == 0) {
  for (int i = 0; i < 4; i++) {
        mapClone[x][y] = 2;
        if (expand(x+directions[i][0],y+directions[i][1])) {
          System.out.println("WHEE");
          return true;
        }
      }
  }
  path.remove(path.size()-1);
  return false;
}
