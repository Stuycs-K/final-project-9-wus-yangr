// given an x and y, find the path from the player's grid to the x and y
ArrayList<int[]> findPath(int x, int y) {
  ArrayList<int[]> listOfCoords = new ArrayList<int[]>();
  listOfCoords.add(new int[] {playerX/gridSize,playerY/gridSize});
  //System.out.println(x + " " + y);
  solve(listOfCoords, x,y);
  return listOfCoords;
}

void solve(ArrayList<int[]> list, int x, int y) {
  int START = -2;
  int END = -3;
  int[][] directions = {{0,1},{0,-1},{1,0},{-1,0}};
  ArrayList<int[]> path = new ArrayList<int[]>();
  int[][] mapClone = map.clone();
  path.add(list.get(0));
  mapClone[path.get(0)[0]][path.get(0)[1]] = START;
  mapClone[x][y] = END;
  while (path.size() > 0) {
    for (int i = 0; i < 4; i++) {
    }
    path.remove(0);
  }
}
