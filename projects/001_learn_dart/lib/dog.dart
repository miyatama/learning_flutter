class Dog with Sleep implements Jump {
  String name = "";

  Dog(this.name);

  String sayName() {
    return 'I am a $name';
  }

  void jump() {
    print('dog jump');
  }
}

class Jump {
  void jump() {
    print('pyonpyonpyokopyoko');
  }
}

mixin Sleep {
  void sleep() {
    print('zzzz....');
  }
}
