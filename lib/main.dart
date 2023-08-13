import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _quoteList = [
    'หลายโลนะ เเต่ไม่หลายใจ',
    'ทุกการเติบโต ย่อมปวดหลังเสมอ',
    'อยากลองขัดใจ แต่หาสก็อตไบร์ทไม่เจอ',
    'คงมีแต่พระ ที่ต้องการฉัน',
    'แคปชั่นไม่รู้ แคปหมูไม่แน่',
  ];
  static const List<MaterialColor> _colorList = [
    Colors.cyan, Colors.amber, Colors.blue, Colors.pink, Colors.green, Colors.red,
  ];
  var _quote = _quoteList[0]; // state variable
  var _colors = _colorList[0];
  void handleClickGo() {
    var rand = Random();

    String newQuote;
    do{
      var randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    } while (newQuote == _quote);

    MaterialColor newColor;
    do{
      var randomIndex = rand.nextInt(_colorList.length);
      newColor = _colorList[randomIndex];
    } while (newColor == _colors);

    setState(() {
      _quote = newQuote;
      _colors = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            _quote,
            style: TextStyle(
              color: _colors,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
