public class Location implements Comparable{
  private int row,col;
  private float dist;
  
  public int compareTo(Object other){
    if (this.dist > ((Location) other).dist) {
      return(1);
    } else {
      return(-1);
    }
  }
  
  public Location(int r, int c, float d){
   row =r;
   col =c;
   dist = d;
  }

  public Location(int r, int c){
   row =r;
   col =c;
   dist = -1.0;
 }
}
