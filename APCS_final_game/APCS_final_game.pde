import java.util.Scanner;

// width/gridSize *has* to equal map.length
// CURRENT MAP SIZE: 40x40
int xWidth = 800;
int yHeight = 800;
int gridSize = 20;

ArrayList<Interactable> interactables = new ArrayList<Interactable>();
DialogueNode recent;
Interactable recentInteractable;

Player protag = new Player();
PImage mapGraphics;
Map mapGame;
Pathfinding pathfinder;

boolean repaired = false;

ArrayList<Node> tempPath = new ArrayList<Node>();

void setup() {
  size(800, 800);
  mapGame = new Map();
  pathfinder = new Pathfinding();

  // Sets up NPCs
  Interactable doc = new Interactable(100, "Doc", 4, 33, color(255, 0, 0));
  interactables.add(doc);
  Interactable mech = new Interactable(101, "The Mechanic", 1, 12, color(0, 0, 255));
  interactables.add(mech);
  Interactable big = new Interactable(102, "Big Johnny", 18, 18, color(0, 255, 0));
  interactables.add(big);

  // Sets up Items
  Interactable ab = new Interactable(200, "Afterburner MN 100", 36, 28, color(155, 0, 0));
  interactables.add(ab);
  Interactable se = new Interactable(201, "Small Shield Extender", 5, 10, color(0, 0, 155));
  interactables.add(se);
  Interactable mp = new Interactable(202, "Metal Plates", 21, 17, color(0, 155, 0));
  interactables.add(mp);
  Interactable ship = new Interactable(203, "Your Ship", 14, 38, color(0, 105, 105));
  interactables.add(ship);

  //sets all default values inventory to be false;
  for (int i = 0; i < protag.inventory.length; i++) {
    protag.inventory[i] = false;
  }
}

// Prints a 2d array
void printAr(int[][] arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr[0].length; j++) {
      System.out.print(arr[i][j]);
    }
    System.out.println();
  }
}

/*goes w/ dialogue() method, basically dialogue runs, then the system waits for
 input from player and once input is received, run another round of dialogue*/
void keyPressed() {
  if (waitingForInput) {
    if (((int) key)-48 < recent.children.size()) {
      option = ((int) key)-48; //ASCII for numbered keys starts at '0' = 48
      waitingForInput = false;
      recentInteractable.dialogue();
    }
  } else if (key == 'i') {
    System.out.println("Player Inventory : ");
    if (protag.inventory[0]) {
      System.out.println(" - Afterburner MN 100 (Main Quest Item)");
    }
    if (protag.inventory[1]) {
      System.out.println(" - Small Shield Extender (Main Quest Item)");
    }
    if (protag.inventory[2]) {
      System.out.println(" - Metal Plates (Main Quest Item)");
    }
  }
}

void draw() {
  takeAction();
  background(color(0));
  //noStroke();
  //drawMap();
  mapGame.drawMap(mapGraphics);
  protag.draw();

  // draws interactables
  for (Interactable item : interactables) {
    //System.out.println(item.getXCor() + " " + item.getYCor());
    item.draw();
  }
}

// point-and-click pathfinding: greedy, there shouldn't be any locations on the map where A* would be necessary
public void mousePressed() {
  // mouse must be within bounds
  if (mapGame.isMouseLegal()) {
    if (!mapGame.isInteractable()) {
      // resets path if player cancels
      pathfinder.path = new ArrayList<int[]>();
      protag.goalX = mouseX/gridSize;
      protag.goalY = mouseY/gridSize;
      //pathfinder.findPath(mouseX/gridSize, mouseY/gridSize);
      AstarPathfinding newPathfinder = new AstarPathfinding();
      Grid mapGrid = new Grid(mapGame.map);
      tempPath = newPathfinder.find(mapGrid, new Node(protag.playerX, protag.playerY, false), new Node(mouseX/gridSize, mouseY/gridSize, false));
      for (Node item : tempPath) {
        pathfinder.path.add(new int[] {item.getX(), item.getY()});
      }
    }
    for (Interactable item : interactables) {
      item.checkInteract(mouseX/gridSize, mouseY/gridSize);
    }
  }
}

// called during draw() to call functions unrelated to drawing
void takeAction() {
  // pathfinding
  if (pathfinder.path.size() > 0) {
    protag.playerX = pathfinder.path.get(pathfinder.path.size()-1)[0];
    protag.playerY = pathfinder.path.get(pathfinder.path.size()-1)[1];
    //System.out.println(playerX + " " + playerY + " pathsize:" + path.size());
    pathfinder.path.remove(pathfinder.path.size()-1);
  } else {
    // Prints player coord to easily figure out where to place Interactables
    // System.out.println(playerX/gridSize + " " + playerY/gridSize);
  }
}
