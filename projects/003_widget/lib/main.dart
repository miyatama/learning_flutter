import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomWords(),
    );
  }
}

List<String> generateHello(int start, int n) {
  var _hs = <String>[];
  for (int i = start; i < start + n; i++) {
    _hs.add("Hello!" + i.toString());
  }
  return _hs;
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I love list'),
      ),
      body: _buildSuggesions(),
    );
  }

  Widget _buildSuggesions() {
    final _wordPairs = <String>[];
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();
      final int index = i ~/ 2;
      if (index >= _wordPairs.length) {
        _wordPairs.addAll(generateHello(index, 10));
      }
      return _buildRow(_wordPairs[index]);
    });
  }

  Widget _buildRow(String wordPair) {
    return ListTile(
      title: Text(wordPair),
    );
  }
}
