void main() {
  var string = '''Multline 
string''';

  /// Regular For loop
  for (int i = 0; i < string.length; i++) print(string[i]);

  //Closures inside of Dart’s for loops capture the value of the index. This avoids a common pitfall found in JavaScript. For example, consider:
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add((x) => print(
        'clousure $x ${i + 1}')); // replaces 'i' variable with number and stores as a function
  }

  /// "For-in" loops can be used with iterable types, e.g: list, set
  for (var callback in callbacks) {
    callback(5);
  }

  /// For-in loop with patterns for cleaner processing of data

  var candidates = {Candidate('Sayed', 5), Candidate('Sadiq', 6)};

  for (var Candidate(:getName, :exp) in candidates) {
    // uses getter of the class
    var x = 'Name: ' + getName();
    print(x);
    print('exp: $exp');
  }

  // forEach with iterable collections
  void f(x) => print(x);
  candidates.forEach(
      f); // takes a function as parameter and sets the element as the argument

  // while, do while, break, continue implementations similar to C++

  candidates
      .where((element) => element.exp > 4)
      .forEach(print); // 'where' acts as the condition of the loop
}

class Candidate {
  var _name;
  var exp;

  Candidate(var name, var exp) {
    this._name = name;
    this.exp = exp;
  }

  String toString() {
    // overloaded toString function
    return "name: $_name, exp: $exp";
  }

  getName() => _name;
}
