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
  final fin = stdin.readLineSync();
  print(fin);

  const con = 5;
  print(con);
}
