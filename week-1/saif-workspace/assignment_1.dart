// TreeNode max: 2
// maxDepth: 10
// Does not know the depth of its leaf
// Each Node will have max value of 100

// 2. value < 50 -> delete these and print again.

import 'dart:collection';
import 'dart:math';

class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class Assignment1 {
  Random random = Random();
  int maxDepth;
  int maxValue;

  Assignment1(this.maxDepth, this.maxValue);

  TreeNode? generateTree(int depth) {
    if (depth > maxDepth || random.nextInt(100) < 10) {
      return null;
    }

    TreeNode node = TreeNode(random.nextInt(maxValue) + 1);
    node.left = generateTree(depth + 1);
    node.right = generateTree(depth + 1);

    return node;
  }

  void printTree(TreeNode? root) {
    if (root == null) {
      return;
    }

    Queue<TreeNode?> queue = Queue<TreeNode?>();
    queue.add(root);

    while (queue.isNotEmpty) {
      int levelSize = queue.length;
      String levelString = '';

      for (int i = 0; i < levelSize; i++) {
        TreeNode? node = queue.removeFirst();

        if (node == null) {
          levelString += '   ';
        } else {
          levelString += ' ${node.value} ';

          if (node.left != null) {
            queue.add(node.left);
          } else {
            queue.add(null);
          }

          if (node.right != null) {
            queue.add(node.right);
          } else {
            queue.add(null);
          }
        }

        if (i < levelSize - 1) {
          levelString += '  ';
        }
      }

      print(levelString);
    }
  }

  void generateAndPrintTree() {
    TreeNode? root = generateTree(0);

    if (root != null) {
      print('Binary Tree:\n');
      printTree(root);
    } else {
      print('Failed to generate a binary tree.');
    }
  }
}

void main() {
  Assignment1 generator = Assignment1(10, 100);
  generator.generateAndPrintTree();
}
