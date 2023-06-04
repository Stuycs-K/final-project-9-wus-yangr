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

//for testing dialogue() but format can be used for the actual initialization of the bank
void initializingTestBank(){
 DialogueNode oID1 = new DialogueNode("[0][0]", "Choose. Yes or No.");
 DialogueNode oID1a = new DialogueNode("[0][1]", "0 - Yes.");
 DialogueNode oID1b = new DialogueNode("[0][2]", "1 - No.");
 DialogueNode oID1a1 = new DialogueNode("[0][3]", "Die.");
 DialogueNode oID1b1 = new DialogueNode("[0][5]", "Ok."); 
 DialogueNode oID1a1a = new DialogueNode("na", "0 - Die Option 1"); 
 DialogueNode oID1a1b = new DialogueNode("na", "1 - Die Option 2"); 
 DialogueNode oID1b1a = new DialogueNode("na", "0 - Ok Option 1"); 
 DialogueNode oID1b1b = new DialogueNode("na", "1 - Ok Option 2"); 
 DialogueNode oID1a1a1 = new DialogueNode("na", "Die Option 1 End"); 
 DialogueNode oID1a1a2 = new DialogueNode("na", "Die Option 2 End"); 
 DialogueNode oID1b1a1 = new DialogueNode("na", "Ok Option 1 End"); 
 DialogueNode oID1b1a2 = new DialogueNode("na", "Ok Option 2 End"); 

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
 oID1a1.addChild(oID1a1a);
 oID1a1.addChild(oID1a1b);
 oID1a1a.addChild(oID1a1a1);
 oID1a1b.addChild(oID1a1a2);
 oID1b1.addChild(oID1b1a);
 oID1b1.addChild(oID1b1b);
 oID1b1a.addChild(oID1b1a1);
 oID1b1b.addChild(oID1b1a2);
}

void docBank() {
  DialogueNode docFirst = new DialogueNode("docFirst", "A man in a clean, white jacket sits behind the desk.");
  DialogueNode op1 = new DialogueNode("amog", "0 - Stand silently.");
  DialogueNode op2 = new DialogueNode("amog", "1 - Clear your throat.");
  DialogueNode op1r = new DialogueNode("amog", "After a while, he looks up. \"Ah, good to see you awake. That was quite the crash.\"\n\"You can't stay for long. There's a hurricane coming in the next day or two, although the latest reports suggest it'll be sooner rather than later.\"");
  DialogueNode op2r = new DialogueNode("amog", "He looks up. \"Ah, good to see you awake. That was quite the crash.\"\n\"You can't stay for long. There's a hurricane coming in the next day or two, although the latest reports suggest it'll be sooner rather than later.\"");
  //DialogueNode hur = new DialogueNode("a", "\"You can't stay for long. There's a hurricane coming in the next day or two, although the latest reports suggest it'll be sooner rather than later.\"");
  DialogueNode hur1r = new DialogueNode("a", "0 - \"Alright, I'll be on my way, then.\"");
  DialogueNode hur2r = new DialogueNode("a", "1 - \"How bad is the hurricane?\"");
  DialogueNode alr = new DialogueNode("a", "\"Not so fast. Your ship, damaged as it is, won't survive the flight.\"");
  DialogueNode bad = new DialogueNode("a", "\"Bad enough that you'll crash again if you try flying in that mess.\"");
  DialogueNode thx = new DialogueNode("0 - \"Okay, thanks for the info.\" [Leave.]");
  DialogueNode where = new DialogueNode("1 - \"Where can I repair my ship?\" [Leave.]");
  DialogueNode hope = new DialogueNode("\"I hope I won't see you in my clinic again, but if you need any medical assistance, you know where to find me.\"");
  DialogueNode mech = new DialogueNode("\"Talk to the Mechanic, she's bound to have something for you.\"");
  
  dialogueBank[0] = docFirst;
  docFirst.addChild(op1);  
  docFirst.addChild(op2);
  op1.addChild(op1r);
  op2.addChild(op2r);
  op1r.addChild(hur1r);
  op1r.addChild(hur2r);
  op2r.addChild(hur1r);
  op2r.addChild(hur2r);
  hur1r.addChild(alr);
  hur2r.addChild(bad);
  alr.addChild(thx);
  alr.addChild(where);
  bad.addChild(thx);
  bad.addChild(where);
  thx.addChild(hope);
  where.addChild(mech);
  //hur.addChild(hur1r);
  //hur.addChild(hur2r);
  // read from file into the dialoguenode data structure
}

void mechBank() {
  DialogueNode mechFirst = new DialogueNode("a", "A woman in overalls fixes an engine in the center of the store. As you approach, she takes off her soot-stained goggles.\n\"Hey there, offworlder. Doc told me you were stopping by.\"");
  DialogueNode gen = new DialogueNode("0 - \"What's for sale?\"");
  DialogueNode spec = new DialogueNode("1 - Think about the parts you need.");
  DialogueNode wait = new DialogueNode("She continues fiddling with the engine.");
  DialogueNode aft = new DialogueNode("0 - \"Do you have an Afterburner?\"");
  DialogueNode aftop = new DialogueNode("\"Yeah, I've got some of those. 100MN, 1KMN, but I'm not sure what size ship you're flying.\"");
  DialogueNode frig = new DialogueNode("0 - \"A frigate.\"");
  DialogueNode naft = new DialogueNode("1 - No, something else.");
  DialogueNode wait2 = new DialogueNode("Something sparks in the engine, and she swears under her breath.");
  DialogueNode shi = new DialogueNode("0 - \"Do you have a Shield Extender\"");
  DialogueNode nshi = new DialogueNode("1 - Not that either. Something else.");
  DialogueNode wait3 = new DialogueNode("She moves to the other side of the engine, continuing her work.");
  DialogueNode mpl = new DialogueNode("0 - \"Do you have Metal Plates?\"");
  DialogueNode nmpl = new DialogueNode("1 - Not that.");
  DialogueNode bruh = new DialogueNode("That's all the parts you need. You haven't forgotten anything. In fact, you've been standing here, staring off into space, for the past minute or so.");
  DialogueNode leave = new DialogueNode("0 - \"I'll come back later.\" [Leave.]");
  DialogueNode stay = new DialogueNode("1 - Go back. Go over the parts you need again.");
  DialogueNode bye = new DialogueNode("\"Have a good one, offworlder!\"");
  
  dialogueBank[1] = mechFirst;
  mechFirst.addChild(gen);
  mechFirst.addChild(spec);
  spec.addChild(wait);
  wait.addChild(aft);
  wait.addChild(naft);
  naft.addChild(wait2);
  wait2.addChild(shi);
  wait2.addChild(nshi);
  nshi.addChild(wait3);
  wait3.addChild(mpl);
  wait3.addChild(nmpl);
  nmpl.addChild(bruh);
  bruh.addChild(leave);
  bruh.addChild(stay);
  leave.addChild(bye);
  stay.addChild(wait);
}
