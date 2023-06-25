import 'dart:html';
import 'dart:indexed_db';
import 'dart:io';
import 'dart:math';

class RandomTree {
  int _maxDepth = 10;
  int _maxWeight = 100;
  List _Tree = [];
  //int _depth = 0;

  RandomTree({int maxDepth = 5, int maxWeight = 100}) {
    this._maxDepth = maxDepth; //1 + Random().nextInt(maxDepth);
    this._maxWeight = maxWeight;
    _generateFTree(maxDepth: _maxDepth);
  }

  int? _generateFTree(
      {int? parent = null, required int maxDepth, int depth = 0}) {
    int leftDepth = maxDepth - 1; //Random().nextInt(maxDepth);
    int rightDepth = maxDepth - 1; //Random().nextInt(maxDepth);
    _Tree.add({
      "left": null,
      "value": Random().nextInt(_maxWeight),
      "right": null,
      "parent": parent
    });
    int currentIndex = _Tree.length - 1;

    _Tree[currentIndex]["left"] = (leftDepth != 0)
        ? _generateFTree(parent: currentIndex, maxDepth: leftDepth)
        : null;
    _Tree[currentIndex]["right"] = (rightDepth != 0)
        ? _generateFTree(parent: currentIndex, maxDepth: rightDepth)
        : null;
    if (parent == null)
      return null;
    else
      return currentIndex;
  }

  int? _generateTree(
      {int? parent = null, required int maxDepth, int depth = 0}) {
    int leftDepth = Random().nextInt(maxDepth);
    int rightDepth = Random().nextInt(maxDepth);
    _Tree.add({
      "left": null,
      "value": Random().nextInt(_maxWeight),
      "right": null,
      "parent": parent
    });
    int currentIndex = _Tree.length - 1;

    _Tree[currentIndex]["left"] = (leftDepth != 0)
        ? _generateTree(parent: currentIndex, maxDepth: leftDepth)
        : null;
    _Tree[currentIndex]["right"] = (rightDepth != 0)
        ? _generateTree(parent: currentIndex, maxDepth: rightDepth)
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

  int calculateDepth({int currentIndex = 0}) {
    if (_Tree == []) return 0;
    int leftDepth = (_Tree[currentIndex]["left"] == null)
        ? 0
        : calculateDepth(currentIndex: _Tree[currentIndex]["left"]);
    int rightDepth = (_Tree[currentIndex]["right"] == null)
        ? 0
        : calculateDepth(currentIndex: _Tree[currentIndex]["right"]);
    return 1 + max(leftDepth, rightDepth);
  }

  List restructure(int depth) {
    int totalItems = (pow(2, depth) - 1) as int;
    // generate null list
    List restructuredTree = List<int?>.filled(totalItems, null);

    // set Index
    
    restructuredTree[0] = 0;
    _Tree.forEach((element) {
      
    })

    return restructuredTree;
  }

  printTree() {
    int depth = calculateDepth();
    if (depth == 0) return;
    //List temp = restructure(depth);
    print(restructure(depth));
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
  //print('before: ${rTree._Tree}, length: ${rTree._Tree.length}');
  rTree.printTreeIO();
  print("");
  //rTree.deleteValues((int value) => value < 50);
  //print('after: ${rTree._Tree}, length: ${rTree._Tree.length}');
  //rTree.printTreeIO();
  print(rTree.calculateDepth());
  rTree.printTree();
  print("");
}
