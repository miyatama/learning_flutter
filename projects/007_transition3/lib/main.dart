import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('akb 49')),
      drawer: Drawer(
          child: ListView(
        children: const <Widget>[
          DrawerHeader(
              child: Text('menu'),
              decoration: BoxDecoration(color: Colors.blue)),
          ListTile(
            title: Text('fantazy'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text('fantazuma'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text('hashimoto kanna'),
            trailing: Icon(Icons.arrow_forward),
          )
        ],
      )),
    );
  }
}
