// FORMAT
/**
 boolean trueFalse = false;
 void nameBank() {
 DialogueNode dialogueThing = new DialogueNode(tag, "Dialogue here");
 
 dialogueBank[id%100] = dialogueThing;
 add children here
 }
 **/


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

DialogueTag spokeToDoc = new DialogueTag(false);
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
  DialogueNode hope = new DialogueNode("end", spokeToDoc, "\"If you need any medical assistance or just need information, you know where to find me.\"");
  DialogueNode mech = new DialogueNode("end", spokeToDoc, "\"Talk to the Mechanic, she's bound to have something for you.\"");

  // if you've spoken to him before:
  DialogueNode silence = new DialogueNode("After a while, he looks up. \"How's your ship?\"");
  DialogueNode notSilence = new DialogueNode("He looks up. \"How's your ship?\"");
  DialogueNode worldInfo = new DialogueNode("0 - \"Can you tell me more about this city?\"");
  DialogueNode sure = new DialogueNode("\"Sure. Do you want an overview of what it's like now or our history?\"");
  DialogueNode present = new DialogueNode("0 - \"Tell me about the present.\"");
  DialogueNode present1 = new DialogueNode("\"I'll start with the locations. You woke up in my clinic. People come to me for medical treatment.\"\n\"Your Ship's at the Dive Point. On normal days, people tether their skimmers and subs there, but everyone took theirs inside or underwater to prepare for the storm.\"\n\"Other than that, it's where people go diving. It's where you access the underwater district of Hailan- our city.\"");
  DialogueNode present1k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode present1slang = new DialogueNode("2 - \"Skimmers and subs?\"");
  DialogueNode present1slang2 = new DialogueNode("\"Ah, I forget offworlders don't know. Skimmers are easier to maintain, easier to produce. On-water travel. If you've been to the warehouse, you've probably seen a bunch of 'em.\"\n\"Subs are submarines. Underwater travel.\"");
  DialogueNode present2 = new DialogueNode("\"You can't go to the lower district. You don't have the parts to it. You gotta have cybernetic gills or purchase underwater equipment.\"\n\"The equipment stores are closed, though. Again, it's not a normal day.\"\n\"Next to the Dive Point is Watchman's place. He watches us. Big Johnny's right-hand man.\"");
  DialogueNode present2k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode present3 = new DialogueNode("\"Over yonder is the Hangar and Launchpad, the Warehouse, which has the Graveyard attached to it, and the Refinery.\"\n\"Most of the names are self-explanatory. The Graveyard's where all our scrap goes. There's some kid that hangs around there all the time.\"\n\"Not sure where his parents are. Probably underwater, like most of Hailan's residents.\"");
  DialogueNode present3k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode present4 = new DialogueNode("\"The Overlook's at the center of town, right where Central, Residential, and Industrial intersect. That's Johnny's place.\"\n\"Real windy up there. You get a view of the entire city. Well. The upper district, anyway.\"\n\"Back to my clinic. Next to mine, there's Security, the Visitor's Quarters, and the gate from Industrial to Central.\"");
  DialogueNode present4k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode present5 = new DialogueNode("\"Now, you might be thinking- Doc, why's your place in Industrial?\"\n\"All the accidents happen here. Refinery's a missing-finger generator. All the half-drownies get brought in from the Dive Point. Easy access to my clinic saves lives.\"\n\"Now to Central.\"");
  DialogueNode present5k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode present6 = new DialogueNode("\"The Mechanic's Shop is the first thing you see when you walk into Central. Then there's the equipment shop, the toolshed, and Pam's Diner.\"\n\"Only the Mechanic's Shop is open right now.\"\n\"Pam's a sweet lady, by the way. You ought to visit-\" He cuts himself off. \"Right. The storm. Ah, well. It's a shame you can't go.\"\n\"There's another Dive Point in Central, right next to Pam's Diner. It doesn't see as much traffic as the main one, but it's there.\"");
  DialogueNode present6k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode present7 = new DialogueNode("\"Residential's on the other side of Central if you keep taking the main path. The old housing is there. There's another dive point at the very end of Residential.\"\n\"That's the upper district for you.\"");
  DialogueNode pastfrompres = new DialogueNode("0 - \"Tell me about the past.\"");
  DialogueNode past = new DialogueNode("1 - \"Tell me about the past.\"");
  DialogueNode past1 = new DialogueNode("\"Well, okay. From the very beginning.\"\n\"Hailan- that's the name of this city, by the way- started as a mining colony. Basilisk Industries.\"\n\"I wasn't one of the original colonists. They sent me down after they lost their medic to a tsunami.\"");
  DialogueNode past1k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode past2 = new DialogueNode("\"This planet- also called Hailan, we're very original like that- has an abundance of valuable ores.\"\n\"Basilisk deployed a drill, an on-site refinery, a hangar, and a warehouse for long-term mining.\"\n\"That circular thing you see outside my clinic? Real ancient piece of tech, isn't she? That's the drill.\"");
  DialogueNode past2k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode past3 = new DialogueNode("\"As they kept mining, they found more and more ore, so they deployed more workers for the expedition.\"\n\"The months stretched into years. People started building semi-permanent housing, later becoming permanent housing.\"\n\"They brought their families. Shops. People built shops, too. We became a proper town.\"");
  DialogueNode past3k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode past4 = new DialogueNode("\"One day, the CEO of Basilisk was assassinated. Tangled with the wrong people, I presume.\"\n\"He was shot out over Hailan's sky. The explosion took our satellites with it, so we couldn't call for help.\"\n\"The execs took their shuttles and fled, leaving the rest of us stranded. We've been stranded ever since. Thirty years, give or take.\"");
  DialogueNode past4k = new DialogueNode("0 - [Keep listening.]");
  DialogueNode past5 = new DialogueNode("\"Johnny took over. We didn't have a leader, so he stepped up. He was somewhere high up in the security chain, I believe?\"\n\"Nobody remembers his real name, so we all call him Big Johnny.\"\n\"Anyway, you're the first visitor we've had in a while. Offworlders come and go, but Hailan's a backwater city on a backwater planet in a backwater star system.\"");
  DialogueNode stopListening = new DialogueNode("1 - \"Thanks for the info.\" [Leave.]");
  DialogueNode chitchat = new DialogueNode("1 - \"It's doing alright.\"");
  DialogueNode docDontChat = new DialogueNode("\"Good! That's good to hear.\"\nHe glances at his paperwork, drumming his fingers on the table.");
  DialogueNode docDontChatCont = new DialogueNode("0 - [Leave.]");
  DialogueNode docLeave = new DialogueNode("2 - [Leave.]");
  DialogueNode itsRepaired = new DialogueNode("3 - \"It's fully repaired.\"");
  DialogueNode docApproves = new DialogueNode("\"That is good news. So, you're leaving?\"");
  DialogueNode yeahLeave = new DialogueNode("0 - \"Yeah, I have to report back.\" [Leave.]");
  DialogueNode nahLeave = new DialogueNode("1 - \"Nah, I want to sightsee some more.\" [Leave.]");
  DialogueNode docHurry = new DialogueNode("end", "\"Alright. Do keep the storm in mind.\"");

  // wipes entire tree
  docFirst.bereavement();

  // It always starts with him behind the desk and silence/clear throat
  dialogueBank[0] = docFirst;

  if (!spokeToDoc.getTag()) {
    // branches here: If you haven't spoken to him before, he'll bring up you waking up and the crash
    op1.addChild(op1r);
    op2.addChild(op2r);
  } else {
    // if you have, he'll ask about your ship
    op1.addChild(silence);
    op2.addChild(notSilence);
    silence.addChild(worldInfo);
    silence.addChild(chitchat);
    silence.addChild(docLeave);
    notSilence.addChild(worldInfo);
    notSilence.addChild(chitchat);
    notSilence.addChild(docLeave);

    // worldInfo tree
    worldInfo.addChild(sure);
    
    // present
    sure.addChild(present);
    present.addChild(present1);
    present1.addChild(present1k);
    present1.addChild(stopListening);
    present1.addChild(present1slang);
    present1slang.addChild(present1slang2);
    present1slang2.addChild(present1k);
    present1k.addChild(present2);
    present2.addChild(present2k);
    present2.addChild(stopListening);
    present2k.addChild(present3);
    present3.addChild(present3k);
    present3.addChild(stopListening);
    present3k.addChild(present4);
    present4.addChild(present4k);
    present4.addChild(stopListening);
    present4k.addChild(present5);
    present5.addChild(present5k);
    present5.addChild(stopListening);
    present5k.addChild(present6);
    present6.addChild(present6k);
    present6.addChild(stopListening);
    present6k.addChild(present7);
    present7.addChild(pastfrompres);
    present7.addChild(stopListening);
    pastfrompres.addChild(past1);
    
    // past
    sure.addChild(past);
    past.addChild(past1);
    past1.addChild(past1k);
    past1.addChild(stopListening);
    past1k.addChild(past2);
    past2.addChild(past2k);
    past2.addChild(stopListening);
    past2k.addChild(past3);
    past3.addChild(past3k);
    past3.addChild(stopListening);
    past3k.addChild(past4);
    past4.addChild(past4k);
    past4.addChild(stopListening);
    past4k.addChild(past5);
    past5.addChild(present);
    past5.addChild(stopListening);
    stopListening.addChild(hope);

    chitchat.addChild(docDontChat);
    docDontChat.addChild(docDontChatCont);
    docDontChatCont.addChild(hope);
    docLeave.addChild(hope);

    // if your ship is repaired, you can tell him about it
    if (repaired) {
      silence.addChild(itsRepaired);
      notSilence.addChild(itsRepaired);
      itsRepaired.addChild(docApproves);
      docApproves.addChild(yeahLeave);
      docApproves.addChild(nahLeave);
      yeahLeave.addChild(docHurry);
      nahLeave.addChild(docHurry);
    }
  }
  docFirst.addChild(op1);
  docFirst.addChild(op2);

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
}

