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
    this.id = id;
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
    if (id < 200) {
      System.out.println("\n[You are now speaking with " + name + "]");
    } else {
      System.out.println("\n[You are now looking at " + name + "]");    
      }

      // sets up dialogue
      if (name == "Doc") {
        docBank();
      } else if (name == "The Mechanic") {
        mechBank();
      } else if (name == "Big Johnny") {
        johnBank();
      } else if (name == "Afterburner MN 100") {
        burnerBank();
      } else if (name == "Small Shield Extender") {
        shieldBank();
      } else if (name == "Metal Plates") {
        plateBank();
      } else if (name == "Your Ship") {
        shipBank();
      } else {
        // DOES NOT WORK - Null Pointer Exception when called on an NPC other than Doc
        initializingTestBank();
      }

      recentInteractable = this;
      this.dialogue();

      //System.out.println("[You are no longer speaking with " + name + "]");

      return true;
    }
    return false;
  }

  //recentInteractables has to be set to this interactable for this to run properly
  public void dialogue() {
    //if its the firstInteraction w/ the npc, you initialize the dialogueNode recent as the corresponding starting dialogueNode
    if (firstInteraction) {
        recent = dialogueBank[getID()%100];
    }
    //gets corresponding dialogueBank index based on objectID since interactables start from 100
    if (recent.hasChild()) {
      //if player turn, wait for input
      if (playerTurn == 1) {
        recent = recent.getChild(option).getChild(0);
        playerTurn++;
        playerTurn %= 2;
      }
      if (playerTurn == 0) {
        //if not player turn, print the current, set it to player turn & set waitingForInput to T
        System.out.println(recent.text());
        if(getID() >= 200){
          if(recent.getString().equals("Inventory")){
            inventory[getID() - 200] = true; 
          }
        }
        try {
        if(recent.getString().equals("end")){
          firstInteraction=true;
        }
        
        recent.changeTag();
    } catch (Exception e) {}
        if (recent.hasChild()) {
          for (DialogueNode child : recent.getChildren()) {
            System.out.println(child.text());
          }
          playerTurn++;
          playerTurn %= 2;
          waitingForInput = true;
          firstInteraction = false;
        }
        /** might be needed later if we talk to the npc multiple times
         else{
         firstInteraction = true; **/
      }
    }
  }
}
