import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MainPage(),
        '/subpage': (BuildContext context) => SubPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Main'),
              TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/subpage'),
                  child: Text('transition'))
            ],
          ),
        ),
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  const SubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sub Page')),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sub'),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('back'))
          ],
        )),
      ),
    );
  }
}
