import 'dart:collection';
import 'dart:math';

class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class Assignment2 {
  Random random = Random();
  int maxDepth;
  int maxValue;

  Assignment2(this.maxDepth, this.maxValue);

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

          if (node.left != null || node.right != null) {
            queue.add(node.left);
            queue.add(node.right);
          }
        }

        if (i < levelSize - 1) {
          levelString += '  ';
        }
      }

      print(levelString);
    }
  }

  TreeNode? deleteNodes(TreeNode? node) {
    if (node == null) {
      return null;
    }

    node.left = deleteNodes(node.left);
    node.right = deleteNodes(node.right);

    if (node.value > 50) {
      if (node.left != null && node.left!.value < 50) {
        return node.left;
      } else if (node.right != null && node.right!.value < 50) {
        return node.right;
      } else {
        return null;
      }
    }

    return node;
  }

  void generateAndPrintTree() {
    TreeNode? root = generateTree(0);

    if (root != null) {
      print('Binary Tree (before deletion):\n');
      printTree(root);

      root = deleteNodes(root);

      print('\nBinary Tree (after deletion):\n');
      printTree(root);
    } else {
      print('Failed to generate a binary tree.');
    }
  }
}

void main() {
  Assignment2 generator = Assignment2(10, 100);
  generator.generateAndPrintTree();
}
