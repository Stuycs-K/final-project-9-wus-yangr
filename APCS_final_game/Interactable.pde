int INTERACTABLE = 2;

/** 
TODO:
create NPC and Item classes that inherit from this: 
NPCs have Portraits pngs that appear in the dialogue box and appear as circles on the map
Items do not have Portrait pngs and appear as squares on the map
Create draw functions within Interactable/NPC/Item so they don't clog up the main file's draw function
**/

public class Interactable extends Collidable {
  int id;
  String name;
  int xCor;
  int yCor;
  color intColor;
  
  public Interactable(int id) {
    super(id);
  }
  
  // change of plans: id > 200 is an Item (square symbol) and id > 100 is an NPC (circle symbol)
  public Interactable(int id, String name, int xCor, int yCor, color intColor) {
    super(id);
    this.name = name;
    this.xCor = xCor;
    this.yCor = yCor;
    this.intColor = intColor;
    map[xCor][yCor] = INTERACTABLE;
  }
  
  public int getId() {
    return id;
  }
  
  public int getXCor() {
    return xCor;
  }
  
  public int getYCor() {
    return yCor;
  }
  
  public color getColor() {
    return intColor;
  }
  
  // checks if player is in range and wants to interact with the NPC
  // takes int x and y as coordinates, called on mousePressed
  public boolean checkInteract(int x, int y) {
    // checks if player is within 2 blocks and if mouse is in the NPC's block
    if (sqrt(pow(abs(playerX/gridSize-xCor),2)+pow(abs(playerY/gridSize-yCor),2)) <= 2
    && x == xCor && y == yCor) {
      System.out.println(name + " says hi");
      return true;
    }
    return false;
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
          waitingForInput = false; 
        }
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
        waitingForInput = true; 
      }
    }
  }
}
