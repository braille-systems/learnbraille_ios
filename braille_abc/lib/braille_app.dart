import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/screens/home_screen.dart';

class BrailleApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "Braille App",
      home: HomeScreen(),
    );
  }
}
