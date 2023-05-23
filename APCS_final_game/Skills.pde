
//these things do nothing for now 
 int intelligence = 0; 
 int psyche = 0; 
 int physique = 0; 
 int motorics = 0; 
 
 //rolls 2 6 sided die, then add them together
 public int diceRoll(){
   return ((int)random(0, 6) + 1) + ((int)random(0, 6) + 1); 
 }
