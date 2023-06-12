class DialogueNode {
  String id;
  // ignore this statement for now: if interactable is true, the dialogue is the interactable's and player shouldn't be allowed to input commands
  boolean interactable;
  DialogueTag changeTag;
  String dialogue;
  ArrayList<DialogueNode> parents;
  ArrayList<DialogueNode> children;
  
  DialogueNode(String dialogue) {
    this.dialogue = dialogue;
    parents = null;
    children = new ArrayList<DialogueNode>();
  }
  
  DialogueNode(boolean interactable, String dialogue) {
    this.interactable = interactable;
    this.dialogue = dialogue;
    parents = null;
    children = new ArrayList<DialogueNode>();
  }

  // typically used for dialogues that end a tree or add an item to the inventory
  DialogueNode(String id, String dialogue) {
    this.id = id;
    this.dialogue = dialogue;
    parents = null;
    children = new ArrayList<DialogueNode>();
  }
  
  // dialogue that can change tags
  DialogueNode(String id, DialogueTag changeTag, String dialogue) {
    this.id = id;
    this.changeTag = changeTag;
    this.dialogue = dialogue;
    parents = null;
    children = new ArrayList<DialogueNode>();
  }
  
  boolean isInt() {
    return interactable;
  }

  void addParent(DialogueNode parent) {
    parents.add(parent);
  }

  void addChild(DialogueNode child) {
    children.add(child);
  }

  String text() {
    return dialogue;
  }

  DialogueNode getChild(int childIndex) {
    return children.get(childIndex);
  }
  
  ArrayList<DialogueNode> getChildren() {
    return children;
  }
  
  boolean hasChild() {
    return(children.size() > 0);
  }
  
  String getString(){
    return id;
  }
  
  void changeTag() {
    changeTag.changeTag();
  }
  
  // wipes the entire dialogue tree to allow different trees to be constructed 
  void bereavement() {
    if (children.size() > 0) {
      for (int i = children.size()-1; i >= 0; i--) {
        children.get(i).bereavement();
        children.remove(i);
      }
    }
  }
}
