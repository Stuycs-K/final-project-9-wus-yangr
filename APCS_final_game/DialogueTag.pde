class DialogueTag {
 boolean dialogueTag;
 
 DialogueTag(boolean trueFalse) {
   dialogueTag = trueFalse;
 }
 
 boolean getTag() {
   return dialogueTag;
 }
 
 // makes it true - DO NOT use this to make true tags false
 void changeTag() {
  dialogueTag = true; 
 }
}
