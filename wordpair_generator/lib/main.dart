import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: new RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final _randomWordPairs = <WordPair>[];

    Widget _buildRow(WordPair pair) {
      return ListTile(title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16)),);
    }

    Widget _buildList() {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, int item) {
          if (item.isOdd) return Divider();

          final index = item ~/ 2;

          if (index >= _randomWordPairs.length) {
            _randomWordPairs.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_randomWordPairs[index]);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Wordpair Generator'),
        ),
        body: _buildList());
  }
}
