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
  var number3 = 5 / 2;
  number3 += 5;
  print(number3);
  var result = '5/2 = ${5 ~/ 2} r ${5 % 2}';
  print(result);

  if (number3 is double) {
    print(number3);
  }

  var nullVar;
  nullVar ??=
      15; // assigns 15 to nullVar because nullVar was null before the assignment
  print(nullVar);
  /*
    Conditional expressions
      - expr1 ?? expr2
        If expr1 is non-null, returns its value; otherwise, evaluates and returns the value of expr2.
   */
  print(playerName('SELISE'));
  print(playerName(null));

  // cascade and other operators to be revisited later
}

String playerName(String? name) => name ?? 'Guest';

/* Longer version of ^^this code
  String playerName(String? name) {
    if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }
*/