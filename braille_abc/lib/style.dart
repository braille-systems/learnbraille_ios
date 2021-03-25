import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors{
  static const Color barBackground = CupertinoColors.lightBackgroundGray;
  static const Color background = CupertinoColors.tertiarySystemBackground;
  static const Color first = Colors.orangeAccent;
  static const Color second = Colors.white;

  static const Color symbolText = Colors.black;
  static const Color symbol = Colors.black;
  static const Color symbolBoarder = Colors.black;
  static const Color symbolContainer = Colors.white;

  static const Color topBarText = Colors.black;
}

abstract class Styles {
  static Shadow buildButtonShadow() {
    return Shadow(
      offset: Offset(3.0, 3.0),
      blurRadius: 4.0,
      color: CupertinoColors.separator,
    );
  }

  static List<Shadow> buildStroke(double stroke) {
    return [
      Shadow(
        offset: Offset(-stroke, -stroke),
        color: CupertinoColors.darkBackgroundGray,
      ),
      Shadow(
        offset: Offset(stroke, -stroke),
        color: CupertinoColors.darkBackgroundGray,
      ),
      Shadow(
        offset: Offset(-stroke, stroke),
        color: CupertinoColors.darkBackgroundGray,
      ),
      Shadow(
        offset: Offset(stroke, stroke),
        color: CupertinoColors.darkBackgroundGray,
      ),
    ];
  }

  static TextStyle helpTextStyle() {
    return TextStyle(fontSize: 19);
  }
}
