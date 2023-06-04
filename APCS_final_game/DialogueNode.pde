class DialogueNode {
  String id;
  // id of 0 = Interactable speaking, id of 1 = Player speaking
  String dialogue;
  ArrayList<DialogueNode> parents;
  ArrayList<DialogueNode> children;
  
  DialogueNode(String dialogue) {
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

  boolean hasChild() {
    return(children.size() > 0);
  }
}
