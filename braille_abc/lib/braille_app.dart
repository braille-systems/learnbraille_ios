import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/home_screen.dart';

class BrailleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Позже тут должно появиться CupertinoApp,
    // но пока это изменение вызывает ошибку,
    // с которой не разбиралась
    return MaterialApp(
      title: "Braille App",
      home: HomeScreen(),
    );
  }
}
