import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _tab = <Tab>[
    const Tab(
      text: 'Railway',
      icon: Icon(Icons.directions_railway),
    ),
    const Tab(
      text: 'Subway',
      icon: Icon(Icons.directions_subway),
    ),
    const Tab(
      text: 'Walk',
      icon: Icon(Icons.directions_walk),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: _tab.length,
            child: Scaffold(
              appBar: AppBar(
                  title: const Text('Tab Transition'),
                  bottom: TabBar(tabs: _tab)),
              body: const TabBarView(
                children: <Widget>[
                  TabPage(icon: Icons.directions_railway, title: 'Railway'),
                  TabPage(icon: Icons.directions_subway, title: 'Subway'),
                  TabPage(icon: Icons.directions_walk, title: 'Walk'),
                ],
              ),
            )));
  }
}

class TabPage extends StatelessWidget {
  final IconData icon;
  final String title;

  const TabPage({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4!;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 72.0, color: textStyle.color),
        Text(title, style: textStyle),
      ],
    ));
  }
}
