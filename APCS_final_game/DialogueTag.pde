class DialogueTag {
 boolean dialogueTag;
 
 DialogueTag(boolean trueFalse) {
   dialogueTag = trueFalse;
 }
 
 boolean getTag() {
   return dialogueTag;
 }
 
 void changeTag() {
  dialogueTag = !dialogueTag; 
 }
}
