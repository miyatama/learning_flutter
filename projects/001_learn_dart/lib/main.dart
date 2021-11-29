import 'package:flutter/material.dart';
import 'package:flutterapp/circle.dart';
import 'package:flutterapp/dog.dart';
import 'package:flutterapp/dog2.dart';
import 'package:flutterapp/shiba.dart';
import 'package:flutterapp/generic_dog.dart';

void main() {
  print('hello world');
  print('Circle(2) = ${Circle(2).area}');
  print('Circle(2.0) = ${Circle(2.0).area}');
  print('fibonacchi(29) = ${fibonacchi(29)}');
  letsVariables();
  letsVariables2();

  Dog dog = Dog('pero');
  print('dog: ${dog.sayName()}');
  dog.jump();
  dog.sleep();

  Dog2 dog2 = Dog2('poco', 38);
  print('dog2: ${dog2.introduction}');

  Shiba shiba = Shiba('poro', 38);
  print('shiba say: ${shiba.sayAge()}');

  GenericDog gdog1 = GenericDog<String>('poizon');
  gdog1.sayName();

  GenericDog gdog2 = GenericDog<int>(8);
  gdog2.sayName();

  tryCatch();

  tryEnum();

  aFunc1();
  aFunc2();
  aFunc3();

  anonymousFunc();

  runApp(const MyApp());
}

void anonymousFunc() {
  var helloFunc = (name) {
    return 'hello $name';
  };
  print(helloFunc('miyata1'));

  var helloFunc2 = (name) => 'hello $name';
  print(helloFunc2('miyata2'));

  var names = ['pochi', 'saitou', 'goriken'];
  names.forEach((element) {
    print('tokugawa $element');
  });
}

void aFunc1() {
  print('hello world1');
  print('hello world2');
  print('hello world3');
}

void aFunc2() {
  print('hello async world');
  Future<String> future =
      Future.delayed(Duration(seconds: 10), () => 'hello delay world');
  future.then((message) => print('message is $message'));
  print('hello async last world');
}

void aFunc3() {
  printWithDelay('hello async world');
}

Future<void> printWithDelay(String message) async {
  await Future.delayed(Duration(seconds: 10));
  print('printWithDelay: $message');
}

enum Animal {
  Cat,
  Dog,
  Elephant,
}

void tryEnum() {
  Animal animal = Animal.Elephant;
  switch (animal) {
    case Animal.Cat:
      print('animal cat is ${animal}');
      break;
    case Animal.Dog:
      print('animal dog is ${animal}');
      break;
    case Animal.Elephant:
      print('animal elephant is ${animal}');
      break;
    default:
      print('animal unknown is ${animal}');
      break;
  }
}

void tryCatch() {
  try {
    print("tryCatch -> try");
    throw 'error of errors';
  } catch (e, s) {
    print('tryCatch -> catch');
    print(e);
    print('------');
    print(s);
  } finally {
    print('tryCatch -> finally');
  }
}

int addFunc(int a, int b) {
  return a + b;
}

int addFunc2(int a, int b) => a + b;

void letsVariables() {
  int i = 18;
  double d = 19.1;
  String text1 = 'Poison';
  String text2 = 'sorimachi';
  bool isSorimachi = false;
  var a = 123;
  dynamic b = 123;
  b = 'takashi';
  final c = 123;

  if (a > 1) {
    print('a is good(${a})');
  } else {
    print('a is no good(${a})');
  }

  switch (b) {
    case 0:
      print('b is good zero(${b})');
      break;
    default:
      print('b is not good zero(${b})');
  }
}

void letsVariables2() {
  var poisons = ['ajisai', 'kyouchikutou', 'yuri'];
  print('poisons: ${poisons}');
  print('poison: ${poisons[0]}');
  var list1 = <int>[];
  list1.add(100);
  list1.add(200);
  list1.add(300);
  print('list1: ${list1}');
  print('list1[0]: ${list1[0]}');

  // deprecated
  // var list2 = List<int>();
  List<int> list3 = [];

  var set1 = {"pochi", "hachi", "stationb"};
  Set set2 = {};
  set2.add("ikari");
  set2.add("shindhi");
  print('set: ${set1}');

  var map1 = {
    "hachi": "hachi!",
    "pochi": 12320,
  };
  print('map: ${map1}');
}

int fibonacchi(int n) {
  return n < 2 ? n : fibonacchi(n - 1) + fibonacchi(n - 2);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
