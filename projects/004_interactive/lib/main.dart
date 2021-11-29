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
      home: const MyForm(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  int _counter = 0;
  String _text = '';
  bool _active = false;
  double _value = 0.0;

  void _handlePressed() {
    setState(() {
      _counter++;
    });
  }

  void _handleText(String text) {
    setState(() {
      _text = text;
    });
  }

  void _handleSwitch(bool changed) {
    setState(() {
      _active = changed;
    });
  }

  void _handleSlider(double e) {
    setState(() {
      _value = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
            const SizedBox(height: 30),
            Container(
              width: 200,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: _handlePressed,
                child: Text('よいですね！'),
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    primary: Colors.white,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            Divider(),
            Text(
              '$_text',
              style: TextStyle(
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                  fontSize: 20),
            ),
            TextField(
              style: TextStyle(color: Colors.red),
              onChanged: _handleText,
            ),
            Divider(),
            Center(
              child: Icon(
                Icons.thumb_up,
                color: _active ? Colors.blueAccent : Colors.grey,
                size: 100.0,
              ),
            ),
            Switch(value: _active, onChanged: _handleSwitch),
            Divider(),
            Center(child: Text('slider value: $_value')),
            Slider(
              //label: '$_value',
              min: 0,
              max: 10,
              value: _value,
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.grey,
              divisions: 10,
              onChanged: _handleSlider,
            )
          ],
        )));
  }
}
