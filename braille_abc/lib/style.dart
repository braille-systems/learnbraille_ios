import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors{
  static const Color barBackground = CupertinoColors.lightBackgroundGray;
  static const Color background = CupertinoColors.tertiarySystemBackground;
  static const Color expandItemsBoarder =  CupertinoColors.inactiveGray;
  static const Color expandItemsText =  CupertinoColors.black;

  static const Color first = Colors.orangeAccent;
  static const Color second = Colors.white;

  static const Color symbolText = Colors.black;
  static const Color symbol = Colors.black;
  static const Color symbolBoarder = Colors.black;
  static const Color symbolContainer = Colors.white;

  static const Color topBarText = Colors.black;

  static const Color continueBtnTextIcon = Colors.black;

  static const Color dotPress = Colors.black;
  static const Color dotOnPress = Colors.white;
  static const Color dotBoarder = Colors.black;

  static const Color changeModeBtn = Colors.black;
  static const Color changeModeIcon = Colors.white;

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
