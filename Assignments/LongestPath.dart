//import 'dart:async';
import 'dart:io';
import 'dart:math';

//import 'LongestPath.dart';

void main() {
  stdout.write('Row: ');
  int row = int.parse(stdin.readLineSync()!);
  stdout.write('Col: ');
  int column = int.parse(stdin.readLineSync()!);

  //print(matrix);
  print('src:');
  Point src =
      Point(int.parse(stdin.readLineSync()!), int.parse(stdin.readLineSync()!));
  print('dest:');
  Point dest =
      Point(int.parse(stdin.readLineSync()!), int.parse(stdin.readLineSync()!));

  //print('$row $column');

  //print(longestPath(row, column, src, dest));

  List paths = longestPath(row, column, src, dest, 4);

  for (List path in paths) {
    //print('cost: ${path[0]}');
    print('cost: ${path[0]}');
    print('src: ${src.x}, ${src.y}, dest: ${dest.x}, ${dest.y}');
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        Point cp = Point(i, j);
        if (cp == dest) {
          stdout.write(' O ');
        } else if (path[1].contains(cp)) {
          int index = path[1].indexOf(cp);
          if (path[1][index].x < path[1][index + 1].x) {
            if (cp == src)
              stdout.write('*↓*');
            else
              stdout.write(' ↓ ');
          } else if (path[1][index].x > path[1][index + 1].x) {
            if (cp == src)
              stdout.write('*↑*');
            else
              stdout.write(' ↑ ');
          } else if (path[1][index].y < path[1][index + 1].y) {
            if (cp == src)
              stdout.write('*→*');
            else
              stdout.write(' → ');
          } else if (path[1][index].y > path[1][index + 1].y) {
            if (cp == src)
              stdout.write('*←*');
            else
              stdout.write(' ← ');
          }
        } else
          stdout.write(' . ');
      }
      print('');
    }
  }

  //print(Point(dest.x + 1, dest.y));
}

List longestPath(int row, int column, Point src, Point dest,
    [int? numberOfPaths = null]) {
  List visited = [];
  List paths = [];
  paths.addAll(longestPaths(row, column, src, dest, visited)
      .where((element) => element[1]));

  for (List path in paths) {
    //path[2].reveresed;
    path.removeAt(1);
    path[1] = new List.from(path[1].reversed);
  }
  print('Total path found ${paths.length}');
  if (numberOfPaths != null && numberOfPaths < paths.length) {
    paths.removeRange(numberOfPaths, paths.length);
  }

  return paths;
}

List longestPaths(int row, int column, Point src, Point dest, List visited) {
  if (src == dest) {
    return [
      [
        0,
        true,
        [src]
      ]
    ];
  } else {
    visited.add(src);

    Point leftPoint = Point(src.x, src.y - 1);
    bool left = (leftPoint.y >= 0) && !visited.contains(leftPoint);

    Point rightPoint = Point(src.x, src.y + 1);
    bool right = (rightPoint.y < column) && !visited.contains(rightPoint);

    Point upPoint = Point(src.x - 1, src.y);
    bool up = (upPoint.x >= 0) && !visited.contains(upPoint);

    Point downPoint = Point(src.x + 1, src.y);
    bool down = (downPoint.x < row) && !visited.contains(downPoint);

    if (!left && !right && !up && !down) {
      return [
        [
          0,
          false,
          [src]
        ]
      ];
    }

    List returnValues = [];

    int vl = visited.length;
    //print('xxxx');
    //visited.removeRange(vl, visited.length);
    if (left)
      returnValues.addAll(longestPaths(row, column, leftPoint, dest, visited));
    visited.removeRange(vl, visited.length);
    if (right)
      returnValues.addAll(longestPaths(row, column, rightPoint, dest, visited));
    visited.removeRange(vl, visited.length);
    if (up)
      returnValues.addAll(longestPaths(row, column, upPoint, dest, visited));

    if (down)
      returnValues.addAll(longestPaths(row, column, downPoint, dest, visited));

    for (int i = 0; i < returnValues.length; i++) {
      returnValues[i][0]++;
      returnValues[i][2].add(src);
    }

    returnValues..sort((y, x) => (x[0]).compareTo((y[0])));

    return returnValues;
  }
}
