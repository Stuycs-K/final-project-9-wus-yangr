class DialogueNode {
  String id;
  String dialogue;
  ArrayList<DialogueNode> parents;
  ArrayList<DialogueNode> children;

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
}
