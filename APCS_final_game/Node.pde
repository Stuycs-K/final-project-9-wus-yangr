class Node {
  private int x;
  private int y;
  private int fromStart;
  private int toEnd;
  private int both;
  
  private Node previous;
  private boolean isCollidable = false;
  
  public Node (int x, int y, boolean isCollidable) {
    this.x = x;
    this.y = y;
    this.isCollidable = isCollidable;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getFromStart() {
    return fromStart;
  }
  
  public void setFromStart(int i) {
    fromStart = i;
  }
  
  public int getToEnd() {
   return toEnd; 
  }
  
  public void setToEnd(int i) {
    toEnd = i;
  }
  
  public int getBoth() {
    return both;
  }
  
  public void setBoth(int i) {
    both = i;
  }
  
  public void setPrevious(Node i) {
    previous = i;
  }
  
  public boolean isCollidable() {
   return isCollidable; 
  }
  
  public boolean equals(Node other) {
    return this.getX() == other.getX() && this.getY() == other.getY();

  }
}
