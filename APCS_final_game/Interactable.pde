public class Interactable extends Collidable {
  public Interactable(int id) {
    super(id);
  }

  public void dialogue() {
    int playerTurn = 0;
    DialogueNode current = dialogueBank[getID() - 101];
    while (current.hasChild()) {
      if (playerTurn == 1) {
        System.out.println(current.getChild(0).text());
        System.out.println(current.getChild(1).text());
        if (key == '0') {
          current = current.getChild(0);
        }
        if (key == '1') {
          current = current.getChild(1);
        }
      }
      else{
        System.out.println(current.text());
        playerTurn++; 
        playerTurn %= 2; 
      }
    }
  }
}
