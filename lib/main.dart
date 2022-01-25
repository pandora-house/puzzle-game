import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'engine.dart';
import 'puzzle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle game',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF302A71)
      ),
      home: ChangeNotifierProvider(
        create: (context) => Engine(),
        child: const PuzzlePage(),
      ),
    );
  }
}