DialogueTag spokeToMech = new DialogueTag(false);
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
  DialogueNode bye = new DialogueNode("end", "\"Have a good one, offworlder!\"");
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

DialogueTag spokeToJohn = new DialogueTag(false);
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
  DialogueNode johnbye = new DialogueNode("end", "He doesn't offer a farewell, continuing to squint at the streets below.");

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

//falseShipBank is dialogue tree for the ship when it hasn't been repaired yet
//trueShipBank is dialogue tree for the repaired ship
void shipBank() {
  if (!repaired) {
    falseShipBank();
  } else {
    trueShipBank();
  }
}

void falseShipBank() {
  DialogueNode oID1 = new DialogueNode("Dial", "This is, presumably, your ship. It's tethered to the end of the dock. Blaster marks are evident on its hull.");
  DialogueNode oID1a = new DialogueNode("Choice", "0 - Repair it.");
  DialogueNode oID1b = new DialogueNode("Choice", "1 - Examine it.");
  DialogueNode oID1c = new DialogueNode("Choice", "2 - Leave.");
  DialogueNode oID1a1 = new DialogueNode("end", "You have all the items needed! It's time to repair your ship and get out of this city!");
  DialogueNode oID1a2 = new DialogueNode("end", "You do not have all the items needed. Come back later when all 3 items have been collected.");
  DialogueNode oID1b1 = new DialogueNode("end", "Although it looks pretty bad, no critical structural damage is evident.\nIt appears to have a damaged Afterburner and Shield Extender. Metal Plates are needed to fix the holes in its hull.");
  DialogueNode oID1c1 = new DialogueNode("end", "You decide to leave the wrecked ship and explore your surroundings. Maybe you could find some parts to repair the ship with around the city?");

  dialogueBank[3] = oID1;
  oID1.addChild(oID1a);
  oID1.addChild(oID1b);
  oID1.addChild(oID1c);
  oID1a.addChild(oID1a1);
  oID1a.addChild(oID1a2);
  oID1b.addChild(oID1b1);
  oID1c.addChild(oID1c1);
}

void trueShipBank() {
  DialogueNode oID1 = new DialogueNode("Dial", "Your ship is still a little banged up, but it's mostly repaired and you can leave the city at any time.");
  DialogueNode oID1a = new DialogueNode("Choice", "0 - Leave and continue to explore the city before the hurricane comes.");
  DialogueNode oID1b = new DialogueNode("Choice", "1 - Weep at the poor condition of your ship.");
  DialogueNode oID1a1 = new DialogueNode("end", "You decide to leave behind your ship and spend some more time exploring the city before its time. ");
  DialogueNode oID1b1 = new DialogueNode("end", "You break down in tears at the poor condition of your ship. Although it has been repaired enough to function, your beloved ship is still damaged all over. After weeping hysterically for a few minutes, you get up and decide to explore the city a little more.");
  dialogueBank[3] = oID1;
  oID1.addChild(oID1a);
  oID1.addChild(oID1b);
  oID1a.addChild(oID1a1);
  oID1b.addChild(oID1b1);
}
