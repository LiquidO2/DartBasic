//late String description;

import 'dart:io';

void main() {
  /*
    nullable data types: (default value 'null')
      1. var -  value can be changed later, not type
      2. dynamic - both type and value can be changed later
  */

  dynamic nullable;
  print(nullable);

  /*
    non nullable built in types: (can use '?' to make these nullable)
      - Numbers (int, double)
      - Strings (String)
      - Booleans (bool)
      - Records ((value1, value2))
      - Lists (List, also known as arrays)
      - Sets (Set)
      - Maps (Map)
      - Runes (Runes; often replaced by the characters API)
      - Symbols (Symbol)
      - The value null (Null)
      ///doc: https://dart.dev/language/built-in-types
  */

  num number = 3.1415;
  print(number);

  Object? forcedNullable;
  print(forcedNullable);

  /* 
    'late' can be used to initialize non nullable types for variables later after declaration and before using the variable.
    comonly used for global (top level) variables and instance variables
  */

  late num number2;
  number2 = 5;
  print(number2);

  /// record
  // Type annotation (data typ, data type)

  (int, int a) rec = (2, 5); // okay
  // (int, int) rec = (2, a: 5) // not okay
  (int, int, {int a}) rec2 = (
    2,
    a: 5,
    3
  ); // okay positional fields must annotated first, but you can put you can put the named fields whereever you while assigning values.

  print('record: $rec');
  print('record2: $rec2');

  print('record value at index 0: ${rec.$1}'); // index starts at 1 for records
  print(
      'record2 value at index 1: ${rec.$1}'); // prints 3. when the value is accessed with index number, it skips the named fields.

  /// list , basically an array
  var list = [1, 2, 3];
  print('list: ${list[1]}');

  /// collection of unique values
  var set = {2.3, 2.3, 5, 9};
  print('set: ${set.elementAt(1)}'); // second 2.3 is completely ignored.

  /// map, key-value pairs
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  print('map: ${gifts["first"]}');

  var promoActive = false;
  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (promoActive) 'Outlet'
  ]; // if condition to set an element, works will all collections

  print('list with condition: ${nav}');

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['userid: 0', for (var i in listOfInts) 'userid: $i'];
  print('for within list: $listOfStrings');

  /* 
    Final & Constant
    1. final - run time constant. can be initialized in runtime.
    2. const - compile time constant. has to be initialized during compilaton.
  */
  final fin = stdin.readLineSync();
  print('final: $fin');

  // const con = stdin.readLineSync(); // wont work
  const con = 5; // works
  print('con: $con');
}
