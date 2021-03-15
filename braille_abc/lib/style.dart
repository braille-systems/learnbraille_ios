import 'package:flutter/cupertino.dart';

abstract class Styles {
  static Shadow buildButtonShadow() {
    return Shadow(
      offset: Offset(3.0, 3.0),
      blurRadius: 4.0,
      color: CupertinoColors.separator,
    );
  }

  static TextStyle helpTextStyle(){
    return TextStyle(fontSize: 19);
  }
}
