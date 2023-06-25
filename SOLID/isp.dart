abstract class Phone {
  void makeCall();
}

abstract class Email {
  void sendMail();
}

abstract class BrowseInternet {
  void browse();
}

class SmartWatch implements Phone {
  @override
  void makeCall() {
    print("Making call from smartwatch");
  }
}

class Mobile implements Phone, Email, BrowseInternet {
  @override
  void browse() {
    print("browsing from phone");
  }

  @override
  void makeCall() {
    print("Making call from Mobile");
  }

  @override
  void sendMail() {
    print("sending mail from mobile");
  }
}

void main(List<String> args) {
  var mobile = Mobile();
  mobile.makeCall();

  var watch = SmartWatch();
  watch.makeCall();
}
