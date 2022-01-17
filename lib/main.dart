import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'engine.dart';
import 'home_page.dart';

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
        scaffoldBackgroundColor: const Color(0xFF4C2C11)
      ),
      home: ChangeNotifierProvider(
        create: (context) => Engine(),
        child: const HomePage(),
      ),
    );
  }
}
