public class Interactable extends Collidable {
  int id;
  String name;
  int xCor;
  int yCor;
  
  public Interactable(int id) {
    super(id);
  }
  
  public Interactable(int id, String name, int xCor, int yCor) {
    super(id);
    this.name = name;
    this.xCor = xCor;
    this.yCor = yCor;
  }
  
  public int getXCor() {
    return xCor;
  }
  
  public int getYCor() {
    return yCor;
  }

  public void dialogue() {
    int playerTurn = 0;
    boolean waitingForInput = false;
    //gets corresponding dialogueBank index based on objectID since interactables start from 101
    DialogueNode current = dialogueBank[getID() - 101];
    while (current.hasChild()) {
      //if player turn, wait for input
      if (playerTurn == 1) {
        //Print once then wait for player input
        if (waitingForInput) {
          System.out.println(current.getChild(0).text());
          System.out.println(current.getChild(1).text());
        }
        waitingForInput = true;
        //advance to option 1
        if (key == '0') {
          current = current.getChild(0).getChild(0);
          playerTurn++;
          playerTurn %= 2;
        }
        //advance to option 2
        if (key == '1') {
          current = current.getChild(1).getChild(0);
          playerTurn++;
          playerTurn %= 2;
        }
      }
      //if not player turn, print the current
      else {
        System.out.println(current.text());
        playerTurn++;
        playerTurn %= 2;
      }
    }
  }
}
