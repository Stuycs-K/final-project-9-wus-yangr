int INTERACTABLE = 2;
boolean waitingForInput = false;
int playerTurn = 0;
int option = 0;
boolean possessItems = false;

public class Interactable extends Collidable {
  String name;
  color intColor;
  boolean firstInteraction = true;

  // id > 200 is an Item (square symbol) and id > 100 is an NPC (circle symbol)
  public Interactable(int id, String name, int xCor, int yCor, color intColor) {
    super(id, xCor, yCor);
    this.name = name;
    this.intColor = intColor;
    mapGame.addInteractable(xCor, yCor);
  }

  public color getColor() {
    return intColor;
  }

  void draw() {
    fill(getColor());
    if (getID() < 200) {
      circle(getXCor()*gridSize+gridSize/2, getYCor()*gridSize+gridSize/2, protag.playerRadius);
    } else if (getID() < 300) {
      square(getXCor()*gridSize+gridSize/4, getYCor()*gridSize+gridSize/4, gridSize/2);
    }
  }

  // checks if player is in range and wants to interact with the NPC
  // takes int x and y as coordinates, called on mousePressed
  public boolean checkInteract(int x, int y) {
    // checks if player is within 2 blocks and if mouse is in the NPC's block
    if (sqrt(pow(abs(protag.playerX-xCor), 2)+pow(abs(protag.playerY-yCor), 2)) <= 1.5
      && x == xCor && y == yCor) {
      if (id < 200) {
        System.out.println("\n[You are now speaking with " + name + "]");
      } else {
        if (id < 203 && protag.inventory[id % 100]) {
          System.out.println("\n[You are now looking at spot where you found the " + name + "]");
        }
        else{
          System.out.println("\n[You are now looking at " + name + "]");
        }
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
    possessItems = (protag.inventory[0] && protag.inventory[1] && protag.inventory[2]);
    //if its the firstInteraction w/ the npc, you initialize the dialogueNode recent as the corresponding starting dialogueNode
    if (firstInteraction) {
      recent = dialogueBank[getID()%100];
    }
    //gets corresponding dialogueBank index based on objectID since interactables start from 100
    if (recent.hasChild()) {
      //if player turn, wait for input
      if (playerTurn == 1) {
        if (option < recent.children.size()) {
          //if the ship dialogue is being run, this is run instead as the inventory needs to be checked and dialogue outcomes will be based on that
          if (getID() == 203 && option == 0) {
            if (!possessItems) {
              recent = recent.getChild(option).getChild(1);
            } else {
              recent = recent.getChild(option).getChild(0);
              repaired = true;
            }
          } 
          //this is run instead if it is any other dialogue tree other than ship 
          else {
            recent = recent.getChild(option).getChild(0);
          }
          playerTurn++;
          playerTurn %= 2;
        } 
      }
      if (playerTurn == 0) {
        //if not player turn, print the current, set it to player turn & set waitingForInput to T
        System.out.println(recent.text());
        //sets the corresponding index in inventory to true if the "Inventory" tag appears in the dialogue tree (only for items) 
        if (getID() >= 200) {
          if (recent.getString().equals("Inventory")) {
            protag.inventory[getID() - 200] = true;
          }
        }
        try {
          if (recent.getString().equals("end")) {
            firstInteraction=true;
          }

          recent.changeTag();
        }
        catch (Exception e) {
        }
        //if there is still a child, continue the process 
        if (recent.hasChild()) {
          for (DialogueNode child : recent.getChildren()) {
            System.out.println(child.text());
          }
          playerTurn++;
          playerTurn %= 2;
          waitingForInput = true;
          firstInteraction = false;
        }
      }
    }
  }
}
