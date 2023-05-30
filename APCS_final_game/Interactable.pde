int INTERACTABLE = 2;
boolean waitingForInput = false;
int playerTurn = 0;
int option = 0;

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
  boolean firstInteraction = true; 

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
    if (sqrt(pow(abs(playerX/gridSize-xCor), 2)+pow(abs(playerY/gridSize-yCor), 2)) <= 1.5
      && x == xCor && y == yCor) {
      System.out.println(name + " says hi");
      return true;
    }
    return false;
  }

//recentInteractables has to be set to this interactable for this to run properly 
  public void dialogue() {
    if(firstInteraction){
      DialogueNode current = dialogueBank[getID() - 100];
      recent = current; 
    }
    //gets corresponding dialogueBank index based on objectID since interactables start from 100
    if (recent.hasChild()) {
      //if player turn, wait for input
      if (playerTurn == 1) {
        //advance to option 1
        if (option == 0) {
          //advances twice due to our double node structure where theres the npc then player dialogue
          //System.out.println("0 pressed");
          recent = recent.getChild(0).getChild(0);
        }
        //advance to option 2
        if (option == 1) {
          //System.out.println("1 pressed");
          recent = recent.getChild(1).getChild(0);
        }
        playerTurn++;
        playerTurn %= 2;
        //System.out.println(playerTurn);
        /*if(recent.hasChild()){
          
        }*/
      }
      if(playerTurn == 0){
        //if not player turn, print the current, set it to player turn & set waitingForInput to T
        System.out.println(recent.text());
        if(recent.hasChild()){
        System.out.println(recent.getChild(0).text());
        System.out.println(recent.getChild(1).text());
        playerTurn++;
        playerTurn %= 2;
        //System.out.println(playerTurn);
        waitingForInput = true;
        }
      }
    }
  }
}
