import 'package:flutterapp/dog.dart';

class Shiba extends Dog {
  int age;

  Shiba(String name, this.age) : super(name);

  String sayAge() {
    return "shiba age is $age";
  }
}
