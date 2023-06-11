public class Collidable {
  protected int id;
  int xCor;
  int yCor;

  public Collidable(int id, int xCor, int yCor) {
    this.id = id;  
    this.xCor = xCor;
    this.yCor = yCor;
  }

  public int getXCor() {
    return xCor;
  }

  public int getYCor() {
    return yCor;
  }

  public int getID() {
    return id;
  }
}
