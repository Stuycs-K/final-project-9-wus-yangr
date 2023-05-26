//we're going to add the beginning dialogue for each object to this array
DialogueNode[] dialogueBank = new DialogueNode[10];

void testing() {
  // dialogue examples
  DialogueNode test1 = new DialogueNode("test1", "What's your favorite animal?");
  DialogueNode test2 = new DialogueNode("test2", "0: Dog.");
  DialogueNode test3 = new DialogueNode("test3", "1: Cat.");
  DialogueNode dog1 = new DialogueNode("dog1", "Woof!");
  DialogueNode cat1 = new DialogueNode("cat1", "Meow!");
  test1.addChild(test2);
  test1.addChild(test3);
  test2.addChild(dog1);
  test3.addChild(cat1);
  
  // Asks if the player wants to select 1 or 2
  System.out.println(test1.text());
  for (int i = 0; i < test1.children.size(); i++) {
    System.out.println(test1.getChild(i).text());
  }
  
  // change this variable to switch options. Haven't implemented player input.
  int CHANGE_ME = 0;
  
  System.out.println(test1.getChild(CHANGE_ME).getChild(0).text());
}

void initializingBank(){
 DialogueNode oID1 = new DialogueNode("[0][0]", "Choose. Yes or No.");
 DialogueNode oID1a = new DialogueNode("[0][1]", "0 - Yes.");
 DialogueNode oID1b = new DialogueNode("[0][2]", "1 - No.");
 DialogueNode oID1a1 = new DialogueNode("[0][3]", "Die.");
 DialogueNode oID1b1 = new DialogueNode("[0][5]", "Ok."); 
 /*
 dialogueBank[0][0] = objectID1; 
 dialogueBank[0][1] = objectID1a;
 dialogueBank[0][2] = objectID1b;
 dialogueBank[0][3] = objectID1a1;
 dialogueBank[0][5] = objectID1b1;
 */
 dialogueBank[0] = oID1;
 oID1.addChild(oID1a);
 oID1.addChild(oID1b);
 oID1a.addChild(oID1a1);
 oID1b.addChild(oID1b1);
}
