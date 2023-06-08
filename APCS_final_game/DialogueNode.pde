class DialogueNode {
  String id;
  // if interactable is true, the dialogue is the interactable's and player shouldn't be allowed to input commands
  boolean interactable;
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

  DialogueNode(String id, String dialogue) {
    this.id = id;
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
}
