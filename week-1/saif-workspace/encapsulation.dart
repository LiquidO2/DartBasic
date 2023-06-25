class User {
  var name; // public
  var _age; // private
  var _salary;

  /// getter methods
  int get age => _age;
  double get salary => _salary;

  /// setter methods
  void setAge(var age) => this._age = age;
  void setSalary(var salary) => this._salary = salary;
}
