import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/screens/home_screen.dart';

import 'package:braille_abc/models/app_saves.dart';

@immutable
class BrailleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Saves.loadLessonProgress();
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "Braille App",
      home: HomeScreen(),
    );
  }
}
