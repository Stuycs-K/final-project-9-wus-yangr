//we're going to add the beginning dialogue for each object to this array
DialogueNode[] dialogueBank = new DialogueNode[10];

//for testing dialogue() but format can be used for the actual initialization of the bank
void initializingTestBank() {
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
  DialogueNode docFirst = new DialogueNode(true, "A man in a clean, white jacket sits behind the desk.");
  DialogueNode op1 = new DialogueNode(false, "0 - Stand silently.");
  DialogueNode op2 = new DialogueNode(false, "1 - Clear your throat.");
  DialogueNode op1r = new DialogueNode(true, "After a while, he looks up. \"Ah, good to see you awake. That was quite the crash.\"\n\"You can't stay for long. There's a hurricane coming in the next day or two, although the latest reports suggest it'll be sooner rather than later.\"");
  DialogueNode op2r = new DialogueNode(true, "He looks up. \"Ah, good to see you awake. That was quite the crash.\"\n\"You can't stay for long. There's a hurricane coming in the next day or two, although the latest reports suggest it'll be sooner rather than later.\"");
  //DialogueNode hur = new DialogueNode("a", "\"You can't stay for long. There's a hurricane coming in the next day or two, although the latest reports suggest it'll be sooner rather than later.\"");
  DialogueNode hur1r = new DialogueNode(false, "0 - \"Alright, I'll be on my way, then.\"");
  DialogueNode hur2r = new DialogueNode(false, "1 - \"How bad is the hurricane?\"");
  DialogueNode alr = new DialogueNode(true, "\"Not so fast. Your ship, damaged as it is, won't survive the flight.\"");
  DialogueNode bad = new DialogueNode(true, "\"Bad enough that you'll crash again if you try flying in that mess.\"");
  DialogueNode thx = new DialogueNode(false, "0 - \"Okay, thanks for the info.\" [Leave.]");
  DialogueNode where = new DialogueNode(false, "1 - \"Where can I repair my ship?\" [Leave.]");
  DialogueNode hope = new DialogueNode(true, "\"I hope I won't see you in my clinic again, but if you need any medical assistance, you know where to find me.\"");
  DialogueNode mech = new DialogueNode(true, "\"Talk to the Mechanic, she's bound to have something for you.\"");

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
  DialogueNode sale = new DialogueNode("She waves a hand. \"All sorts of things. Sub parts, mostly. Used to be ships, but nobody's got any flightworthy ships these days, so I'm stuck with subs.\"\n\"Still got some ship parts for you, though. Shield Extenders, Afterburners, ammo, if you're so inclined. Some other turret modifications. The works.\"");
  DialogueNode saleinfo = new DialogueNode("0 - You need a Shield Extender and an Afterburner.");
  DialogueNode spec = new DialogueNode("1 - Think about the parts you need.");
  DialogueNode wait = new DialogueNode("She continues fiddling with the engine.");
  DialogueNode aft = new DialogueNode("0 - \"Do you have an Afterburner?\"");
  DialogueNode aftop = new DialogueNode("\"Yeah, I've got some of those. 100MN, 1KMN, but I'm not sure what size ship you're flying.\"");
  DialogueNode frig = new DialogueNode("0 - \"A frigate.\"");
  DialogueNode whty = new DialogueNode("1 - \"What's the difference?\"");
  DialogueNode frwhere = new DialogueNode("\"Ah... I don't have any Afterburners that size. The Graveyard has some frigate wrecks. You could look there.\"");
  DialogueNode shi = new DialogueNode("1 - \"Do you have a Shield Extender\"");
  DialogueNode shiy = new DialogueNode("\"I do.\"");
  DialogueNode shipay = new DialogueNode("0 - \"How much do you want for it?\"");
  DialogueNode payment = new DialogueNode("\"I've no use for Imperial credits, if that's what you have. Sorry. I'll take an offworlder favor, though.\"");
  DialogueNode deal = new DialogueNode("0 - \"Deal.\"");
  DialogueNode elaborate = new DialogueNode("1 - \"What kind of favor?\"");
  DialogueNode please = new DialogueNode("2 - \"C'mon, I really need to get offworld.\"");
  DialogueNode nodeal = new DialogueNode("3 - \"No deal.\"");
  DialogueNode dealyeah = new DialogueNode("\"Alright, good to hear. Here's my contact info. I'll give you a call, yeah?\"");
  DialogueNode shiask = new DialogueNode("1 - \"Can I have it?\"");
  DialogueNode charity = new DialogueNode("She laughs. \"This ain't a charity. Try again.\"");
  DialogueNode mpl = new DialogueNode("2 - \"Do you have Metal Plates?\"");
  DialogueNode mplno = new DialogueNode("\"Nope. Don't have those. Those got bought out during the Collapse. But...\" She scratches her chin.\n\"The Graveyard's bound to have some. All sorts of old tech gets dumped there. Ask Big Johnny for the keys past the gate.\"");
  DialogueNode naft = new DialogueNode("3 - No, something else.");
  //DialogueNode wait2 = new DialogueNode("Something sparks in the engine, and she swears under her breath.");
  //DialogueNode nshi = new DialogueNode("1 - Not that either. Something else.");
  //DialogueNode wait3 = new DialogueNode("She moves to the other side of the engine, continuing her work.");
  //DialogueNode nmpl = new DialogueNode("1 - Not that.");
  DialogueNode bruh = new DialogueNode("That's all the parts you need. You haven't forgotten anything. But with your head injury, it might be a good idea to double-check.");
  DialogueNode leave = new DialogueNode("4 - \"I'll come back later.\" [Leave.]");
  DialogueNode stay = new DialogueNode("1 - Go back. Go over the parts you need again.");
  DialogueNode bye = new DialogueNode("\"Have a good one, offworlder!\"");
  DialogueNode ret = new DialogueNode("0 - [Return to the list of parts.]");

  dialogueBank[1] = mechFirst;
  mechFirst.addChild(gen);
  gen.addChild(sale);
  sale.addChild(saleinfo);
  saleinfo.addChild(wait);
  mechFirst.addChild(spec);
  spec.addChild(wait);
  wait.addChild(aft);
  wait.addChild(shi);
  wait.addChild(mpl);
  wait.addChild(naft);
  wait.addChild(leave);
  aft.addChild(aftop);
  aftop.addChild(frig);
  frig.addChild(frwhere);
  frwhere.addChild(ret);
  ret.addChild(wait);
  //aftop.addChild(whty);
  shi.addChild(shiy);
  shiy.addChild(shipay);
  shiy.addChild(shiask);
  shipay.addChild(payment);
  shiask.addChild(charity);
  charity.addChild(shipay);
  payment.addChild(deal);
  deal.addChild(dealyeah);
  dealyeah.addChild(ret);
  mpl.addChild(mplno);
  mplno.addChild(ret);
  naft.addChild(bruh);
  bruh.addChild(ret);
  leave.addChild(bye);
  stay.addChild(wait);
}

