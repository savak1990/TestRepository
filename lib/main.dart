import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Word generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _randomPhrase = '';

  void _handleMessageButton() {
    setState(() {
      String adj = generateAdjective().elementAt(0).toString().toLowerCase();
      String noun = generateNoun().elementAt(0).toString().toLowerCase();
      _randomPhrase = '$adj $noun';
    });
  }

  void _handleShareButton() {
    // TODO
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
          children: <Widget>[
            Text(
              _randomPhrase == ''
                  ? 'Press message button to generate phrase'
                  : 'Generated random phrase:',
            ),
            Text(
              '$_randomPhrase',
              style: Theme.of(context).textTheme.display2,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _handleMessageButton,
            tooltip: 'Generate',
            child: Icon(Icons.message),
          ),
          FloatingActionButton(
            onPressed: _handleShareButton,
            tooltip: 'Share',
            child: Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}
