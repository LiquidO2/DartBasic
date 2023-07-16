import "dart:io";

void main() {
  // If else implementation is same as C++

  var pair = [5, 6];

  // case can be used to check matching with a pattern
  // If the pattern matches the value, then the branch executes with any variables the pattern defines in scope.
  if (pair case [var x, var y]) print('$x, $y');

  // switch statements (similar to regular switch in c++)
  var command = stdin.readLineSync();

  switch (command) {
    case ('1'):
      print('Switch 1');
      continue label; // continue must have a label as the target. to go to the end of the switch block, use an empty label block at the end

    case '2':
    case '3':
      print('Switch: 2 & 3'); // runs for both 2 and 3
      break;
    label:
    default:
      print("Switch Default: $command");
  }

  // switch expressions

  var y = switch (command) {
    '1' => 'Switch: 1',
    '2' => 'Switch 2',
    _ => 'default $command'
  };

  print(y);

/*
    Cases do not start with the case keyword.
    A case body is a single expression instead of a series of statements.
    Each case must have a body; there is no implicit fallthrough for empty cases.
    Case patterns are separated from their bodies using => instead of :.
    Cases are separated by , (and an optional trailing , is allowed).
    Default cases can only use _, instead of allowing both default and _.
*/

  /// To set an optional guard clause after a case clause, use the keyword when. A guard clause can follow if case, and both switch statements and expressions.

  switch (pair) {
    case [int a, int b] when a < b:
      print('First element greater');
    case (int a, int b):
      print('First element $a not greater than $b');
    default:
      print('default');
  }

  /// Guards evaluate an arbitrary boolean expression after matching. This allows you to add further constraints on whether a case body should execute. When the guard clause evaluates to false, execution proceeds to the next case rather than exiting the entire switch.
}
