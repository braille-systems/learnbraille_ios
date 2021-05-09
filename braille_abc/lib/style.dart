import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  /** Main App colors **/
  /// main UI color
  static const Color first = Colors.orangeAccent;
  /// UI color, that contrast to main (f.e: icons, text on main color)
  static const Color second = Colors.white;
  /// Navigation bar background color
  static const Color navigationBar = CupertinoColors.systemGrey5;
  /// Navigation bar text color
  static const Color navigationBarText = Colors.black;

  /** Expandable list style **/
  /// Expandable list item background color
  static const Color expandBackground = CupertinoColors.tertiarySystemBackground;
  /// Expandable list item boarder color
  static const Color expandItemsBoarder =  CupertinoColors.inactiveGray;
  /// Expandable list item text color
  static const Color expandItemsText =  CupertinoColors.black;

  /** Symbol widget style **/
  /// Braille symbol text color
  static const Color symbolText = Colors.black;
  /// Braille symbol symbol color
  static const Color symbol = Colors.black;
  /// Braille symbol boarder color
  static const Color symbolBoarder = Colors.black;
  /// Braille symbol widget default background color
  static const Color symbolContainer = Colors.white;
  /// Braille symbol widget correct answer background color
  static const Color correctAnswer = Colors.green;
  /// Braille symbol widget wrong answer background color
  static const Color wrongAnswer = Colors.red;

  /** Braille dots  style **/
  /// Braille filled dot
  static const Color dotPress = Colors.black;
  /// Braille not filled dot
  static const Color dotOnPress = Colors.white;
  /// Braille dot boarder
  static const Color dotBoarder = Colors.black;

  /** Side buttons which are located in the letter sections**/
  /// Side buttons color
  static const Color sideBtn = Colors.black;
  /// Side buttons icon color
  static const Color sideIcon = Colors.white;

  /** Other...**/
  /// Continue button text color (practice screen)
  static const Color continueBtnTextIcon = Colors.black;
  ///
  static const Color divider = Colors.black;
  /// About name text color
  static const Color aboutColor = CupertinoColors.activeBlue;

  static const Color lockColor = CupertinoColors.inactiveGray;
}


/// App button styles
class AppDecorations {
  static ButtonStyle navigationButton = ElevatedButton.styleFrom(
    primary: AppColors.first,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
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
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25))),
    padding: EdgeInsets.symmetric(vertical: 30),
  );

  static ButtonStyle changeDirStudyButton = ElevatedButton.styleFrom(
    primary: AppColors.first,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25))),
    padding: EdgeInsets.symmetric(vertical: 30),
  );

  static ButtonStyle hintButton = ElevatedButton.styleFrom(
    primary: AppColors.first,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))),
    padding: EdgeInsets.symmetric(vertical: 30),
  );

  static ButtonStyle nextButton = ElevatedButton.styleFrom(
    primary: AppColors.sideBtn,
    shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))),
    padding: EdgeInsets.symmetric(vertical: 30),
  );

  static BoxDecoration expansionSection = BoxDecoration(
      color: AppColors.first,
      borderRadius:  BorderRadius.circular(10));

  static BoxDecoration letterWidget(Color color) => BoxDecoration(
    color:color,
    border: Border.all(color: AppColors.symbolBoarder, width: 7.0),
    borderRadius: BorderRadius.circular(25.0),
  );

  static BoxDecoration studyItem = BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColors.expandItemsBoarder, width: 0.5)), shape: BoxShape.rectangle
  );

  static SizedBox getBackFortButtonPaddingTextScreen(BuildContext context) =>  SizedBox(
    height: ScreenParams.height(50, context),
  );

  static SizedBox getBackFortButtonPaddingLetterScreen(BuildContext context) => SizedBox(
  height: ScreenParams.height(2, context),
  width: ScreenParams.width(15, context),
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

  static TextStyle aboutTextStyle(){
    return TextStyle(
      fontSize: 25,

    );
  }

  static TextStyle helpTextStyle() {
    return TextStyle(fontSize: 19);
  }
}

class SizeT {
  final double height;
  final double width;
  SizeT(this.height, this.width);
}

class Sizes {
  static double lineSectionIconSize = 45;
  static double lineSectionFontSize = 22;
  static double settingNameFontSize = 21;
  static double settingDescriptionFontSize = 17;
  static double aboutIconSize = 40;
  static SizeT getBackFortButtonSize() => SizeT(29,15);
  static SizeT getModeTipButtonSize() => SizeT(12,15);
  static SizeT getModeButton() =>SizeT(34,15);
  static SizeT getLetterWidgetSize() => SizeT(45, 57);
}

class Routes{
  static Offset nextScreen = Offset(1.0, 0.0);
  static Offset previousScreen = Offset(-1.0, 0.0);
}
