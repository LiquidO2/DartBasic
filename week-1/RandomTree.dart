import 'dart:io';
import 'dart:math';

class RandomTree {
  int _Depth = 10;
  int _maxWeight = 100;
  List _Tree = [];

  RandomTree({int maxDepth = 10, int maxWeight = 100}) {
    this._Depth = 1 + Random().nextInt(maxDepth);
    this._maxWeight = maxWeight;
    _generateTree(depth: _Depth);
  }

  int? _generateTree({int? parent = null, required int depth}) {
    int leftDepth = Random().nextInt(depth);
    int rightDepth = Random().nextInt(depth);
    _Tree.add({
      "left": null,
      "value": Random().nextInt(_maxWeight),
      "right": null,
      "parent": parent
    });
    int currentIndex = _Tree.length - 1;

    _Tree[currentIndex]["left"] = (leftDepth != 0)
        ? _generateTree(parent: currentIndex, depth: leftDepth)
        : null;
    _Tree[currentIndex]["right"] = (rightDepth != 0)
        ? _generateTree(parent: currentIndex, depth: rightDepth)
        : null;
    if (parent == null)
      return null;
    else
      return currentIndex;
  }

  deleteValues(Function condition, {int index = 0}) {
    while (index < _Tree.length && condition(_Tree[index]["value"])) {
      //replace current node's value with last node's value
      int lastIndex = _Tree.length - 1;
      _Tree[index]["value"] = _Tree[lastIndex]["value"];

      // fix parentNode
      if (_Tree[lastIndex]["parent"] != null) {
        int parentIndex = _Tree[lastIndex]["parent"];
        if (_Tree[parentIndex]["left"] == lastIndex) {
          _Tree[parentIndex]["left"] = null;
        } else {
          _Tree[parentIndex]["right"] = null;
        }
      }

      // remove last node
      _Tree.removeLast();
    }

    if ((index < _Tree.length) &&
        (_Tree[index]["left"] != null) &&
        (_Tree[index]["left"] < _Tree.length))
      deleteValues(condition,
          index: _Tree[index]["left"]); // delete values from left tree
    if ((index < _Tree.length) &&
        (_Tree[index]["right"] != null) &&
        (_Tree[index]["right"] < _Tree.length))
      deleteValues(condition,
          index: _Tree[index]["right"]); // delete values from right tree
  }

  printTreeIO({int index = 0}) {
    if (_Tree.isEmpty) return; // handling empty tree

    if (_Tree[index]["left"] != null) printTreeIO(index: _Tree[index]["left"]);
    stdout.write('${_Tree[index]["value"]} ');
    if (_Tree[index]["right"] != null)
      printTreeIO(index: _Tree[index]["right"]);
  }
}

void main() {
  RandomTree rTree = RandomTree();
  print('before: ${rTree._Tree}, length: ${rTree._Tree.length}');
  rTree.printTreeIO();
  print("");
  rTree.deleteValues((int value) => value < 50);
  print('after: ${rTree._Tree}, length: ${rTree._Tree.length}');
  rTree.printTreeIO();
  print("");
}
