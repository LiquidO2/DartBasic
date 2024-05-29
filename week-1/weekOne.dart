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

  var list = [1, 2, 3];   // using var is not a good practice, always define type if possible.
  print('list: ${list[1]}');

  double set = {2.3, 2.3, 5, 9};
  print('set: ${set.elementAt(1)}'); // second 2.3 is completely ignored.

  Map<'String', 'String'> gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  print('map: ${gifts["first"]}');

  bool promoActive = false;
  List<String> nav = [
    'Home',
    'Furniture',
    'Plants',
    if (promoActive) 'Outlet'
  ]; // if condition to set an element

  print('list with condition: ${nav}');

  List<int> listOfInts = [1, 2, 3];
  List<String> listOfStrings = ['userid: 0', for (var i in listOfInts) 'userid: $i'];
  print('for within list: $listOfStrings');

  /* 
    Final & Constant
    1. final - run time constant. can be initialized in runtime.
    2. const - compile time constant. has to be initialized during compilaton.
  */
  // final fin = stdin.readLineSync();
  // print(fin);

  const con = 3.1415;
  print(con);

  /* 
    Operators: Full list: https://dart.dev/language/operators
    Dart specific operators:
      Arithmatic Ops
      - '/'	Divide
      - '~/'	Divide, returning an integer result

      Type Test Ops
      - 'as'	Typecast (also used to specify library prefixes) // to be revisited after learning oop in dart
      - 'is'	True if the object has the specified type
      - 'is!'	True if the object doesn’t have the specified typ

      Assignment Ops
      - '??=' assign if variable is null

  */
  double number3 = 5 / 2;
  number3 += 5;
  print(number3);
  String result = '5/2 = ${5 ~/ 2}, remainder ${5 % 2}';
  print(result);

  if (number3 is double) {
    print(number3);
  }

  int? nullVar;   // made nullable by force using '?'
  int? nullVar;
  nullVar ??= 15; // assigns 15 to nullVar because nullVar was null before the assignment
  print(nullVar);
  /*
    Conditional expressions
      - expr1 ?? expr2
        If expr1 is non-null, returns its value; otherwise, evaluates and returns the value of expr2.
   */

  double? nullDouble;
  double assignValue = nullDouble ?? 5/2; // assigns 5/2 because nullDouble is null

  print(assignValue);
  nullDouble??=4.5;  // assigns 4.5 to nullDouble because it is null

  assignValue = nullDouble ?? 5/2;   // assigns nullDouble (4.5) to assignValue because nullDouble is no longer null
  print(assignValue);
  
  print(playerName('SELISE'));   // prints 'SELISE' because we are sending an String
  print(playerName(null));       // prints 'Guest' because we are sending null

  // cascade and other operators to be revisited later
}

String playerName(String? name) => name ?? 'Guest';    // returns Guest if name is null, otherwise returns name.

/* Longer version of ^^this code
  String playerName(String? name) {
    if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }
*/

