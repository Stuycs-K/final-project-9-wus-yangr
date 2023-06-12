class AstarPathfinding { //<>// //<>// //<>//
  private int distance(Node a, Node b) {
    return abs(a.getX() - b.getX()) + abs(a.getY() - b.getY());
  }

  public ArrayList<Node> find(Grid grid, Node start, Node end) {
    ArrayList<Node> exploring = new ArrayList<Node>();
    ArrayList<Node> explored = new ArrayList<Node>();
    exploring.add(start);

    boolean done = false;
    while (!done) {
      if (exploring.size() > 0) {

        int winner = 0;
        for (int i = 0; i < exploring.size(); i++) {
          if (exploring.get(i).getBoth() < exploring.get(winner).getBoth()) {
            winner = i;
          }
        }
        Node current = exploring.get(winner);

        if (current.equals(end)) { //<>//
          ArrayList<Node> path = new ArrayList<Node>();
          Node temp = current;
          path.add(temp);
          while (temp.previous != null) {
            path.add(temp.previous);
            temp = temp.previous;
          }
          done = true;
          return path;
        }

        exploring.remove(current);
        explored.add(current);

        for (Node neighbor : grid.getNeighbors(current)) {
          if (!explored.contains(neighbor) && !neighbor.isCollidable()) {
            int tempFromStart = current.getFromStart() + 1;
            boolean newPath = false; //<>//

            if (exploring.contains(neighbor)) {
              if (tempFromStart < neighbor.getFromStart()) {
                neighbor.setFromStart(tempFromStart);
                newPath = true;
              }
            } else {
              neighbor.setFromStart(tempFromStart);
              newPath = true;
              exploring.add(neighbor);
            } //<>//
            if (newPath) {
              neighbor.setToEnd(distance(neighbor, end));
              neighbor.setBoth(neighbor.getFromStart() + neighbor.getToEnd());
              neighbor.setPrevious(current);
            }
          }
        }
      }
    }
    return null;
  }
}
