import 'dart:math';

class RandomTree {
  //int _maxNodes = 2;
  int _Depth = 10;
  int _maxWeight = 100;
  List Tree = [];

  RandomTree({int maxDepth = 2, int maxWeight = 100}) {
    //this._maxNodes = maxNodes;
    this._Depth = 1 + Random().nextInt(maxDepth);
    this._maxWeight = maxWeight;
    _generateTree(depth: _Depth);
  }

  int? _generateTree({int? parent = null, required int depth}) {
    int leftDepth = Random().nextInt(depth);
    int rightDepth = Random().nextInt(depth);
    Tree.add({
      "left": null,
      "value": Random().nextInt(_maxWeight),
      "right": null,
      "parent": parent
    });
    int currentIndex = Tree.length - 1;
    //print(currentIndex);
    Tree[currentIndex]["left"] = (leftDepth != 0)
        ? _generateTree(parent: currentIndex, depth: leftDepth)
        : null;
    Tree[currentIndex]["right"] = (rightDepth != 0)
        ? _generateTree(parent: currentIndex, depth: rightDepth)
        : null;
    if (parent == null)
      return null;
    else
      return currentIndex;
  }

  deleteValues({int index = 0}) {
    //print('index: $index length: ${Tree.length}');
    while (index < Tree.length && Tree[index]["value"] < 50) {
      //replace current node's value with last node's value
      int lastIndex = Tree.length - 1;
      Tree[index]["value"] = Tree[lastIndex]["value"];

      // fix parentNode
      if (Tree[lastIndex]["parent"] != null) {
        int parentIndex = Tree[lastIndex]["parent"];
        if (Tree[parentIndex]["left"] == lastIndex) {
          //print("left: ${Tree[parentIndex]["left"]} lastindex: $lastIndex");
          Tree[parentIndex]["left"] = null;
        } else {
          //print("right: ${Tree[parentIndex]["right"]} lastindex: $lastIndex");
          Tree[parentIndex]["right"] = null;
        }
      }

      // remove last node
      Tree.removeLast();
    }

    if ((index < Tree.length) &&
        (Tree[index]["left"] != null) &&
        (Tree[index]["left"] < Tree.length))
      deleteValues(index: Tree[index]["left"]);
    if ((index < Tree.length) &&
        (Tree[index]["right"] != null) &&
        (Tree[index]["right"] < Tree.length))
      deleteValues(index: Tree[index]["right"]);
  }
}

void main() {
  RandomTree rTree = RandomTree();
  print('before: ${rTree.Tree}, length: ${rTree.Tree.length}');
  print("");
  rTree.deleteValues();
  print('after: ${rTree.Tree}, length: ${rTree.Tree.length}');
}
