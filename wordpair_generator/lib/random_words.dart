import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final _randomWordPairs = <WordPair>[];
    final _savedWordPairs = Set<WordPair>();

    Widget _buildRow(WordPair pair) {
      final alreadySaved = _savedWordPairs.contains(pair);

      return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _savedWordPairs.remove(pair);
            } else {
              _savedWordPairs.add(pair);
            }
          });
        },
      );
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
        appBar: AppBar(title: Text('WordPair Generator')), body: _buildList());
  }
}
