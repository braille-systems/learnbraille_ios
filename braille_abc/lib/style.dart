import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {

  /// main UI color
  static const Color first = Colors.orangeAccent;
  /// UI color, that contrast to main (f.e: icons, text on main color)
  static const Color second = Colors.white;
  /// Navigation bar background color
  static const Color navigationBar = CupertinoColors.systemGrey5;

  /// Expandable list item background color
  static const Color expandBackground = CupertinoColors.tertiarySystemBackground;
  /// Expandable list item boarder color
  static const Color expandItemsBoarder =  CupertinoColors.inactiveGray;
  /// Expandable list item text color
  static const Color expandItemsText =  CupertinoColors.black;

  /// Braille symbol text color
  static const Color symbolText = Colors.black;
  static const Color symbol = Colors.black;
  static const Color symbolBoarder = Colors.black;
  static const Color symbolContainer = Colors.white;

  static const Color topBarText = Colors.black;

  static const Color continueBtnTextIcon = Colors.black;

  static const Color dotPress = Colors.black;
  static const Color dotOnPress = Colors.white;
  static const Color dotBoarder = Colors.black;

  static const Color sideBtn = Colors.black;
  static const Color sideIcon = Colors.white;

}

class AppDecorations{

  /*static ButtonStyle continueButton = ElevatedButton.styleFrom(
    primary: AppColors.first,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );*/

  static ButtonStyle sectionButton = ElevatedButton.styleFrom(
    primary: AppColors.first,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    textStyle: TextStyle(
      color: AppColors.second,
      shadows: <Shadow>[
        Styles.buildButtonShadow(),
      ],
    ),
  );

  static ButtonStyle menuButton = ElevatedButton.styleFrom(
    primary: AppColors.first,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    textStyle: TextStyle(
      color: AppColors.second,
      shadows: <Shadow>[
        Styles.buildButtonShadow(),
      ],
    ),
    padding: EdgeInsets.symmetric(vertical: 20),
  );

  static ButtonStyle changeDirButton = ElevatedButton.styleFrom(
    primary: AppColors.sideBtn,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
    padding: EdgeInsets.symmetric(vertical: 30),
  );

  static ButtonStyle nextButton = ElevatedButton.styleFrom(
    primary: AppColors.sideBtn,
    shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
    padding: EdgeInsets.symmetric(vertical: 30),
  );

  static BoxDecoration expansionSection = BoxDecoration(
  color: AppColors.first,
  borderRadius:  BorderRadius.circular(10));

  static BoxDecoration letterWidget =  BoxDecoration(
    color: AppColors.symbolContainer,
    border: Border.all(color: AppColors.symbolBoarder, width: 7.0),
    borderRadius: BorderRadius.circular(10.0),
  );

  static BoxDecoration studyItem = BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColors.expandItemsBoarder, width: 0.5)), shape: BoxShape.rectangle
  );
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