void johnBank() {
  DialogueNode johnFirst = new DialogueNode("A man stares out of the window with a pair of binoculars.\n\"Pilot.\"");
  DialogueNode mechrec = new DialogueNode("0 - \"The Mechanic told me you could give me a gate key.\"");
  DialogueNode mechrecr = new DialogueNode("\"I can. Why should I?\"");
  DialogueNode givekey = new DialogueNode("0 - he gives you the key :) yay [Leave]"); // placeholder
  DialogueNode mpwhere = new DialogueNode("1 - \"Where can I get Metal Plates?\"");
  DialogueNode mppoint = new DialogueNode("He points at a stack of metal on the balcony. It's perched precariously near the edge, looking like a stiff breeze could send it tumbling into the abyss.\n\"Feel free to grab 'em.\"");
  DialogueNode grab = new DialogueNode("0 - Go onto the balcony and grab the Metal Plates.");
  DialogueNode johnimp = new DialogueNode("The winds tear at you as you step onto the balcony. With one arm wrapped tight around the railing, you grab the Metal Plates.\nBig Johnny, watching from the window, nods in approval.");
  DialogueNode gobackin = new DialogueNode("0 - Go back inside.");
  DialogueNode dontgrab = new DialogueNode("1 - \"That doesn't look safe.\"");
  DialogueNode offerkey = new DialogueNode("\"Well, didn't think you'd have the guts to do it. Ah well. Nice job. I suppose you want a key to the Graveyard?\"");
  DialogueNode sucks = new DialogueNode("\"Sucks to suck, buttercup. I'm not going out there.\"");
  DialogueNode johnbye = new DialogueNode("He doesn't offer a farewell, continuing to squint at the streets below.");

  dialogueBank[2] = johnFirst;
  johnFirst.addChild(mechrec);
  mechrec.addChild(mechrecr);
  mechrecr.addChild(givekey);
  givekey.addChild(johnbye);
  johnFirst.addChild(mpwhere);
  mpwhere.addChild(mppoint);
  mppoint.addChild(grab);
  mppoint.addChild(dontgrab);
  grab.addChild(johnimp);
  johnimp.addChild(gobackin);
  gobackin.addChild(offerkey);
  offerkey.addChild(givekey);
  dontgrab.addChild(sucks);
  sucks.addChild(grab);
}

