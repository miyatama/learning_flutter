class GenericDog<T> {
  T name;

  GenericDog(this.name);

  void sayName() {
    print('my generic dog name is $name');
  }
}
