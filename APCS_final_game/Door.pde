public class Door extends Interactable{
 int initialx, initialy, endx, endy; 
 public Door(int id, int x1, int y1, int x2, int y2){
   super(id); 
   initialx = x1; 
   initialy = y1; 
   endx = x2; 
   endy = y2; 
 }
 
 public void openDoor(){
   //non-working method due to more deliberation needed regarding dialogue 
   dialogue();
   playerX = endx; 
   playerY = endy; 
 }
}
