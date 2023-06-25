class User {
  String name;
  int age;

  User(this.name, this.age);
}

/// Class to work on DB
class UserRepositroy {
  void saveToDataBase(User user) {
    // save user info into db
  }
}

/// Class to work on User's welcome and others.
class UserWelcome {
  void userWelcome(User user) {
    print('welcome ${user.name}');
  }
}