////////////////////////////////////////////////////////////////////////////////////////
//BELOW ARE ITEM DIALOGUE BANKS
////////////////////////////////////////////////////////////////////////////////////////

void burnerBank() {
  DialogueNode oID1 = new DialogueNode("Dial", "You found the [Afterburner MN 100]! Would you like to pick up this item?");
  DialogueNode oID1a = new DialogueNode("Choice", "0 - Yes.");
  DialogueNode oID1b = new DialogueNode("Choice", "1 - No.");
  DialogueNode oID1a1 = new DialogueNode("Inventory", "Congratulations! [Afterburner MN 100] has been added to the inventory!");
  DialogueNode oID1b1 = new DialogueNode("Dial", "You go along on your way, leaving the [Afterburner MN 100] to collect dust for eternity.");

  dialogueBank[0] = oID1;
  oID1.addChild(oID1a);
  oID1.addChild(oID1b);
  oID1a.addChild(oID1a1);
  oID1b.addChild(oID1b1);
}

void shieldBank() {
  DialogueNode oID1 = new DialogueNode("Dial", "You found the [Small Shield Extender]! Would you like to pick up this item?");
  DialogueNode oID1a = new DialogueNode("Choice", "0 - Yes.");
  DialogueNode oID1b = new DialogueNode("Choice", "1 - No.");
  DialogueNode oID1a1 = new DialogueNode("Inventory", "Congratulations! [Small Shield Extender] has been added to the inventory!");
  DialogueNode oID1b1 = new DialogueNode("Dial", "You go along on your way, leaving the [Small Shield Extender] to collect dust for eternity.");

  dialogueBank[1] = oID1;
  oID1.addChild(oID1a);
  oID1.addChild(oID1b);
  oID1a.addChild(oID1a1);
  oID1b.addChild(oID1b1);
}

void plateBank() {
  DialogueNode oID1 = new DialogueNode("Dial", "You found the [Metal Plates]! Would you like to pick up this item?");
  DialogueNode oID1a = new DialogueNode("Choice", "0 - Yes.");
  DialogueNode oID1b = new DialogueNode("Choice", "1 - No.");
  DialogueNode oID1a1 = new DialogueNode("Inventory", "Congratulations! [Metal Plates] has been added to the inventory!");
  DialogueNode oID1b1 = new DialogueNode("Dial", "You go along on your way, leaving the [Metal Plates] to collect dust for eternity.");

  dialogueBank[2] = oID1;
  oID1.addChild(oID1a);
  oID1.addChild(oID1b);
  oID1a.addChild(oID1a1);
  oID1b.addChild(oID1b1);
}

////////////////////////////////////////////////////////////////////////////////////////
//SPACESHIP DIALOGUE
////////////////////////////////////////////////////////////////////////////////////////
void shipBank() {
  DialogueNode oID1 = new DialogueNode("Dial", "This is your crashed spaceship that you need to repair. You need to find an afterburner, a shield extender, and some metal plates.");
  DialogueNode oID1a = new DialogueNode("Choice", "0 - Repair it.");
  DialogueNode oID1b = new DialogueNode("Choice", "1 - Leave.");
  DialogueNode oID1a1 = new DialogueNode("Ending", "You have all the items needed! You can repair your ship!");
  DialogueNode oID1a2 = new DialogueNode("Dial", "You do not have all the items needed. Come back later when all 3 items have been collected.");
  DialogueNode oID1b1 = new DialogueNode("Dial", "You go along on your way, leaving the [Metal Plates] to collect dust for eternity.");

  dialogueBank[2] = oID1; // the index for this needs to be changed later depending on what the index of the ship is going to be 
  oID1.addChild(oID1a);
  oID1.addChild(oID1b);
  oID1a.addChild(oID1a1);
  oID1a.addChild(oID1a2);
  oID1b.addChild(oID1b1);
}
